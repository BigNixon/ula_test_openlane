module ula (
    input wire clk,en_in,
    input wire [2:0] op,
    input wire data_in,
    output reg [15:0] result
);
    
    reg [31:0] reg_data=0; 
    reg [15:0] reg_result=0;

    

    always @(posedge clk) begin
        if (en_in===1)
            reg_data <= {reg_data[30:0],data_in};
        else
            result <= reg_result;
    end

    always @(*)begin
        case (op)
            3'b000:
                reg_result = ~reg_data[31:16];
            3'b001:
                reg_result = reg_data[31:16] & reg_data[15:0];
            3'b010:
                reg_result = reg_data[31:16];
            3'b011:
                reg_result = reg_data[31:16] | reg_data[15:0];
            3'b100:
                reg_result = reg_data[31:16]-1;
            3'b101:
                reg_result = reg_data[31:16] + reg_data[15:0];
            3'b110:
                reg_result = reg_data[31:16] + ~reg_data[15:0] + 1;
            3'b111:
                reg_result = reg_data[31:16] + 1;
            default: 
                reg_result = 'b0;
        endcase
    end


endmodule