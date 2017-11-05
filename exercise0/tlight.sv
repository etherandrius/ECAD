
module tlight(input logic clk, input logic rst,
              output logic r,
              output logic a,
              output logic g);

logic [2:0] state;
always_ff @(posedge clk or posedge rst)
	if(rst)
    state <= 3'b000;

always_ff @(posedge clk)
		state <= ( state[0])? 3'b010 :
             (!state[2])? 3'b100 :
			       ( state[1])? 3'b001 : 3'b110;
assign g = state[0];  
assign a = state[1];  
assign r = state[2]; 
endmodule // tlights

