// debounce template

module debounce
  (
	input wire       clk,       // 50MHz clock input
	input wire       rst,       // reset input (positive)
	input wire       bouncy_in, // bouncy asynchronous input
	output reg 		 clean_out  // clean debounced output
   );

   /* add wire and register logic */
   reg prev_syncbouncy;
   reg [14:0] counter;
   wire counterAtMax = &counter;
   wire syncbouncy;
   /* instantiate components */
   synchroniser dosync(.clk(clk),.async(bouncy_in),.sync(syncbouncy));
   /* logic */
   always_ff @(posedge clk or  posedge rst)
     if(rst) begin
       counter <= 0;
       prev_syncbouncy <= 0;
       clean_out <= 0;
     end else begin 
       prev_syncbouncy <= syncbouncy;
       if(syncbouncy != prev_syncbouncy) begin 
         counter <= 0;
       end else if (!counterAtMax)
         counter <= counter + 1;
       else 
         clean_out <= syncbouncy;
     end
endmodule // debounce
