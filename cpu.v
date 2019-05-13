module cpu(clk, rst);
  
  input clk , rst ;
  wire [2:0] opcode ;
  wire IR_write, ld_A, ld_B, IorD, MtoS, src_A, src_B;
  wire pc_src,mem_read, mem_write, pc_write_cond, pc_write;
  wire push, pop, tos ;
  wire [1:0] alu_op ;
  
  
  
  
  controller cu(clk, rst, opcode, IR_write, ld_A, ld_B, IorD, MtoS, src_A, src_B,
                 pc_src,mem_read, mem_write, pc_write_cond, pc_write, alu_op, push, pop, tos);
                 
                 
  datapath dp(clk, rst, IR_write, ld_A, ld_B, IorD, MtoS, src_A, src_B,
                 pc_src,mem_read, mem_write, pc_write_cond, pc_write, alu_op,
                 push, pop, tos, opcode);
                 
endmodule