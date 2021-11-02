module BCDcounter(a, cin, cout, sum);

input[3:0]	a;
input		cin;

output[3:0]	sum;
output		cout;

wire[4:0]	tmp;

assign		tmp = a+cin;

assign		{cout, sum} = tmp>9 ? tmp+6 : tmp;

endmodule