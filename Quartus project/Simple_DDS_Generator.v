// Altera Cyclone 4 osillates at frequency 50 MHz
// We will have square wave with frequency 195312 Hz
module Simple_DDS_Generator(input Clk, output [7:0] DAC_Code);

	reg [15:0] cnt;									// let's create a 16 bits free-running binary counter
	always @(posedge Clk) cnt <= cnt + 16'h1;	// and use it to generate the DAC signal output
	wire cnt_tap = cnt[7];     					// we take one bit out of the counter (here bit 7 = the 8th bit)
	assign DAC_Code = {8{cnt_tap}};   			// and we duplicate it 8 times to create the 8-bits DAC value 
															// with the maximum possible amplitude

endmodule