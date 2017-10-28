`timescale 1ns/100ps

module t_MEM;

    reg [1:0] setting;
    reg [8:1] in;
    wire [8:1] out;

    
    MEM inst(out, in, setting);

    initial begin

        $dumpfile("MEM.vcd");
        $dumpvars(0, t_MEM);

        in = "A";
        setting = 2'b01;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
        #10;
    end

    initial begin
        #1;
        $monitor("\t\tinput: %c output: %c", in, out);
    end

endmodule
