CO202 - Design of Digital Systems Mini Project

Modified Engima Machine (16CO154 - 16CO233)

Functioning of logisim circuit:

1) block1, block2, block3, block4 : These are black boxes in which an alphabet is mapped to another alphabet.
2) Encoder : An alphabet is converted to its 5-bit binary enquivalent from a => 00000 to z => 11001.
3) Decoder : 5-bit binary is converted to its enquivalent alphabet character from 00000 => a to 11001 => z.
4) main: It consists of 26 inputs for alphabets along with a setting pre-decided by the sender and the receiver ranging from 0-3
	 is to be converted to binary and then entered in the setting area before input is entered. eg.
	 If string "hello people" is to be entered and code(setting) is 3201 is decided, 
		1) 3 => 11 is set and then h is given as input.
		2) 2 => 10 is set and then e is given as input.
   		3) 0 => 00 is set and then l is given as input.
		4) 1 => 01 is set and then l is given as input.
	This code sequence is repeated for the rest of the string input: 
		5) 3 => 11 is set and then o is given as input.
		6) 2 => 10 is set and then p is given as input.
		7) 0 => 00 is set and then e is given as input.
		8) 1 => 01 is set and then o is given as input.
   		9) 3 => 11 is set and then p is given as input.
	       10) 2 => 10 is set and then l is given as input.
	       11) 0 => 00 is set and then e is given as input.
	 
	 After entering the setting and giving the input the corresponding output alphabet is seen at the output end of the circuit. 
	 This process is repeated while encoding as well as decoding the message.