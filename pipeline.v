/*----------------------------
Module : pipeline
Designed by : Akhil Gudivada
-------------------------------*/


`include "Extraction.v"
`include "Addition.v"
`include "Normalization1.v"
`include "Normalization2.v"

module pipeline(input clk73,input [15:0]A73,input [15:0]B73,output reg [15:0]sum73);

	reg [15:0]numA73; reg [15:0]numB73;

	wire sign_A73;wire sign_B73;wire [10:0]m173;wire [10:0]m273;wire [4:0] exp73; 

	reg sign_A173;reg sign_B173;reg [10:0]m1173;reg [10:0]m2173;reg [4:0] exp173; 

	wire res_sign73;wire [11:0]m_sum73;

	reg res_sign173;reg [11:0]m_sum173;reg [4:0] exp273;

	wire dir73;wire [3:0]N73;

	reg res_sign273,dir173;reg [3:0]N173;reg [4:0]exp373;reg [11:0]m_sum273;

	wire [4:0]res_exp73;wire [9:0]res_mant73;

	Extraction E1(numA73,numB73, sign_A73,sign_B73,m173,m273,exp73); //stage1
	Addition A1(sign_A173,sign_B173,m1173,m2173, res_sign73,m_sum73); //stage2
	Normalization1 Norm1(m_sum173, dir73,N73); //stage3
	Normalization2 Norm2(exp373,m_sum273,dir173,N173,res_exp73,res_mant73); //stage4

	always@(posedge clk73) begin //pipeline start
		numA73 <= A73;numB73 <= B73;

		sign_A173 <= sign_A73;sign_B173 <= sign_B73;
		m1173	<= m173;m2173<= m273;
		exp173<= exp73;
		
		res_sign173 <= res_sign73;
		m_sum173   <= m_sum73;
 		exp273      <= exp173;
		
		res_sign273 <= res_sign173;
		dir173  <= dir73;N173    <= N73;
		exp373  <= exp273;
		m_sum273 <= m_sum173;
		
	end //pipeline end
	always@(*) begin   //Framing final result
	 sum73 = {res_sign273,res_exp73,res_mant73};end

endmodule
