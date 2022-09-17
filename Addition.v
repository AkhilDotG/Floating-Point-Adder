/*----------------------------
Module : Addition
Designed by : Akhil Gudivada
-------------------------------*/


module Addition (input sign_A73,sign_B73,[10:0]m173,[10:0]m273, output reg res_sign73,reg [11:0]m_sum73 );

always @(*) begin
	// If both signs are not equal then subtraction higher mantissa with lower mantissa
	if(sign_A73 != sign_B73)   
	begin
		if(m173 > m273) begin
			m_sum73 = m173 -m273;
			res_sign73 = sign_A73; // Assigning sign of high input A
		end
		else  if(m273 > m173) begin
			m_sum73 = m273 -m173;
			res_sign73 = sign_B73 ; // Assigning sign of high input B
		end 
		else  begin
			m_sum73 = 0; 		//If both are equal m_sum = 0
			res_sign73 = 0;		
		end 
	end
	// If both signs are equal then add and take sign from any input
	else begin
		m_sum73 = m173 + m273;
		res_sign73 = sign_A73;
	end
end

endmodule
