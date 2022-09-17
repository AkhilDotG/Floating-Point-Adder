/*----------------------------
Module : Extraction
Designed by : Akhil Gudivada
-------------------------------*/

module Extraction(input [15:0]A73,[15:0]B73,
	output reg sign_A73,reg sign_B73,reg [10:0]m173,reg [10:0]m273,reg [4:0]exp73);

reg [4:0]exp_A73;
reg [4:0]exp_B73;

always @ (*) begin
	sign_A73 = A73[15];
	sign_B73 = B73[15];
	exp_A73 = A73[14:10];
	exp_B73 = B73[14:10];	

	if(A73 == 0) m173 = {1'b0,A73[9:0]};
		else m173 = {1'b1,A73[9:0]}; //Adding hidden bit to input A
	if(B73 == 0) m273 = {1'b0,B73[9:0]};
		else m273 = {1'b1,B73[9:0]}; //Adding hidden bit to input B

	if(exp_A73 > exp_B73)begin
		m173 = m173;
		m273 = m273 >> (exp_A73 - exp_B73); //mantissa alignment when A is greater
		exp73 = exp_A73;
				 end
	else if(exp_B73 > exp_A73) begin
		m273 = m273;
		m173 = m173 >> (exp_B73 - exp_A73); //mantissa alignment when B is greater
		exp73 = exp_B73; end
	else begin
		m173 = m173;               //No change in mantissa and resultant exponent if both exponents are equal
		m273 = m273; 
		exp73 = exp_A73;end
	
end

endmodule
