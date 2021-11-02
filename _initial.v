module _initial(conf, method, reset, pause, clk, cin, new_cost, new_len,
				len, cost, add_len, add_cost);

input			clk;
input[3:0]		method;
input			conf,reset,pause;
input[11:0]		cin;
input[11:0]		new_cost;
input[11:0]		new_len;

output[11:0]	len;
output[11:0]	cost;
output			add_len;
output[11:0]	add_cost;

reg[11:0]		pause_time, price_per_km, free_len, initial_price;

reg[11:0]		add_cost;

reg 			add_len;

reg[11:0]		len, cost;
reg[3:0]		tmp;

always @(posedge clk or negedge reset) begin

	if(!reset) begin
		initial_price <= 12'h009;
		free_len <= 12'h003;
		price_per_km <= 12'h003;
		pause_time <= 12'h003;
		len <= 0;
		cost <= 12'h009;
		add_cost <= 12'h000;
		add_len <= 0;
	end
	
	else if(clk) begin
		
		if(!conf) begin
			if(method) begin
				if(method[0]) begin 
					initial_price <= cin;
				end
				if(method[1]) begin
					free_len <= cin;
				end
				if(method[2]) begin
					price_per_km <= cin;
				end
				if(method[3]) begin
					pause_time <= cin;
				end
			end
			
			else begin	//method == 0
				add_len <= 0;
				add_cost <= 12'h000;
				len <= 0;
				cost <= initial_price;
			end
		end//conf
		
		else begin
			len <= new_len;
			cost <= new_cost;
			
			if(pause) begin
				add_len <= 0;
				if(tmp != 0) begin
					tmp <= tmp - 1;
					add_cost <= 0;
				end
				else begin
					add_cost <= price_per_km;
				end
			end
			
			else begin
				tmp <= pause_time[3:0];
				add_len <= 1;
				if(len >= free_len-1) begin
					add_cost <= price_per_km;
				end
				else begin
					add_cost <= 0;
				end
			end
		end//else
		
	end
end

endmodule