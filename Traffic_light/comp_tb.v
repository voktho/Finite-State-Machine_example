module comp_tb;
  reg [2:0]val;
  reg [2:0] comp_with;
  wire comp;
  
  comparator dut(.val(val),
                 .comp_with(comp_with),
                 .comp(comp));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    val=3'b001;
    comp_with=3'b110;
    
    $display("comp=%d",comp);
    
    #5;
    
    val=3'b101;
    comp_with=3'b101;
    
    $display("comp=%d",comp);
    
    $finish;
  end
  
  
  
  
endmodule
