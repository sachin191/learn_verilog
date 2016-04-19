module test;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;            
   
  /* Instantiate HW counter */
  reg reset = 0;
  wire [7:0] value;
  counter c1 (value, clk, reset);  /* Instantiate counter */

  /* Make a reset that pulses once. */
  initial begin
     # 17 reset = 1;
     # 11 reset = 0;
     # 29 reset = 1;
     # 11 reset = 0;
     # 1000 $finish;
  end

  initial begin
     $dumpfile("counter.vcd");
     $dumpvars();
     $monitor("At time %t, value = %h (%0d)", $time, value, value);
  end

endmodule // test
