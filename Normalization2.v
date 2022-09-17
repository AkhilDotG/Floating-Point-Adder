/*----------------------------
Module : Normalization2
Designed by : Akhil Gudivada
-------------------------------*/
module Normalization2 (input reg [4:0]exp73,reg [11:0]m_sum73,reg dir73,[3:0]N73, output reg [4:0]res_exp73,reg [9:0]res_mant73);

reg [11:0]sum73;
always @ (*) begin
	res_exp73 = 0;
	sum73 = 0;
	if(dir73) begin  // Right shifting the mantissa sum by N bits
		sum73 = m_sum73 >> N73;
		res_exp73 = exp73 +N73;end
	else begin       //  Left shifting the mantissa sum by N bits
		sum73 = m_sum73 << N73;
		res_exp73 = exp73 -N73;end
end

always @ (*) begin // Assigning final mantissa to output
 	res_mant73 = sum73[9:0]; end
endmodule
