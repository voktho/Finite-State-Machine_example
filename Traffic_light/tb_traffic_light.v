// Code your testbench here
// or browse Examples
module tb_traffic_light;
reg clk;
reg rstn;
reg start;
wire Red;
wire Yellow;
wire Green;

traffic_light dut(.clk(clk),
.rstn(rstn),
.start(start),
.Red(Red),
.Yellow(Yellow),
.Green(Green)
);


initial begin
  
    $dumpfile("dump.vcd");
    $dumpvars(1);
    

clk=1;
rstn=0;
start=0;

#10 rstn=1;
start=1;



#300 $finish;



end
  
  always #5 clk=~clk;

endmodule
