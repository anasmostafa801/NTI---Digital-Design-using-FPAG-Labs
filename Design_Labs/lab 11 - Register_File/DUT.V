module Register_File (
    input wire i_clk, i_rst, i_we,
    input wire [31:0] i_rd,
    input wire [4:0] i_rd_addr,
    input wire [4:0] i_rs1_addr,
    input wire [4:0] i_rs2_addr,
    output wire [31:0] o_rs1,
    output wire [31:0] o_rs2
);

integer i;
reg [31:0] register_file [0:31];

assign o_rs1 = (!i_rs1_addr) ? 'd0 : register_file[i_rs1_addr];
assign o_rs2 = (!i_rs2_addr) ? 'd0 : register_file[i_rs2_addr];

always @(posedge i_clk or negedge i_rst) begin
 if(!i_rst) begin
  for(i = 0; i < 32; i = i + 1) begin
    register_file[i] <= 'd0;
  end
 end 
 else if(i_we && !i_rd_addr) begin
   register_file[i_rd_addr] <= i_rd;
 end 
end
endmodule