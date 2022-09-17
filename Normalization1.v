/*----------------------------
Module : Normalization1
Designed by : Akhil Gudivada
-------------------------------*/
module Normalization1 (input [11:0]m_sum73,output reg dir73,reg [3:0]N73);

// 0 left 1 right
// dir assigned with 0 for Left shift and 1 for Right shift

always @(*) begin
	casex(m_sum73)
			12'b1xxxxxxxxxxx:
			  begin
			    dir73 = 1'b1;
			    N73   = 4'b0001;	
			  end
			12'b01xxxxxxxxxx:
			  begin
			    dir73 = 1'b0;
			    N73  = 4'b0000;
			  end
			12'b001xxxxxxxxx:
			  begin
			    dir73 = 1'b0;
			    N73   = 4'b0001;
			  end
			12'b0001xxxxxxxx:
			  begin
			    dir73 = 1'b0;
			    N73   = 4'b0010;
			  end
			12'b00001xxxxxxx:
			  begin
			    dir73 = 1'b0;
			    N73   = 4'b0011;
			  end
			12'b000001xxxxxx:
			  begin
			     dir73 = 1'b0;
			     N73   = 4'b0100;
			  end
			12'b0000001xxxxx:
			  begin
			     dir73 = 1'b0;
			     N73   = 4'b0101;
			  end
			12'b00000001xxxx:
			  begin
			     dir73 = 1'b0;
			     N73   = 4'b0110;
			  end
			12'b000000001xxx:
			  begin
 			     dir73 = 1'b0;
			     N73   = 4'b0111;
			  end
			12'b0000000001xx:
			  begin
			     dir73 = 1'b0;
			     N73   = 4'b1000;
			  end
			12'b00000000001x:
			  begin
			     dir73 = 1'b0;
			     N73   = 4'b1001;
			  end
			12'b000000000001:
			  begin
			     dir73 = 1'b0;
			     N73   = 4'b1010;
			  end
			default:
			  begin
			    dir73 = 1'b0;
			    N73 = 4'b0;
			  end
      		endcase

end

endmodule
