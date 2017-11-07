`timescale 1ns/100ps

/*
        TITLE: THE MODIFIED ENIGMA MACHINE

        REG NO: 16CO154-16CO233

        ABSTRACT: A circuit that encrypts data by mapping each alphabet to another alphabet randomly.
                  Thus a message is encrypted by a user based on a setting decided by the user and the receiver.
                  The receiver has to enter the encrypted data along with the same decided setting to get the desired (decrypted) message.

        FUNCTIONALITIES: The following modules are present:

                            1) VerilogDM_154_233: Handles the selection of black box modules as per the setting along with passing inputs and outputs
                            2) block1, block2, block3, block4 : These are black boxes in which an alphabet is mapped to another alphabet.  
                            3) encoder : An alphabet is converted to its 5-bit binary enquivalent from a => 00000 to z => 11001.
                            4) decoder : 5-bit binary is converted to its enquivalent alphabet character from 00000 => a to 11001 => z.

        BRIEF DESCRIPTION OF CODE:  The user enters the characters of the message in the test bench
                                    along with the setting code for each character which the user has decided and has passed to the receiver.
                                    This data is then encrypted in the following module and then displayed.
                                    The encoder module converts the input ASCII character to 5 bit equivalent.
                                    Each black box gives the corresponding output based on the mapping done inside it,
                                    The VerilogDM_154_233 module handles the selection of the black box outputs based on the setting input.
                                    It then puts the selected answer from the black box to the decoder.
                                    The decoder module converts the 5 bit encoding to its ASCII equivalent.
                                    Through the VerilogDM_154_233 the decoded output is fed to the output of the machine.
                                    For decrypting the same set of character produced during encoding must be entered with same settings.
        
        MODEL: Data Flow                            
*/



module VerilogDM_154_233 (output [8:1] out, input [8:1] in, input [1:0] setting);


    // Variables for outputs from each black box module
        // variable to store output from black box 1
    wire [4:0] out1;

        // variable to store output from black box 2
    wire [4:0] out2;

        // variable to store output from black box 3
    wire [4:0] out3;

        // variable to store output from black box 4
    wire [4:0] out4;



    // Varible to get 5 bit binary encoding for the 8 bit ASCII character
    wire [4:0] encodedInput;



    // Variable to select the bits from all black boxes based on setting
    wire [4:0] selectedOut;



    // Encoder module thread instantiated
    // (output: stored in encodedInput variable after converting to 5 bit encoding from 8 bit ASCII, input: input to machine (character in ASCII))
    encoder Encoder (encodedInput, in);



    // Black box threads instantiated 
        // black box 1 (output: output bits from box1, input: encodedInput bits from encoder module)
    block1 box1 (out1, encodedInput);
    
        // black box 1 (output: output bits from box2, input: encodedInput bits from encoder module)
    block2 box2 (out2, encodedInput);

        // black box 1 (output: output bits from box3, input: encodedInput bits from encoder module)
    block3 box3 (out3, encodedInput);

        // black box 1 (output: output bits from box4, input: encodedInput bits from encoder module)
    block4 box4 (out4, encodedInput);



    // Selection logic

    // selectedOut[] is the array having the desired result. It must be given a value according to the settings and out variable.
    // This is done such that if setting were 0 then the selectedOut will be equivalent to out1 and so on.

    assign selectedOut[0] = (~setting[0] & ~setting[1] & out1[0]) | (setting[0] & ~setting[1] & out2[0]) | (~setting[0] & setting[1] & out3[0]) | (setting[0] & setting[1] & out4[0]);
    assign selectedOut[1] = (~setting[0] & ~setting[1] & out1[1]) | (setting[0] & ~setting[1] & out2[1]) | (~setting[0] & setting[1] & out3[1]) | (setting[0] & setting[1] & out4[1]);
    assign selectedOut[2] = (~setting[0] & ~setting[1] & out1[2]) | (setting[0] & ~setting[1] & out2[2]) | (~setting[0] & setting[1] & out3[2]) | (setting[0] & setting[1] & out4[2]);
    assign selectedOut[3] = (~setting[0] & ~setting[1] & out1[3]) | (setting[0] & ~setting[1] & out2[3]) | (~setting[0] & setting[1] & out3[3]) | (setting[0] & setting[1] & out4[3]);
    assign selectedOut[4] = (~setting[0] & ~setting[1] & out1[4]) | (setting[0] & ~setting[1] & out2[4]) | (~setting[0] & setting[1] & out3[4]) | (setting[0] & setting[1] & out4[4]);
    


    // Decoder module thread instantiated 
    // (output: output of the machine, input: selected bits from selection logic)
    decoder Decoder (out, selectedOut);
    

endmodule



/**
 * Module depicting black box 1 functionality in circuit
 * (output: encoded character for the given input, input: input character to the black box)
 * output bits: (MSB)F5F4F3F2F1(LSB), input bits: (MSB)ABCDE(LSB)
 */
module block1 (output [4:0] out, input [4:0] in);

	// Each character bits is mapped to another character which is chosen for this block using boolean functions
	// The equation is reduced using K Map

    // F5 = D'CE' + AD'E' + ACD + A'C'DE' + A'B'C'D' + A'B'D'E 
    assign out[0] = (~in[1] & in[2] & ~in[0]) | (in[4] & ~in[1] & ~in[0]) | (in[4] & in[2] & in[1]) | (~in[4] & ~in[2] & in[1] & ~in[0]) | (~in[4] & in[3] & ~in[2] & ~in[1]) | (~in[4] & ~in[3] & ~in[1] & in[0]);
    
    // F4 = AE' + AB + B'D'E' + B'CE' + ACD' + A'B'C'E 
    assign out[1] = (in[4] & ~in[0]) | (in[4] & in[3]) | (~in[3] & ~in[1] & ~in[0]) | (~in[3] & in[2] & ~in[0]) | (in[4] & in[2] & ~in[1]) | (~in[4] & ~in[3] & ~in[2] & in[0]);
    
    // F3 = A'C'D' + AB'C' + A'B'DE + A'BC'E' + AB'D'E'
    assign out[2] = (~in[4] & ~in[2] & ~in[1]) | (in[4] & ~in[3] & ~in[2]) | (~in[4] & ~in[3] & in[1] & in[0]) | (~in[4] & in[3] & ~in[2] & ~in[0]) | (in[4] & ~in[3] & ~in[1] & ~in[0]);
    
    // F2 = C'D'E' + CD'E + A'B'C'E' + AB'C'D' + BC'DE;
    assign out[3] = (~in[2] & ~in[1] & ~in[0]) | (in[2] & ~in[1] & in[0]) | (~in[4] & ~in[3] & ~in[2] & ~in[0]) | (in[4] & ~in[3] & ~in[2] & ~in[1]) | (in[3] & ~in[2] & in[1] & in[0]);
    
    // F1 = A'B'D + A'C'D + A'DE + A'B'C'E + A'CD'E'
    assign out[4] = (~in[4] & ~in[3] & in[1]) | (~in[4] & ~in[2] & in[1]) | (~in[4] & in[1] & in[0]) | (~in[4] & ~in[3] & ~in[2] & in[0]) | (~in[4] & in[2] & ~in[1] & ~in[0]);

endmodule



/**
 * Module depicting black box 2 functionality in circuit
 * (output: encoded character for the given input, input: input character to the black box)
 * output bits: (MSB)F5F4F3F2F1(LSB), input bits: (MSB)ABCDE(LSB)
 */
module block2 (output [4:0] out, input [4:0] in);

	// Each character bits is mapped to another character which is chosen for this block using boolean functions
	// The equation is reduced using K Map


    // F5 = A'D'E + A'CE + BCD' + ACD' + A'B'C'E' + B'C'D'E' + AC'DE 
    assign out[0] = (~in[4] & ~in[1] & in[0]) | (~in[4] & in[2] & in[0]) | (in[3] & in[2] & ~in[1]) | (in[4] & in[2] & ~in[1]) | (~in[4] & ~in[3] & ~in[2] & ~in[0]) | (~in[3] & ~in[2] & ~in[1] & ~in[0]) | (in[4] & ~in[2] & in[1] & in[0]);
    
    // F4 = A'DE' + CDE' + B'C'D'E' + A'B'C'D + A'B'CD' + A'BD'E
    assign out[1] = (~in[4] & in[1] & ~in[0]) | (in[2] & in[1] & ~in[0]) | (~in[3] & ~in[2] & ~in[1] & ~in[0]) | (~in[4] & ~in[3] & ~in[2] & in[1]) | (~in[4] & ~in[3] & in[2] & ~in[1]) | (~in[4] & in[3] & ~in[1] & in[0]);
    
    // F3 = A'CE + A'CD + BDE' + AC'D'E + A'B'C'D' + AC'DE'
    assign out[2] = (~in[4] & in[2] & in[0]) | (~in[4] & in[2] & in[1]) | (in[3] & in[1] & ~in[0]) | (in[4] & ~in[2] & ~in[1] & in[0]) | (~in[4] & ~in[3] & ~in[2] & ~in[1]) | (in[4] & ~in[2] & in[1] & ~in[0]);
    
    // F2 = BCE + AD'E' + B'CDE' + BC'D'E' + AB'C'E
    assign out[3] = (in[3] & in[2] & in[0]) | (in[4] & ~in[1] & ~in[0]) | (~in[3] & in[2] & in[1] & ~in[0]) | (in[3] & ~in[2] & ~in[1] & ~in[0]) | (in[4] & ~in[3] & ~in[2] & in[0]);
    
    // F1 = A'C'D' + A'BC' + CD'E' + BC'E
    assign out[4] = (~in[4] & ~in[2] & ~in[1]) | (~in[4] & in[3] & ~in[2]) | (in[2] & ~in[1] & ~in[0]) | (in[3] & ~in[2] & in[0]);

endmodule



/**
 * Module depicting black box 3 functionality in circuit
 * (output: encoded character for the given input, input: input character to the black box)
 * output bits: (MSB)F5F4F3F2F1(LSB), input bits: (MSB)ABCDE(LSB)
 */
module block3 (output [4:0] out, input [4:0] in);

	// Each character bits is mapped to another character which is chosen for this block using boolean functions
	// The equation is reduced using K Map


    // F5 = A'B'C' + B'CD' + C'DE + CD'E' + ADE'
    assign out[0] = (~in[4] & ~in[3] & ~in[2]) | ( ~in[3] & in[2] & ~in[1]) | (~in[2] & in[1] & in[0]) | ( in[2] & ~in[1] & ~in[0]) | ( in[4] & in[1] & ~in[0]);
    
    // F4 = CD + A'B'D + A'DE + A'B'CE + AB'C'E' 
    assign out[1] = (in[2] & in[1]) | (~in[4] & ~in[3] & in[1]) | (~in[4] & in[1] & in[0]) | (~in[4] & ~in[3] & in[2] & in[0]) | (in[4] & ~in[3] & ~in[2] & ~in[0]);
    
    // F3 = B'DE' + BD'E + BCD + ACE' + AC'D + A'C'D'E  
    assign out[2] = (~in[3] & in[1] & ~in[0]) | (in[3] & ~in[1] & in[0]) | (in[3] & in[2] & in[1]) | (in[4] & in[2] & ~in[0]) | (in[4] & ~in[2] & in[1]) | (~in[4] & ~in[2] & ~in[1] & in[0]);
    
    // F2 = AB + B'CE' + BD'E' + AD'E' + A'B'C'DE 
    assign out[3] = (in[4] & in[3]) | (~in[3] & in[2] & ~in[0]) | (in[3] & ~in[1] & ~in[0]) | (in[4] & ~in[1] & ~in[0]) | (~in[4] & ~in[3] & ~in[2] & in[1] & in[0]);
    
    // F1 = BCD' + BCE + A'B'C'D' + A'B'D'E + A'BC'E' + AC'DE' + ACDE 
    assign out[4] = (in[3] & in[2] & ~in[1]) | (in[3] & in[2] & in[0]) | (~in[4] & ~in[3] & ~in[2] & ~in[1]) | (~in[4] & ~in[3] & ~in[1] & in[0]) | (~in[4] & in[3] & ~in[2] & ~in[0]) | (in[4] & ~in[2] & in[1] & ~in[0]) | (in[4] & in[2] & in[1] & in[0]);
    

endmodule



/**
 * Module depicting black box 4 functionality in circuit
 * (output: encoded character for the given input, input: input character to the black box)
 * output bits: (MSB)F5F4F3F2F1(LSB), input bits: (MSB)ABCDE(LSB)
 */
module block4 (output [4:0] out, input [4:0] in);

	// Each character bits is mapped to another character which is chosen for this block using boolean functions
	// The equation is reduced using K Map


    // F5 = AE' + B'D'E' + CDE' + BC'E' + A'B'CD + AB'C'D'
    assign out[0] = (in[4] & ~in[0]) | (~in[3] & ~in[1] & ~in[0]) | (in[2] & in[1] & ~in[0]) | (in[3] & ~in[2] & ~in[0]) | (~in[4] & ~in[3] & in[2] & in[1]) | (in[4] & ~in[3] & ~in[2] & ~in[1]);
    
    // F4 = AB'C' + BDE' + BCD' + AC'E + ADE + B'C'DE + AB'D'E' 
    assign out[1] = (in[4] & ~in[3] & ~in[2]) | ( in[3] & in[1] & ~in[0]) | (in[3] & in[2] & ~in[1]) | (in[4] & ~in[2] & in[0]) | (in[4] & in[1] & in[0]) | (~in[3] & ~in[2] & in[1] & in[0]) | (in[4] & ~in[3] & ~in[1] & ~in[0]);
    
    // F3 = BD'E + BCD + A'C'D'E' + A'B'DE' + AC'D'E + ACD'E' + ACDE
    assign out[2] = (in[3] & ~in[1] & in[0]) | (in[3] & in[2] & in[1]) | (~in[4] & ~in[2] & ~in[1] & ~in[0]) | (~in[4] & ~in[3] & in[1] & ~in[0]) | (in[4] & ~in[2] & ~in[1] & in[0]) | (in[4] & in[2] & ~in[1] & ~in[0]) | (in[4] & in[2] & in[1] & in[0]);
    
    // F2 = AC + B'CE' + ADE + A'B'DE' + AB'D'E' + A'B'C'D'E
    assign out[3] = (in[4] & in[2]) | (~in[3] & in[2] & ~in[0]) | (in[4] & in[1] & in[0]) | (~in[4] & ~in[3] & in[1] & ~in[0]) | (in[4] & ~in[3] & ~in[1] & ~in[0]) | (~in[4] & ~in[3] & ~in[2] & ~in[1] & in[0]);
    
    // F1 = BD + A'DE + ABE + A'B'C'E + A'BC'E' + ACDE' 
    assign out[4] = (in[3] & in[1]) | (~in[4] & in[1] & in[0]) | (in[4] & in[3] & in[0]) | (~in[4] & ~in[3] & ~in[2] & in[0]) | (~in[4] & in[3] & ~in[2] & ~in[0]) | (in[4] & in[2] & in[1] & ~in[0]);

endmodule



/**
 * Module for Encoder
 * (output: stored in encodedInput variable after converting to 5 bit encoding from 8 bit ASCII, input: input to machine (character in ASCII))
 * Converts 8 bit ASCII character to 5 bit equivalent
 * eg. A => '00000' to Z => '11001'
 */
module encoder (output [4:0] encodedInput, input [8:1] in);

    // variable for the conversion
    wire [8:1] res;
    
    // substact the ASCII value of "A" to get the correspoding bits
    assign res = in - "A";

    // first 5 bits will be the 5 bit encoding needed for this circuit
    assign encodedInput[4] = res[5];
    assign encodedInput[3] = res[4];
    assign encodedInput[2] = res[3];
    assign encodedInput[1] = res[2];
    assign encodedInput[0] = res[1];

endmodule



/**
 * Module for Decoder
 * (output: output of the machine, input: selected bits from selection logic)
 * Converts 5 bit character encoding to its 8 bit ASCII equivalent
 * eg. '00000' => A to '11001' => Z
 */
module decoder (output [8:1] out, input [4:0] selectedOut);

    // variable for the conversion
    wire [8:1] res;

    // feed the 5 bit to the 8 bit variable
    assign res[8] = 1'b0;
    assign res[7] = 1'b0;
    assign res[6] = 1'b0;
    assign res[5] = selectedOut[4];
    assign res[4] = selectedOut[3];
    assign res[3] = selectedOut[2];
    assign res[2] = selectedOut[1];
    assign res[1] = selectedOut[0];

    // offset by ASCII character "A" to get final ASCII character value
    assign out = res + "A";

endmodule


