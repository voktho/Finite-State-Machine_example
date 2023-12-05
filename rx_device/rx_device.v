module rx_device(input clk,
input rstn,
input rx_start,input rx_data,
output frame_err);
wire [2:0] clk_count,bit_count;

wire [4:0] rx_data_out;


rx_control_FSM dut1(.clk(clk),
.rstn(rstn),
.rx_start(rx_start),
.clk_count_eql_4(clk_count_eql_4),
.bit_count_eql_4(bit_count_eql_4),
.clk_count_clear(clk_count_clear),
.bit_count_clear(bit_count_clear),
.bit_count_incr(bit_count_incr),
.shift_en(shift_en),
.frame_err_gen(frame_err_gen));


counter clk_counter_dut(.clk(clk),
.rstn(rstn),
.clear(clk_count_clear),
.incr(clk_count_incr),
.count(clk_count));


counter bit_counter_dut(
.rstn(rstn),
.clear(bit_count_clear),
.incr(bit_count_incr),
.count(bit_count));


comparator clk_count_comp_dut(.val(clk_count),
.comp_with('d4),
.comp(clk_count_eql_4));


comparator bit_count_comp_dut(.val(bit_count),
.comp_with('d4),
.comp(bit_count_eql_4));

shift_reg_n dut4 (.clk(clk),
.rstn(rstn),
.data_in(rx_data),
.shift_en(shift_en),
.data_out(rx_data_out));


assign frame_err=frame_err_gen & (~ rx_data_out[4]);


endmodule
