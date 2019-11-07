module data_memory(MemWrite, WriteData, ALUresult, MemRead, clk, data_result);

input MemWrite;// memory write signal
input MemRead;	// memory read signal
input [15:0] ALUresult;// ALU result address
input [15:0] WriteData;	// Data need to be write 
input [15:0] mem_access_addr;
input clk;
output  [15:0] data_result;	// data result

integer i;
	reg [15:0] ram [255:0];
	wire [7:0] ram_addr = mem_access_addr[8:1];
	initial
	begin
			for(i= 0 ; i< 256 ; i=i+1)
					ram[i] <= 16'b0;
	end


always @ (posedge clk)
begin 
	if(MemWrite==1)
		ram[ram_addr] <= WriteData;
end
assign data_result = (MemRead==1'b1)?ram[ram_addr] : 16'b0;

endmodule;

