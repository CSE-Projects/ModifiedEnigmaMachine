`timescale 1ns/100ps

module t_MEM;

    reg [1:0] setting;
    reg [8:1] in;
    wire [8:1] out;

    
    MEM inst(out, in, setting);

    initial begin

        $dumpfile("MEM.vcd");
        $dumpvars(0, t_MEM);

        in = "H";
        setting = 2'b11;
        #10;
        in = "E";
        setting = 2'b10;
        #10;
        in = "L";
        setting = 2'b10;
        #10;
        in = "L";
        setting = 2'b11;
        #10;
        in = "O";
        setting = 2'b10;
        #10;
        in = "W";
        setting = 2'b10;
        #10;
        in = "O";
        setting = 2'b11;
        #10;
        in = "R";
        setting = 2'b10;
        #10;
        in = "L";
        setting = 2'b10;
        #10;
        in = "D";
        setting = 2'b10;
        #10;
        #10;
    end

    initial begin
        #1;
        $monitor("\n\t\tinput: %c output: %c\n", in, out);
    end

endmodule
