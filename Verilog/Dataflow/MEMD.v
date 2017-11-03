`timescale 1ns/100ps

// 
module MEM (output [8:1] out, input [8:1] in, input [1:0] setting);

    // Variables for outputs from each black box module
    wire [4:0] out1;
    wire [4:0] out2;
    wire [4:0] out3;
    wire [4:0] out4;

    // Varible to get 5 bit binary encoding for the 8 bit ASCII character
    wire [4:0] encodedInput;

    // Variable to select the bits from all black boxes based on setting
    wire [4:0] selectedOut;

    // Encoder module thread instantiated
    encoder Encoder (encodedInput, in);

    block1 box1 (out1, encodedInput);
    block2 box2 (out2, encodedInput);
    block3 box3 (out3, encodedInput);
    block4 box4 (out4, encodedInput);

    // Selection logic
    assign selectedOut[0] = (~setting[0] & ~setting[1] & out1[0]) | (setting[0] & ~setting[1] & out2[0]) | (~setting[0] & setting[1] & out3[0]) | (setting[0] & setting[1] & out4[0]);
    assign selectedOut[1] = (~setting[0] & ~setting[1] & out1[1]) | (setting[0] & ~setting[1] & out2[1]) | (~setting[0] & setting[1] & out3[1]) | (setting[0] & setting[1] & out4[1]);
    assign selectedOut[2] = (~setting[0] & ~setting[1] & out1[2]) | (setting[0] & ~setting[1] & out2[2]) | (~setting[0] & setting[1] & out3[2]) | (setting[0] & setting[1] & out4[2]);
    assign selectedOut[3] = (~setting[0] & ~setting[1] & out1[3]) | (setting[0] & ~setting[1] & out2[3]) | (~setting[0] & setting[1] & out3[3]) | (setting[0] & setting[1] & out4[3]);
    assign selectedOut[4] = (~setting[0] & ~setting[1] & out1[4]) | (setting[0] & ~setting[1] & out2[4]) | (~setting[0] & setting[1] & out3[4]) | (setting[0] & setting[1] & out4[4]);
    
    // Decoder module thread instantiated
    decoder Decoder (out, selectedOut);
    

endmodule

// Module depicting black box 1 functionality in circuit
module block1 (output [4:0] out, input [4:0] in);

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

// Module depicting black box 2 functionality in circuit
module block2 (output [4:0] out, input [4:0] in);

    // F5 = A'D'E + A'CE + BCD' + ACD' + A'B'C'E' + B'C'D'E' + AC'DE 
    assign out[0] = (~in[4] & ~in[2] & in[0]) | (~in[4] & in[2] & in[0]) | (in[3] & in[2] & ~in[1]) | (in[4] & in[2] & ~in[1]) | (~in[4] & ~in[3] & ~in[2] & ~in[0]) | (~in[3] & ~in[2] & ~in[1] & ~in[0]) | (in[4] & ~in[2] & in[1] & in[0]);
    
    // F4 = A'DE' + CDE' + B'C'D'E' + A'B'C'D + A'B'CD' + A'BD'E
    assign out[1] = (~in[4] & in[1] & ~in[0]) | (in[2] & in[1] & ~in[0]) | (~in[3] & ~in[2] & ~in[1] & ~in[0]) | (~in[4] & ~in[3] & ~in[2] & in[1]) | (~in[4] & ~in[3] & in[2] & ~in[1]) | (~in[4] & in[3] & ~in[1] & in[0]);
    
    // F3 = A'CE + A'CD + BDE' + AC'D'E + A'B'C'D' + AC'DE'
    assign out[2] = (~in[4] & in[2] & in[0]) | (~in[4] & in[2] & in[1]) | (in[3] & in[1] & ~in[0]) | (in[4] & ~in[2] & ~in[1] & in[0]) | (~in[4] & ~in[3] & ~in[2] & ~in[1]) | (in[4] & ~in[2] & in[1] & ~in[0]);
    
    // F2 = BCE + AD'E' + B'CDE' + BC'D'E' + AB'C'E
    assign out[3] = (in[3] & in[2] & in[0]) | (in[4] & ~in[1] & ~in[0]) | (~in[3] & in[2] & in[1] & ~in[0]) | (in[3] & ~in[2] & ~in[1] & ~in[0]) | (in[4] & ~in[3] & ~in[2] & in[0]);
    
    // F1 = A'C'D' + A'BC' + CD'E' + BC'E
    assign out[4] = (~in[4] & ~in[2] & ~in[1]) | (~in[4] & in[3] & ~in[2]) | (in[2] & ~in[1] & ~in[0]) | (in[3] & ~in[2] & in[0]);

endmodule

// Module depicting black box 3 functionality in circuit
module block3 (output [4:0] out, input [4:0] in);

    // 
    assign out[0] = (~in[4]&~in[3]&~in[2])|(~in[3]&in[2]&~in[1])|(~in[2]&in[1]&in[0])|(in[2]&~in[1]&~in[0])|(in[4]&in[1]&~in[0]);
    // 
    assign out[1] = (in[2]&in[1])|(~in[4]&~in[3]&in[1])|(~in[4]&in[1]&in[0])|(~in[4]&~in[3]&in[2]&in[0])|(in[4]&~in[3]&~in[2]&~in[0]);
    // 
    assign out[2] = (~in[3]&in[1]&~in[0])|(in[3]&~in[1]&in[0])|(in[3]&in[2]&in[1])|(in[4]&in[2]&~in[0])|(in[4]&~in[2]&in[1])|(~in[4]&~in[2]&~in[1]&in[0]);
    // 
    assign out[3] = (in[4]&in[3])|(~in[3]&in[2]&~in[0])|(in[3]&~in[1]&~in[0])|(in[4]&~in[1]&~in[0])|(~in[4]&~in[3]&~in[2]&in[1]&in[0]);
    // 
    assign out[4] = (in[3]&in[2]&~in[1])|(in[3]&in[2]&in[0])|(~in[4]&~in[3]&~in[2]&~in[1])|(~in[4]&~in[3]&~in[1]&in[0])|(~in[4]&in[3]&~in[2]&~in[0])|(in[4]&~in[2]&in[1]&~in[0])|(in[4]&in[2]&in[1]&in[0]);
    

endmodule

// Module depicting black box 4 functionality in circuit
module block4 (output [4:0] out, input [4:0] in);

    //
    assign out[0] = (in[4]&~in[0])|(~in[3]&~in[1]&~in[0])|(in[2]&in[1]&~in[0])|(in[3]&~in[2]&~in[0])|(~in[4]&~in[3]&in[2]&in[1])|(in[4]&~in[3]&~in[2]&~in[1]);
    //
    assign out[1] = (in[4]&~in[3]&~in[2])|(in[3]&in[1]&~in[0])|(in[3]&in[2]&~in[1])|(in[4]&~in[2]&in[0])|(in[4]&in[1]&in[0])|(~in[3]&~in[2]&in[1]&in[0])|(in[4]&~in[3]&~in[1]&~in[0]);
    //
    assign out[2] = (in[3]&~in[1]&in[0])|(in[3]&in[2]&in[1])|(~in[4]&~in[2]&~in[1]&~in[0])|(~in[4]&~in[3]&in[1]&~in[0])|(in[4]&~in[2]&~in[1]&in[0])|(in[4]&in[2]&~in[1]&~in[0])|(in[4]&in[2]&in[1]&in[0]);
    //
    assign out[3] = (in[4]&in[2])|(~in[3]&in[2]&~in[0])|(in[4]&in[1]&in[0])|(~in[4]&~in[3]&in[1]&~in[0])|(in[4]&~in[3]&~in[1]&~in[0])|(~in[4]&~in[3]&~in[2]&~in[1]&in[0]);
    //
    assign out[4] = (in[3]&in[1])|(~in[4]&in[1]&in[0])|(in[4]&in[3]&in[0])|(~in[4]&~in[3]&~in[2]&in[0])|(~in[4]&in[3]&~in[2]&~in[0])|(in[4]&in[2]&in[1]&~in[0]);

endmodule

module encoder (output [4:0] encodedInput, input [8:1] in);

    wire [8:1] res;

    assign res = in - "A";

    assign encodedInput[4] = res[5];
    assign encodedInput[3] = res[4];
    assign encodedInput[2] = res[3];
    assign encodedInput[1] = res[2];
    assign encodedInput[0] = res[1];

endmodule

module decoder (output [8:1] out, input [4:0] selectedOut);

    wire [8:1] res;

    assign res[8] = 1'b0;
    assign res[7] = 1'b0;
    assign res[6] = 1'b0;
    assign res[5] = selectedOut[4];
    assign res[4] = selectedOut[3];
    assign res[3] = selectedOut[2];
    assign res[2] = selectedOut[1];
    assign res[1] = selectedOut[0];

    assign out = res + "A";

endmodule


