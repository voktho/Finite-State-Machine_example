module shift_reg_n #(parameter n=5) (input clk,
                                     input rstn,
                  		     input data_in,
                                     input shift_en,
                                     output reg [n-1:0] data_out);
  
  
  
  always @(posedge clk,negedge rstn)
    begin
      if(!rstn)
        data_out <= 'b0;
      else
        data_out <= shift_en ? {data_in,data_out[n-1:1]}:data_out;
      
      end
endmodule
