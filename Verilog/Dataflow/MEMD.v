`timescale 1ns/100ps

module MEM (output [8:1] out, input [8:1] in, input [1:0] setting);

    wire [4:0] out1;
    wire [4:0] out2;
    wire [4:0] out3;
    wire [4:0] out4;

    wire [4:0] encodedInput;
    wire [4:0] selectedOut;

    encoder Encoder (encodedInput, in);

    block1 box1 (out1, encodedInput);
    block2 box2 (out2, encodedInput);
    block3 box3 (out3, encodedInput);
    block4 box4 (out4, encodedInput);

    // selection 
    assign selectedOut[0] = (~setting[0] & ~setting[1] & out1[0]) | (setting[0] & ~setting[1] & out2[0]) | (~setting[0] & setting[1] & out3[0]) | (setting[0] & setting[1] & out4[0]);
    assign selectedOut[1] = (~setting[0] & ~setting[1] & out1[1]) | (setting[0] & ~setting[1] & out2[1]) | (~setting[0] & setting[1] & out3[1]) | (setting[0] & setting[1] & out4[1]);
    assign selectedOut[2] = (~setting[0] & ~setting[1] & out1[2]) | (setting[0] & ~setting[1] & out2[2]) | (~setting[0] & setting[1] & out3[2]) | (setting[0] & setting[1] & out4[2]);
    assign selectedOut[3] = (~setting[0] & ~setting[1] & out1[3]) | (setting[0] & ~setting[1] & out2[3]) | (~setting[0] & setting[1] & out3[3]) | (setting[0] & setting[1] & out4[3]);
    assign selectedOut[4] = (~setting[0] & ~setting[1] & out1[4]) | (setting[0] & ~setting[1] & out2[4]) | (~setting[0] & setting[1] & out3[4]) | (setting[0] & setting[1] & out4[4]);
    
    
    decoder Decoder (out, selectedOut);
    

endmodule

module block1 (output [4:0] out, input [4:0] in);

    assign out[0]=(~in[1]&in[2]&~in[0])|(in[4]&~in[1]&~in[0])|(in[4]&in[2]&in[1])|(~in[4]&~in[2]&in[1]&~in[0])|(~in[4]&in[3]&~in[2]&~in[1])|(~in[4]&~in[3]&~in[1]&in[0]);
    assign out[1]=(in[4]&~in[0])|(in[4]&in[3])|(~in[3]&~in[1]&~in[0])|(~in[3]&in[2]&~in[0])|(in[4]&in[2]&~in[1])|(~in[4]&~in[3]&~in[2]&in[0]);
    assign out[2]=(~in[4]&~in[2]&~in[1])|(in[4]&~in[3]&~in[2])|(~in[4]&~in[3]&in[1]&in[0])|(~in[4]&in[3]&~in[2]&~in[0])|(in[4]&~in[3]&~in[1]&~in[0]);
    assign out[3]=(~in[2]&~in[1]&~in[0])|(in[2]&~in[1]&in[0])|(~in[4]&~in[3]&~in[2]&~in[0])|(in[4]&~in[3]&~in[2]&~in[1])|(in[3]&~in[2]&in[1]&in[0]);
    assign out[4]=(~in[4]&~in[3]&in[1])|(~in[4]&~in[2]&in[1])|(~in[4]&in[1]&in[0])|(~in[4]&~in[3]&~in[2]&in[0])|(~in[4]&in[2]&~in[1]&~in[0]);

endmodule


module block2 (output [4:0] out, input [4:0] in);

   
    

endmodule

module block3 (output [4:0] out, input [4:0] in);

    assign out[0]=(~in[4]&~in[3]&~in[2])|(~in[3]&in[2]&~in[1])|(~in[2]&in[1]&in[0])|(in[2]&~in[1]&~in[0])|(in[4]&in[1]&~in[0]);
    assign out[1]=(in[2]&in[1])|(~in[4]&~in[3]&in[1])|(~in[4]&in[1]&in[0])|(~in[4]&~in[3]&in[2]&in[0])|(in[4]&~in[3]&~in[2]&~in[0]);
    assign out[2]=(~in[3]&in[1]&~in[0])|(in[3]&~in[1]&in[0])|(in[3]&in[2]&in[1])|(in[4]&in[2]&~in[0])|(in[4]&~in[2]&in[1])|(~in[4]&~in[2]&~in[1]&in[0]);
    assign out[3]=(in[4]&in[3])|(~in[3]&in[2]&~in[0])|(in[3]&~in[1]&~in[0])|(in[4]&~in[1]&~in[0])|(~in[4]&~in[3]&~in[2]&in[1]&in[0]);
    assign out[4]=(in[3]&in[2]&~in[1])|(in[3]&in[2]&in[0])|(~in[4]&~in[3]&~in[2]&~in[1])|(~in[4]&~in[3]&~in[1]&in[0])|(~in[4]&in[3]&~in[2]&~in[0])|(in[4]&~in[2]&in[1]&~in[0])|(in[4]&in[2]&in[1]&in[0]);
    

endmodule

module block4 (output [4:0] out, input [4:0] in);

    assign out[0]=(in[4]&~in[0])|(~in[3]&~in[1]&~in[0])|(in[2]&in[1]&~in[0])|(in[3]&~in[2]&~in[0])|(~in[4]&~in[3]&in[2]&in[1])|(in[4]&~in[3]&~in[2]&~in[1]);
    assign out[1]=(in[4]&~in[3]&~in[2])|(in[3]&in[1]&~in[0])|(in[3]&in[2]&~in[1])|(in[4]&~in[2]&in[0])|(in[4]&in[1]&in[0])|(~in[3]&~in[2]&in[1]&in[0])|(in[4]&~in[3]&~in[1]&~in[0]);
    assign out[2]=(in[3]&~in[1]&in[0])|(in[3]&in[2]&in[1])|(~in[4]&~in[2]&~in[1]&~in[0])|(~in[4]&~in[3]&in[1]&~in[0])|(in[4]&~in[2]&~in[1]&in[0])|(in[4]&in[2]&~in[1]&~in[0])|(in[4]&in[2]&in[1]&in[0]);
    assign out[3]=(in[4]&in[2])|(~in[3]&in[2]&~in[0])|(in[4]&in[1]&in[0])|(~in[4]&~in[3]&in[1]&~in[0])|(in[4]&~in[3]&~in[1]&~in[0])|(~in[4]&~in[3]&~in[2]&~in[1]&in[0]);
    assign out[4]=(in[3]&in[1])|(~in[4]&in[1]&in[0])|(in[4]&in[3]&in[0])|(~in[4]&~in[3]&~in[2]&in[0])|(~in[4]&in[3]&~in[2]&~in[0])|(in[4]&in[2]&in[1]&~in[0]);

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


