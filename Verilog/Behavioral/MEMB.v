`timescale 1ns/100ps

module MEM (output reg [8:1] out, input [8:1] in, input [1:0] setting);

    wire [8:1] out1;
    wire [8:1] out2;
    wire [8:1] out3;
    wire [8:1] out4;

    reg [8:1] inp;

    block1 box1 (out1, inp);
    block2 box2 (out2, inp);
    block3 box3 (out3, inp);
    block4 box4 (out4, inp);
    
    always @ (1) begin
        
        inp = in;
        #1;
        case (setting)
            2'b00: begin out = out1; end
            2'b01: begin out = out2; end
            2'b10: begin out = out3; end
            2'b11: begin out = out4; end
        endcase
    end

endmodule

module block1 (output reg [8:1] out, input [8:1] in);

    always @ (in) begin
        case (in)
            "A": begin out <= "B"; end
            "B": begin out <= "B"; end
            "C": begin out <= "B"; end
            "D": begin out <= "B"; end
            "E": begin out <= "B"; end
            "F": begin out <= "B"; end
            "G": begin out <= "B"; end
            "H": begin out <= "B"; end
            "I": begin out <= "B"; end
            "J": begin out <= "B"; end
            "K": begin out <= "B"; end
            "L": begin out <= "B"; end
            "M": begin out <= "B"; end
            "N": begin out <= "B"; end
            "O": begin out <= "B"; end
            "P": begin out <= "B"; end
            "Q": begin out <= "B"; end
            "R": begin out <= "B"; end
            "S": begin out <= "B"; end
            "T": begin out <= "B"; end
            "U": begin out <= "B"; end
            "V": begin out <= "B"; end
            "W": begin out <= "B"; end
            "X": begin out <= "B"; end
            "Y": begin out <= "B"; end
            "Z": begin out <= "B"; end
        endcase
    end

endmodule


module block2 (output reg [8:1] out, input [8:1] in);

    always @ (in) begin
        case (in)
            "A": begin out <= "B"; end
            "B": begin out <= "B"; end
            "C": begin out <= "B"; end
            "D": begin out <= "B"; end
            "E": begin out <= "B"; end
            "F": begin out <= "B"; end
            "G": begin out <= "B"; end
            "H": begin out <= "B"; end
            "I": begin out <= "B"; end
            "J": begin out <= "B"; end
            "K": begin out <= "B"; end
            "L": begin out <= "B"; end
            "M": begin out <= "B"; end
            "N": begin out <= "B"; end
            "O": begin out <= "B"; end
            "P": begin out <= "B"; end
            "Q": begin out <= "B"; end
            "R": begin out <= "B"; end
            "S": begin out <= "B"; end
            "T": begin out <= "B"; end
            "U": begin out <= "B"; end
            "V": begin out <= "B"; end
            "W": begin out <= "B"; end
            "X": begin out <= "B"; end
            "Y": begin out <= "B"; end
            "Z": begin out <= "B"; end
        endcase
    end

endmodule

module block3 (output reg [8:1] out, input [8:1] in);

    always @ (in) begin
        case (in)
            "A": begin out <= "B"; end
            "B": begin out <= "B"; end
            "C": begin out <= "B"; end
            "D": begin out <= "B"; end
            "E": begin out <= "B"; end
            "F": begin out <= "B"; end
            "G": begin out <= "B"; end
            "H": begin out <= "B"; end
            "I": begin out <= "B"; end
            "J": begin out <= "B"; end
            "K": begin out <= "B"; end
            "L": begin out <= "B"; end
            "M": begin out <= "B"; end
            "N": begin out <= "B"; end
            "O": begin out <= "B"; end
            "P": begin out <= "B"; end
            "Q": begin out <= "B"; end
            "R": begin out <= "B"; end
            "S": begin out <= "B"; end
            "T": begin out <= "B"; end
            "U": begin out <= "B"; end
            "V": begin out <= "B"; end
            "W": begin out <= "B"; end
            "X": begin out <= "B"; end
            "Y": begin out <= "B"; end
            "Z": begin out <= "B"; end
        endcase
    end

endmodule

module block4 (output reg [8:1] out, input [8:1] in);

    always @ (in) begin
        case (in)
            "A": begin out <= "B"; end
            "B": begin out <= "B"; end
            "C": begin out <= "B"; end
            "D": begin out <= "B"; end
            "E": begin out <= "B"; end
            "F": begin out <= "B"; end
            "G": begin out <= "B"; end
            "H": begin out <= "B"; end
            "I": begin out <= "B"; end
            "J": begin out <= "B"; end
            "K": begin out <= "B"; end
            "L": begin out <= "B"; end
            "M": begin out <= "B"; end
            "N": begin out <= "B"; end
            "O": begin out <= "B"; end
            "P": begin out <= "B"; end
            "Q": begin out <= "B"; end
            "R": begin out <= "B"; end
            "S": begin out <= "B"; end
            "T": begin out <= "B"; end
            "U": begin out <= "B"; end
            "V": begin out <= "B"; end
            "W": begin out <= "B"; end
            "X": begin out <= "B"; end
            "Y": begin out <= "B"; end
            "Z": begin out <= "B"; end
        endcase
    end

endmodule