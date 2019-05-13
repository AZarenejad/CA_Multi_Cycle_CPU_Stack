module memory(clk, address, write_data, read_data, mem_read, mem_write);
  input clk ;
  input [4:0] address ;
  input [7:0] write_data ;
  input mem_read, mem_write;
  output [7:0] read_data;
  
  
  reg [7:0] mem [31:0];
  
  initial begin
  //Code
  mem[0] = 8'b10011001;  //push 1
  mem[1] = 8'b10011010;  // push 2
  mem[2] = 8'b10011011;  //push 3
  mem[3] = 8'b10011100;  //push 4
  mem[4] = 8'b10011101;  //push 5
  
  mem[5] = 8'b00000000 ;  //add
  mem[6] = 8'b00000000 ;   //add
  mem[7] = 8'b00000000 ;   //add
  mem[8] = 8'b00000000 ;   //add
  
  
 
  
  
  //Numbers in Array
  mem[25] = 8'd1;
  mem[26] = 8'd2 ;
  mem[27] = 8'd3;
  mem[28] = 8'd4 ;
  mem[29] = 8'd5 ;
  
  end

  

  
  assign read_data = mem_read ? mem[address] : 8'bz ;
  
  always @(posedge clk) begin
    if (mem_write)
      mem[address] <= write_data ;
  end
  
endmodule
