module stack(clk, rst, d_in, push, pop, tos, d_out);
  
  parameter WIDTH = 8;
	parameter DEPTH = 7;
  input clk, rst, push, pop, tos;
  input [WIDTH - 1:0] d_in;
  output reg [WIDTH - 1:0] d_out;
  
	reg [DEPTH - 1:0] ptr;
	reg [WIDTH - 1:0] stack [0:(1 << DEPTH) - 1];
	

	always @(posedge clk , posedge rst) begin
		if (rst)
			ptr <= 0;
		else begin
		    if (push)
			     ptr <= ptr + 1;
		    else if (pop)
			     ptr <= ptr - 1;
		    else if (tos)
		      ptr <= ptr ;
		end
	end

	always @(posedge clk) begin
		if (push || pop || tos) begin
			if(push)
			   stack[ptr] <= d_in;
			else if (pop)
			   d_out <= stack[ptr - 1];
			else if (tos)
			  d_out <= stack[ptr - 1 ];
		end
	end

endmodule
  
  

  
  