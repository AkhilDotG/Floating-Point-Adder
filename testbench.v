module tb();

reg clk73;
reg [15:0]numA73;reg [15:0]numB73;
reg [15:0]expected73;
wire [15:0]sum73;

pipeline pipeline1(clk73,numA73,numB73,sum73);

always #5 clk73 = ~clk73;

initial begin
#2 clk73=0; numA73 = 16'h5620;numB73 = 16'h5948;expected73 = 16'h5C2C;
#10 numA73 = 16'h5630;numB73 = 16'hD590;expected73 = 16'h4900;
#10 numA73 = 16'hD1A0;numB73 = 16'h54F0;expected73 = 16'h5040;
#10  numA73 = 16'hDC6C;numB73 = 16'hD420;expected73 = 16'hDD74;
#10 numA73 = 16'h0000;numB73 = 16'h0000;expected73 = 16'h0000;
#10 numA73 = 16'h0000;numB73 = 16'hD750;expected73 = 16'hD750;
#10 numA73 = 16'hD6E2 ;numB73 = 16'h563E;expected73 = 16'hC920;
#10 numA73 = 16'h56EE ;numB73 = 16'h5632;expected73 = 16'h5A90;
#50; $finish;
end 

initial begin
  $monitor("time:%0t, clk: %b,numA :%h,numB: %h,sum :%h,expected %h",$time,clk73,numA73,numB73,sum73,expected73);   
		$dumpfile("waves_pipeline.vcd");
		$dumpvars();	
end

endmodule

