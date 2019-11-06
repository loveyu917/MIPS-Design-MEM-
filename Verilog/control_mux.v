module control_mux(memtoReg, ALUresult);

input memtoReg;

input [15:0] ALUresult;

input [15:0] DM_result;

output reg [15:0] data;


always @ *
begin 
	if(memtoReg) 
		data <= ALUresult;
	else
		data <= DM_result;

end
endmodule
