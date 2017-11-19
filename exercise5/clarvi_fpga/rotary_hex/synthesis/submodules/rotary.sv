// rotary decoder template

module rotary
  (
	input  wire clk,
	input  wire rst,
	input  wire [1:0] rotary_in,
	output logic [7:0] rotary_pos,
        output logic rot_cw,
        output logic rot_ccw
   );

   /* add wire and register definitions */
   wire [1:0] debounced_rotary_in;
   reg [1:0] state = 0; // prev state

    
   /* Instantiate debouncing components */
   debounce debounce_0(.clk(clk), .rst(rst), .bouncy_in(rotary_in[0]), 
     .clean_out(debounced_rotary_in[0]));
   debounce debounce_1(.clk(clk), .rst(rst), .bouncy_in(rotary_in[1]), 
     .clean_out(debounced_rotary_in[1]));

    
   /* Synchronous value manipulation logic */
   always_ff @(posedge clk) 
   begin
     rot_cw  <= 0;
     rot_ccw <= 0;

     if(rst)
     begin
       state <= 0;
       rotary_pos <= 0;
     end else begin

       if(state == 0 && debounced_rotary_in == 1 ) //cw
       begin
         rot_cw <= 1;
         rotary_pos <= rotary_pos + 1;
       end

       if(state == 0 && debounced_rotary_in == 2 ) //ccw
       begin
         rot_ccw <= 1;
         rotary_pos <= rotary_pos - 1;
       end

       state <= debounced_rotary_in;
     end
   end

endmodule // rotarydecoder
