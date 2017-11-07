`timescale 1ns/100ps

// TEST BENCH

/*
        TITLE: THE MODIFIED ENIGMA MACHINE

        REG NO: 16CO154-16CO233

        ABSTRACT: A circuit that encrypts data by mapping each alphabet to another alphabet randomly. 
                  This will be done in such a way that if the same alphabet is repeated, 
                  the encrypted alphabet will not be the same always.

        FUNCTIONALITIES: The following modules are present

                            a) Encoder: It is an alphabet to binary encoder
                            b) Decoder: It is a binary to alphabet decoder
                            
                            There is an input array- setting, which helps in deciding which block must encode/decode data
                            
                            c) Block 1,2,3 and 4: Blocks which encode/decode data using boolean equations

        BRIEF DESCRIPTION OF CODE:  The user enters some data (given in test-bench) and sets a code to encrypt the data.
                                    This data is then encrypted in the following module and then displayed.
                                    For decrypting the same data must be entered with same settings.
                                    For making the process easier there is an alphabet-binary encoder along with a binary-alphabet decoder.
*/

module Verilog_154_233;

    reg [1:0] setting;
    reg [8:1] in;
    wire [8:1] out;

    
    VerilogDM_154_233 inst(out, in, setting);
    
	// input combinations 
    initial begin

        $dumpfile("VerilogDM-154-233.vcd");
        $dumpvars(0, Verilog_154_233);

        $display("\n\n ================== THE MODIFIED ENIGMA MACHINE ==================\n");
        $display("\n\t------ ENCRYPTING: \"HELLOWORLD\", SETTINGS: 2103 ------\n");

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

        $display("\n\t------ DECRYPTING: \"CSYQGKAHDC\", SETTINGS: 2103 ------\n");

        #10;
        setting = 2'b10;
        in = "C";
        #10;
        setting = 2'b01;
        in = "S";
        #10;
        setting = 2'b00;
        in = "Y";
        #10;
        setting = 2'b11;
        in = "Q";
        #10;
        setting = 2'b10;
        in = "G";
        #10;
        setting = 2'b01;
        in = "K";
        #10;
        setting = 2'b00;
        in = "A";
        #10;
        setting = 2'b11;
        in = "H";
        #10;
        setting = 2'b10;
        in = "D";
        #10;
        setting = 2'b01;
        in = "C";
        #10;
    end

	// display outputs
    always @ (in) begin
        #5;
        $display("\n\t\tinput: %c output: %c\n", in, out);
    end

endmodule

