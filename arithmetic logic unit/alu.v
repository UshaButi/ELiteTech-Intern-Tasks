module alu(
    //inputs
    input [3:0] a  ,
    input [3:0] b  ,
    input [2:0] sel,
    //outputs
    output reg[3:0]result
    );
    
    always@(*)begin
    case(sel)
    3'b000 : result = a + b  ;
    3'b001 : result = a - b  ;
    3'b010 : result = a & b  ;
    3'b011 : result = a | b  ;
    3'b100 : result = ~b     ;
    default: result = 4'b0000;
    endcase
    
    
    end
endmodule
