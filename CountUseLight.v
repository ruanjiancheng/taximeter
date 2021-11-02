module CountUseLight(cin, conf, reset, clk, light);

input		cin;
input		reset;
input		clk;
input		conf;

output[4:0]	light;

reg[4:0]	light;

wire		tmp;

assign		tmp = reset&conf;

always @(negedge tmp or posedge clk) begin
	if(!tmp) begin
		light <= 0;
	end
	else if(clk) begin
		if(cin) begin
			light <= (light<<1) + 1;
		end 
	end
end

endmodule