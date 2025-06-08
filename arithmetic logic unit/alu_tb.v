module alu_tb;

    // Testbench signals
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] sel;
    wire [3:0] result;

    // Instantiate the ALU module
    alu uut(
        .a(a),
        .b(b),
        .sel(sel),
        .result(result)
       );

    initial begin
        // Apply test vectors
        a = 4'b0110; b = 4'b1001; sel = 3'b000;
        #10;
        
        a = 4'b1001; b = 4'b1101; sel = 3'b001;
        #10;
        
        a = 4'b0101; b = 4'b0010; sel = 3'b010;
        #10;
        
        a = 4'b1010; b = 4'b1010; sel = 3'b011;
        #10;
        
        a = 4'bxxxx; b = 4'b0110; sel = 3'b100;
        #10;

        $finish;  // End simulation
    end

endmodule