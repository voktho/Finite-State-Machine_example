// Code your design here
module rx_control_FSM(input clk,
input rstn,
input rx_start,
input clk_count_eql_4,
input bit_count_eql_4,
output reg clk_count_clear,
output reg bit_count_clear,
output reg bit_count_incr,
output reg shift_en,
output reg frame_err_gen);

reg [1:0] pstate,nstate;
parameter [1:0] IDLE=2'b00,WAIT=2'b01,SHIFT=2'b10,CHECK=2'b11;



//nextstate

always @(*)

begin
casez(pstate)
IDLE: nstate=rx_start?WAIT:IDLE;
WAIT: nstate=clk_count_eql_4?SHIFT:WAIT;
SHIFT: nstate=bit_count_eql_4?CHECK:WAIT;
CHECK: nstate=IDLE;
default: nstate='bx;
endcase

end





//pstate

always @(posedge clk,negedge rstn)
begin
if(!rstn)
pstate<=IDLE;
else
pstate<=nstate;
end



//outpout
always @(*)
begin
casez(pstate)
IDLE: begin

clk_count_clear=1;
bit_count_clear=1;
bit_count_incr=0;
shift_en=0;
frame_err_gen=0;
end

WAIT:begin
clk_count_clear=clk_count_eql_4;
bit_count_clear=0;
bit_count_incr=0;
shift_en=0;
frame_err_gen=0;
end

SHIFT:begin

clk_count_clear=1;
bit_count_clear=bit_count_eql_4;
bit_count_incr=1;
shift_en=1;
frame_err_gen=0;
end
CHECK:begin

clk_count_clear=1;
bit_count_clear=1;
bit_count_incr=0;
shift_en=0;
frame_err_gen=1;
end
endcase
end


endmodule
