module BCDadder(a, b, cin, sum, cout);

input[3:0] 	a,b;
input		cin;

output[3:0]	sum;
output		cout;

wire[4:0] 	tmp;

assign		tmp = (a+b+cin);

assign		{cout, sum} = (tmp>9) ? tmp+6 : tmp;

endmodule