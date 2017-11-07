`timescale 1ns/100ps

// TEST BENCH

/*
        TITLE: THE MODIFIED ENIGMA MACHINE

        REG NO: 16CO154-16CO233

        ABSTRACT: A circuit that encrypts data by mapping each alphabet to another alphabet randomly.
                  Thus a message is encrypted by a user based on a setting decided by the user and the receiver.
                  The receiver has to enter the encrypted data along with the same decided setting to get the desired (decrypted) message.

        FUNCTIONALITIES: The following modules are present

                            1) Verilog_154_233: It provides the stimulus for the VerilogBM_102_205, VerilogDM_102_205 modules to run
                                                Providing the input to the machine and the setting decided by sender and receiver

        BRIEF DESCRIPTION OF CODE:  The user enters the characters of the message in the test bench
                                    along with the setting code for each character which the user has decided and has passed to the receiver.
                                    This data is then encrypted in VerilogBM_102_205, VerilogDM_102_205 modules and then displayed.
                                    Each black box inside the main modules gives the corresponding output based on the mapping done inside it,
                                    The VerilogBM_102_205, VerilogDM_102_205 module handles the selection of the black box outputs based on the setting input.
                                    It then puts the selected answer from the black box to the output of the machine.
                                    For decrypting the same set of character produced during encoding must be entered with same settings.
*/



module Verilog_154_233;

    reg [1:0] setting;
    reg [8:1] in;
    wire [8:1] out;

    // Main Module for MODIFIED ENIGMA MACHINE instantiated
    VerilogBM_154_233 inst(out, in, setting);
    
	// input combinations 
    initial begin

        $dumpfile("VerilogBM-154-233.vcd");
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
    always @ (setting) begin
        #5;
        $display("\n\t\tinput: %c output: %c\n", in, out);
    end

endmodule

