`timescale 1ns/100ps

module t_MEM;

    reg [1:0] setting;
    reg [8:1] in;
    wire [8:1] out;

    
    MEM inst(out, in, setting);

    initial begin

        $dumpfile("MEM.vcd");
        $dumpvars(0, t_MEM);

        
        setting = 2'b10;
        in = "H";
        #10;
        setting = 2'b01;
        in = "E";
        #10;
        setting = 2'b00;
        in = "L";
        #10;
        setting = 2'b11;
        in = "L";
        #10;
        setting = 2'b10;
        in = "O";
        #10;
        setting = 2'b01;
        in = "W";
        #10;
        setting = 2'b00;
        in = "O";
        #10;
        setting = 2'b11;
        in = "R";
        #10;
        setting = 2'b10;
        in = "L";
        #10;
        setting = 2'b01;
        in = "D";
        #10;
        #10;
    end

    initial begin
        #1;
        $monitor("\n\t\tinput: %c output: %c\n", in, out);
    end

endmodule
