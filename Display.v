module Display(method, conf, cin, len, cost, display_seg1, display_seg2);

input[3:0] 		method;
input			conf;
input[11:0] 	cin;
input[11:0]		cost, len;

output[11:0]	display_seg1;
output[11:0]	display_seg2;

assign display_seg1 = (!conf) ? {8'b00000000, method} : cost;
assign display_seg2 = (!conf) ? cin : len;

endmodule