module ula (
    input wire clk,en_in,
    input wire [15:0] A_operand,
    input wire [15:0] B_operand,
    input wire [3:0] op,
    output reg [15:0] result,
    output wire cycle_completed    // Signal to indicate cycle completion output
);

//HERE ARE THE INTERNAL COMPLETE REGISTERS AND SIGNALS

    reg [15:0] LowA;     // Registrador para a parte baixa de 16 bits
    reg [15:0] HighA;     // Registrador para a parte alta de 16 bits
    reg [15:0] LowB;     // Registrador para a parte baixa de 16 bits
    reg [15:0] HighB;     // Registrador para a parte alta de 16 bits
    reg [31:0] reg_data_A=0;
    reg [31:0] reg_data_B=0;  
    reg [63:0] reg_result=0;
    reg [1:0] state;               // Register to control the state of the machine output

    
//HERE IS THE INPUT - SPI(SERIAL/PARALLEL INTERFACE)
  always @(posedge clk or posedge reset) begin
    if (reset or !en_in)  begin
      LowA <= 16'b0; // Reinicializa a parte baixa em caso de reset
      HighA <= 16'b0; // Reinicializa a parte alta em caso de reset
      LowB <= 16'b0; // Reinicializa a parte baixa em caso de reset
      HighB <= 16'b0; // Reinicializa a parte alta em caso de reset
    end else begin
      LowA <= A_operand; // Atualiza a parte baixa com os dados de entrada
      HighA <= LowA; // A parte alta é atualizada com a parte baixa
      LowB <= B_operand; // Atualiza a parte baixa com os dados de entrada
      HighB <= HighB; // A parte alta é atualizada com a parte baixa
    end
  end

  always @(posedge clk) begin
    if (reset or !en_in ) begin
        reg_data_A <= 32'b0; // Reinicializa o valor de saída em caso de reset
        reg_data_B<= 32'b0;
    end else begin
        reg_data_A <= {HighA, LowA}; // Combina a parte alta e a parte baixa
        reg_data_B <= {HighB,LowB}.
    end
  end
//OUTPUT STATE MACHINE SPI(SERIAL/PARALLEL INTERFACE)
  always @(posedge clk or posedge reset) begin
    if (reset or !en_in) begin
      state <= 2'b00;            // Reset the state in case of reset
    end else begin
      case (state)
        2'b00: result <= reg_result[15:0]; // Store the first 16 bits
        2'b01: result <= reg_result[31:16]; // Store the next 16 bits
        2'b10: result <= reg_result[47:32]; // Store the next 16 bits
        2'b11: result <= reg_result[63:48]; // Store the last 16 bits
      endcase

      if (state == 2'b11) begin
        state <= 2'b00;          // Reset the state for the next cycle
        cycle_completed <= 1'b1; // Set the cycle completed signal
      else
        state <= state + 1'b1;   // Advance to the next state
        cycle_completed <= 1'b0; // Set the cycle completed signal to 0
      end
    end
   end

    always @(*)begin
        case (op)
            4'b0000:
                reg_result = ~reg_data_A;
            4'b0001:
                reg_result = reg_data_A & reg_data_B;
            4'b0010:
                reg_result = reg_data_A;
            4'b0011:
                reg_result = reg_data_A | reg_data_B;
            4'b0100:
                reg_result = reg_data_A;
            4'b0101:
                reg_result = reg_data_A + reg_data_B;
            4'b0110:
                reg_result = reg_data_A + ~reg_data_B + 1;
            4'b0111:
                reg_result = reg_data_A + 1;
            4'b1000:
                reg_result = reg_data_A * reg_data_B;
            4'b1001:
                reg_result = reg_data_A / reg_data_B;
            4'b1010://16bitsMUl
                reg_result = reg_data_A[15:0] * reg_data_B[15:0];
            default: 
                reg_result = 'b0;
        endcase
    end


endmodule