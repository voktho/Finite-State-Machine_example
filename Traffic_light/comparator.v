module comparator(input [2:0]val,
                  input [2:0]comp_with,
                 output comp);
  
  assign comp=(val==comp_with);
  
  
endmodule
