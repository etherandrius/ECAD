`timescale 1ns / 1ps

module tb_tlight(
  output r,
  output a,
  output g);

  logic clk;      // clock signal we are going to generate
  logic rst;
  logic state;
  //initial state = 0; 
                  // instantiate design under test (dut)
  tlight dut(.clk(clk), .rst(rst), .r(r), .a(a), .g(g));

  initial         // sequence of events to simulate
    begin
      state = 0;
      clk = 0;   // at time=0 set clock to zero
      rst = 1;
      #20 rst = 0;
    end

  always #5       // every five simulation units...
    clk <= !clk;  // ...invert the clock

                  // produce debug output on the negative edge of the clock
  always @(negedge clk)
    $display("time=%05d: (r,a,g) = (%1d,%1d,%1d)",
      $time,      // simulator time
      r, a, g);   // outputs to display: red, amber, green

endmodule // tb_tlight
