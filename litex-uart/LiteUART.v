//--------------------------------------------------------------------------------
// Auto-generated by Migen (e2e6c72) & LiteX (1b07c084) on 2020-02-28 14:05:54
//--------------------------------------------------------------------------------
module top(
	input sys_clk,
	input sys_rst,
	output reg serial_tx,
	input serial_rx,
	input [29:0] wb_adr,
	input [31:0] wb_dat_w,
	output [31:0] wb_dat_r,
	input [3:0] wb_sel,
	input wb_cyc,
	input wb_stb,
	output wb_ack,
	input wb_we,
	input [2:0] wb_cti,
	input [1:0] wb_bte,
	output wb_err,
	output irq_uart
);

wire sys_clk_1;
wire sys_rst_1;
wire por_clk;
reg main_int_rst = 1'd1;
reg [31:0] main_uart_phy_storage = 32'd64424509;
reg main_uart_phy_re = 1'd0;
wire main_uart_phy_sink_valid;
reg main_uart_phy_sink_ready = 1'd0;
wire main_uart_phy_sink_first;
wire main_uart_phy_sink_last;
wire [7:0] main_uart_phy_sink_payload_data;
reg main_uart_phy_uart_clk_txen = 1'd0;
reg [31:0] main_uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] main_uart_phy_tx_reg = 8'd0;
reg [3:0] main_uart_phy_tx_bitcount = 4'd0;
reg main_uart_phy_tx_busy = 1'd0;
reg main_uart_phy_source_valid = 1'd0;
wire main_uart_phy_source_ready;
reg main_uart_phy_source_first = 1'd0;
reg main_uart_phy_source_last = 1'd0;
reg [7:0] main_uart_phy_source_payload_data = 8'd0;
reg main_uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] main_uart_phy_phase_accumulator_rx = 32'd0;
wire main_uart_phy_rx;
reg main_uart_phy_rx_r = 1'd0;
reg [7:0] main_uart_phy_rx_reg = 8'd0;
reg [3:0] main_uart_phy_rx_bitcount = 4'd0;
reg main_uart_phy_rx_busy = 1'd0;
wire main_uart_rxtx_re;
wire [7:0] main_uart_rxtx_r;
wire main_uart_rxtx_we;
wire [7:0] main_uart_rxtx_w;
wire main_uart_txfull_status;
wire main_uart_txfull_we;
wire main_uart_rxempty_status;
wire main_uart_rxempty_we;
wire main_uart_irq;
wire main_uart_tx_status;
reg main_uart_tx_pending = 1'd0;
wire main_uart_tx_trigger;
reg main_uart_tx_clear = 1'd0;
reg main_uart_tx_old_trigger = 1'd0;
wire main_uart_rx_status;
reg main_uart_rx_pending = 1'd0;
wire main_uart_rx_trigger;
reg main_uart_rx_clear = 1'd0;
reg main_uart_rx_old_trigger = 1'd0;
wire main_uart_status_re;
wire [1:0] main_uart_status_r;
wire main_uart_status_we;
reg [1:0] main_uart_status_w = 2'd0;
wire main_uart_pending_re;
wire [1:0] main_uart_pending_r;
wire main_uart_pending_we;
reg [1:0] main_uart_pending_w = 2'd0;
reg [1:0] main_uart_storage = 2'd0;
reg main_uart_re = 1'd0;
wire main_uart_sink_valid;
wire main_uart_sink_ready;
wire main_uart_sink_first;
wire main_uart_sink_last;
wire [7:0] main_uart_sink_payload_data;
wire main_uart_source_valid;
wire main_uart_source_ready;
reg main_uart_source_first = 1'd0;
reg main_uart_source_last = 1'd0;
wire [7:0] main_uart_source_payload_data;
reg main_uart_reset = 1'd0;
reg [13:0] main_adr = 14'd0;
reg main_we = 1'd0;
wire [7:0] main_dat_w;
wire [7:0] main_dat_r;
wire [29:0] main_bus_wishbone_adr;
wire [31:0] main_bus_wishbone_dat_w;
wire [31:0] main_bus_wishbone_dat_r;
wire [3:0] main_bus_wishbone_sel;
wire main_bus_wishbone_cyc;
wire main_bus_wishbone_stb;
reg main_bus_wishbone_ack = 1'd0;
wire main_bus_wishbone_we;
wire [2:0] main_bus_wishbone_cti;
wire [1:0] main_bus_wishbone_bte;
reg main_bus_wishbone_err = 1'd0;
wire [29:0] main_wb_bus_adr;
wire [31:0] main_wb_bus_dat_w;
wire [31:0] main_wb_bus_dat_r;
wire [3:0] main_wb_bus_sel;
wire main_wb_bus_cyc;
wire main_wb_bus_stb;
wire main_wb_bus_ack;
wire main_wb_bus_we;
wire [2:0] main_wb_bus_cti;
wire [1:0] main_wb_bus_bte;
wire main_wb_bus_err;
reg builder_state = 1'd0;
reg builder_next_state = 1'd0;
wire [29:0] builder_shared_adr;
wire [31:0] builder_shared_dat_w;
reg [31:0] builder_shared_dat_r = 32'd0;
wire [3:0] builder_shared_sel;
wire builder_shared_cyc;
wire builder_shared_stb;
reg builder_shared_ack = 1'd0;
wire builder_shared_we;
wire [2:0] builder_shared_cti;
wire [1:0] builder_shared_bte;
wire builder_shared_err;
wire builder_request;
wire builder_grant;
wire builder_slave_sel;
reg builder_slave_sel_r = 1'd0;
reg builder_error = 1'd0;
wire builder_wait;
wire builder_done;
reg [19:0] builder_count = 20'd1000000;
wire [13:0] builder_interface0_bank_bus_adr;
wire builder_interface0_bank_bus_we;
wire [7:0] builder_interface0_bank_bus_dat_w;
reg [7:0] builder_interface0_bank_bus_dat_r = 8'd0;
wire builder_csrbank0_txfull_re;
wire builder_csrbank0_txfull_r;
wire builder_csrbank0_txfull_we;
wire builder_csrbank0_txfull_w;
wire builder_csrbank0_rxempty_re;
wire builder_csrbank0_rxempty_r;
wire builder_csrbank0_rxempty_we;
wire builder_csrbank0_rxempty_w;
wire builder_csrbank0_ev_enable0_re;
wire [1:0] builder_csrbank0_ev_enable0_r;
wire builder_csrbank0_ev_enable0_we;
wire [1:0] builder_csrbank0_ev_enable0_w;
wire builder_csrbank0_sel;
wire [13:0] builder_interface1_bank_bus_adr;
wire builder_interface1_bank_bus_we;
wire [7:0] builder_interface1_bank_bus_dat_w;
reg [7:0] builder_interface1_bank_bus_dat_r = 8'd0;
wire builder_csrbank1_tuning_word3_re;
wire [7:0] builder_csrbank1_tuning_word3_r;
wire builder_csrbank1_tuning_word3_we;
wire [7:0] builder_csrbank1_tuning_word3_w;
wire builder_csrbank1_tuning_word2_re;
wire [7:0] builder_csrbank1_tuning_word2_r;
wire builder_csrbank1_tuning_word2_we;
wire [7:0] builder_csrbank1_tuning_word2_w;
wire builder_csrbank1_tuning_word1_re;
wire [7:0] builder_csrbank1_tuning_word1_r;
wire builder_csrbank1_tuning_word1_we;
wire [7:0] builder_csrbank1_tuning_word1_w;
wire builder_csrbank1_tuning_word0_re;
wire [7:0] builder_csrbank1_tuning_word0_r;
wire builder_csrbank1_tuning_word0_we;
wire [7:0] builder_csrbank1_tuning_word0_w;
wire builder_csrbank1_sel;
wire [13:0] builder_adr;
wire builder_we;
wire [7:0] builder_dat_w;
wire [7:0] builder_dat_r;
reg [29:0] builder_array_muxed0 = 30'd0;
reg [31:0] builder_array_muxed1 = 32'd0;
reg [3:0] builder_array_muxed2 = 4'd0;
reg builder_array_muxed3 = 1'd0;
reg builder_array_muxed4 = 1'd0;
reg builder_array_muxed5 = 1'd0;
reg [2:0] builder_array_muxed6 = 3'd0;
reg [1:0] builder_array_muxed7 = 2'd0;
(* no_retiming = "true" *) reg builder_regs0 = 1'd0;
(* no_retiming = "true" *) reg builder_regs1 = 1'd0;

assign main_wb_bus_adr = wb_adr;
assign main_wb_bus_dat_w = wb_dat_w;
assign wb_dat_r = main_wb_bus_dat_r;
assign main_wb_bus_sel = wb_sel;
assign main_wb_bus_cyc = wb_cyc;
assign main_wb_bus_stb = wb_stb;
assign wb_ack = main_wb_bus_ack;
assign main_wb_bus_we = wb_we;
assign main_wb_bus_cti = wb_cti;
assign main_wb_bus_bte = wb_bte;
assign wb_err = main_wb_bus_err;
assign irq_uart = main_uart_irq;
assign sys_clk_1 = sys_clk;
assign por_clk = sys_clk;
assign sys_rst_1 = main_int_rst;
assign main_uart_sink_valid = main_uart_phy_source_valid;
assign main_uart_phy_source_ready = main_uart_sink_ready;
assign main_uart_sink_first = main_uart_phy_source_first;
assign main_uart_sink_last = main_uart_phy_source_last;
assign main_uart_sink_payload_data = main_uart_phy_source_payload_data;
assign main_uart_phy_sink_valid = main_uart_source_valid;
assign main_uart_source_ready = main_uart_phy_sink_ready;
assign main_uart_phy_sink_first = main_uart_source_first;
assign main_uart_phy_sink_last = main_uart_source_last;
assign main_uart_phy_sink_payload_data = main_uart_source_payload_data;
assign main_uart_source_valid = main_uart_rxtx_re;
assign main_uart_source_payload_data = main_uart_rxtx_r;
assign main_uart_txfull_status = main_uart_phy_tx_busy;
assign main_uart_tx_trigger = (~main_uart_source_ready);
assign main_uart_rxempty_status = (~main_uart_rx_pending);
assign main_uart_rxtx_w = main_uart_sink_payload_data;
assign main_uart_sink_ready = main_uart_rxtx_we;
assign main_uart_rx_trigger = main_uart_sink_valid;
always @(*) begin
	main_uart_tx_clear <= 1'd0;
	if ((main_uart_pending_re & main_uart_pending_r[0])) begin
		main_uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	main_uart_status_w <= 2'd0;
	main_uart_status_w[0] <= main_uart_tx_status;
	main_uart_status_w[1] <= main_uart_rx_status;
end
always @(*) begin
	main_uart_rx_clear <= 1'd0;
	if ((main_uart_pending_re & main_uart_pending_r[1])) begin
		main_uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	main_uart_pending_w <= 2'd0;
	main_uart_pending_w[0] <= main_uart_tx_pending;
	main_uart_pending_w[1] <= main_uart_rx_pending;
end
assign main_uart_irq = ((main_uart_pending_w[0] & main_uart_storage[0]) | (main_uart_pending_w[1] & main_uart_storage[1]));
assign main_uart_tx_status = main_uart_tx_trigger;
assign main_uart_rx_status = main_uart_rx_trigger;
assign main_dat_w = main_bus_wishbone_dat_w;
assign main_bus_wishbone_dat_r = main_dat_r;
always @(*) begin
	builder_next_state <= 1'd0;
	main_adr <= 14'd0;
	main_we <= 1'd0;
	main_bus_wishbone_ack <= 1'd0;
	builder_next_state <= builder_state;
	case (builder_state)
		1'd1: begin
			main_bus_wishbone_ack <= 1'd1;
			builder_next_state <= 1'd0;
		end
		default: begin
			if ((main_bus_wishbone_cyc & main_bus_wishbone_stb)) begin
				main_adr <= main_bus_wishbone_adr;
				main_we <= main_bus_wishbone_we;
				builder_next_state <= 1'd1;
			end
		end
	endcase
end
assign builder_shared_adr = builder_array_muxed0;
assign builder_shared_dat_w = builder_array_muxed1;
assign builder_shared_sel = builder_array_muxed2;
assign builder_shared_cyc = builder_array_muxed3;
assign builder_shared_stb = builder_array_muxed4;
assign builder_shared_we = builder_array_muxed5;
assign builder_shared_cti = builder_array_muxed6;
assign builder_shared_bte = builder_array_muxed7;
assign main_wb_bus_dat_r = builder_shared_dat_r;
assign main_wb_bus_ack = (builder_shared_ack & (builder_grant == 1'd0));
assign main_wb_bus_err = (builder_shared_err & (builder_grant == 1'd0));
assign builder_request = {main_wb_bus_cyc};
assign builder_grant = 1'd0;
assign builder_slave_sel = (builder_shared_adr[29:14] == 1'd0);
assign main_bus_wishbone_adr = builder_shared_adr;
assign main_bus_wishbone_dat_w = builder_shared_dat_w;
assign main_bus_wishbone_sel = builder_shared_sel;
assign main_bus_wishbone_stb = builder_shared_stb;
assign main_bus_wishbone_we = builder_shared_we;
assign main_bus_wishbone_cti = builder_shared_cti;
assign main_bus_wishbone_bte = builder_shared_bte;
assign main_bus_wishbone_cyc = (builder_shared_cyc & builder_slave_sel);
assign builder_shared_err = main_bus_wishbone_err;
assign builder_wait = ((builder_shared_stb & builder_shared_cyc) & (~builder_shared_ack));
always @(*) begin
	builder_shared_ack <= 1'd0;
	builder_shared_dat_r <= 32'd0;
	builder_error <= 1'd0;
	builder_shared_ack <= main_bus_wishbone_ack;
	builder_shared_dat_r <= ({32{builder_slave_sel_r}} & main_bus_wishbone_dat_r);
	if (builder_done) begin
		builder_shared_dat_r <= 32'd4294967295;
		builder_shared_ack <= 1'd1;
		builder_error <= 1'd1;
	end
end
assign builder_done = (builder_count == 1'd0);
assign builder_csrbank0_sel = (builder_interface0_bank_bus_adr[13:9] == 1'd1);
assign main_uart_rxtx_r = builder_interface0_bank_bus_dat_w[7:0];
assign main_uart_rxtx_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[2:0] == 1'd0));
assign main_uart_rxtx_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[2:0] == 1'd0));
assign builder_csrbank0_txfull_r = builder_interface0_bank_bus_dat_w[0];
assign builder_csrbank0_txfull_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[2:0] == 1'd1));
assign builder_csrbank0_txfull_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[2:0] == 1'd1));
assign builder_csrbank0_rxempty_r = builder_interface0_bank_bus_dat_w[0];
assign builder_csrbank0_rxempty_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[2:0] == 2'd2));
assign builder_csrbank0_rxempty_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[2:0] == 2'd2));
assign main_uart_status_r = builder_interface0_bank_bus_dat_w[1:0];
assign main_uart_status_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[2:0] == 2'd3));
assign main_uart_status_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[2:0] == 2'd3));
assign main_uart_pending_r = builder_interface0_bank_bus_dat_w[1:0];
assign main_uart_pending_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[2:0] == 3'd4));
assign main_uart_pending_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[2:0] == 3'd4));
assign builder_csrbank0_ev_enable0_r = builder_interface0_bank_bus_dat_w[1:0];
assign builder_csrbank0_ev_enable0_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[2:0] == 3'd5));
assign builder_csrbank0_ev_enable0_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[2:0] == 3'd5));
assign builder_csrbank0_txfull_w = main_uart_txfull_status;
assign main_uart_txfull_we = builder_csrbank0_txfull_we;
assign builder_csrbank0_rxempty_w = main_uart_rxempty_status;
assign main_uart_rxempty_we = builder_csrbank0_rxempty_we;
assign builder_csrbank0_ev_enable0_w = main_uart_storage[1:0];
assign builder_csrbank1_sel = (builder_interface1_bank_bus_adr[13:9] == 1'd0);
assign builder_csrbank1_tuning_word3_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_tuning_word3_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[1:0] == 1'd0));
assign builder_csrbank1_tuning_word3_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[1:0] == 1'd0));
assign builder_csrbank1_tuning_word2_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_tuning_word2_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[1:0] == 1'd1));
assign builder_csrbank1_tuning_word2_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[1:0] == 1'd1));
assign builder_csrbank1_tuning_word1_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_tuning_word1_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[1:0] == 2'd2));
assign builder_csrbank1_tuning_word1_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[1:0] == 2'd2));
assign builder_csrbank1_tuning_word0_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_tuning_word0_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[1:0] == 2'd3));
assign builder_csrbank1_tuning_word0_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[1:0] == 2'd3));
assign builder_csrbank1_tuning_word3_w = main_uart_phy_storage[31:24];
assign builder_csrbank1_tuning_word2_w = main_uart_phy_storage[23:16];
assign builder_csrbank1_tuning_word1_w = main_uart_phy_storage[15:8];
assign builder_csrbank1_tuning_word0_w = main_uart_phy_storage[7:0];
assign builder_adr = main_adr;
assign builder_we = main_we;
assign builder_dat_w = main_dat_w;
assign main_dat_r = builder_dat_r;
assign builder_interface0_bank_bus_adr = builder_adr;
assign builder_interface1_bank_bus_adr = builder_adr;
assign builder_interface0_bank_bus_we = builder_we;
assign builder_interface1_bank_bus_we = builder_we;
assign builder_interface0_bank_bus_dat_w = builder_dat_w;
assign builder_interface1_bank_bus_dat_w = builder_dat_w;
assign builder_dat_r = (builder_interface0_bank_bus_dat_r | builder_interface1_bank_bus_dat_r);
always @(*) begin
	builder_array_muxed0 <= 30'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed0 <= main_wb_bus_adr;
		end
	endcase
end
always @(*) begin
	builder_array_muxed1 <= 32'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed1 <= main_wb_bus_dat_w;
		end
	endcase
end
always @(*) begin
	builder_array_muxed2 <= 4'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed2 <= main_wb_bus_sel;
		end
	endcase
end
always @(*) begin
	builder_array_muxed3 <= 1'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed3 <= main_wb_bus_cyc;
		end
	endcase
end
always @(*) begin
	builder_array_muxed4 <= 1'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed4 <= main_wb_bus_stb;
		end
	endcase
end
always @(*) begin
	builder_array_muxed5 <= 1'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed5 <= main_wb_bus_we;
		end
	endcase
end
always @(*) begin
	builder_array_muxed6 <= 3'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed6 <= main_wb_bus_cti;
		end
	endcase
end
always @(*) begin
	builder_array_muxed7 <= 2'd0;
	case (builder_grant)
		default: begin
			builder_array_muxed7 <= main_wb_bus_bte;
		end
	endcase
end
assign main_uart_phy_rx = builder_regs1;

always @(posedge por_clk) begin
	main_int_rst <= sys_rst;
end

always @(posedge sys_clk_1) begin
	main_uart_phy_sink_ready <= 1'd0;
	if (((main_uart_phy_sink_valid & (~main_uart_phy_tx_busy)) & (~main_uart_phy_sink_ready))) begin
		main_uart_phy_tx_reg <= main_uart_phy_sink_payload_data;
		main_uart_phy_tx_bitcount <= 1'd0;
		main_uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((main_uart_phy_uart_clk_txen & main_uart_phy_tx_busy)) begin
			main_uart_phy_tx_bitcount <= (main_uart_phy_tx_bitcount + 1'd1);
			if ((main_uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((main_uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					main_uart_phy_tx_busy <= 1'd0;
					main_uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= main_uart_phy_tx_reg[0];
					main_uart_phy_tx_reg <= {1'd0, main_uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (main_uart_phy_tx_busy) begin
		{main_uart_phy_uart_clk_txen, main_uart_phy_phase_accumulator_tx} <= (main_uart_phy_phase_accumulator_tx + main_uart_phy_storage);
	end else begin
		{main_uart_phy_uart_clk_txen, main_uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	main_uart_phy_source_valid <= 1'd0;
	main_uart_phy_rx_r <= main_uart_phy_rx;
	if ((~main_uart_phy_rx_busy)) begin
		if (((~main_uart_phy_rx) & main_uart_phy_rx_r)) begin
			main_uart_phy_rx_busy <= 1'd1;
			main_uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (main_uart_phy_uart_clk_rxen) begin
			main_uart_phy_rx_bitcount <= (main_uart_phy_rx_bitcount + 1'd1);
			if ((main_uart_phy_rx_bitcount == 1'd0)) begin
				if (main_uart_phy_rx) begin
					main_uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((main_uart_phy_rx_bitcount == 4'd9)) begin
					main_uart_phy_rx_busy <= 1'd0;
					if (main_uart_phy_rx) begin
						main_uart_phy_source_payload_data <= main_uart_phy_rx_reg;
						main_uart_phy_source_valid <= 1'd1;
					end
				end else begin
					main_uart_phy_rx_reg <= {main_uart_phy_rx, main_uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (main_uart_phy_rx_busy) begin
		{main_uart_phy_uart_clk_rxen, main_uart_phy_phase_accumulator_rx} <= (main_uart_phy_phase_accumulator_rx + main_uart_phy_storage);
	end else begin
		{main_uart_phy_uart_clk_rxen, main_uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (main_uart_tx_clear) begin
		main_uart_tx_pending <= 1'd0;
	end
	main_uart_tx_old_trigger <= main_uart_tx_trigger;
	if (((~main_uart_tx_trigger) & main_uart_tx_old_trigger)) begin
		main_uart_tx_pending <= 1'd1;
	end
	if (main_uart_rx_clear) begin
		main_uart_rx_pending <= 1'd0;
	end
	main_uart_rx_old_trigger <= main_uart_rx_trigger;
	if (((~main_uart_rx_trigger) & main_uart_rx_old_trigger)) begin
		main_uart_rx_pending <= 1'd1;
	end
	if (main_uart_reset) begin
		main_uart_tx_pending <= 1'd0;
		main_uart_tx_old_trigger <= 1'd0;
		main_uart_rx_pending <= 1'd0;
		main_uart_rx_old_trigger <= 1'd0;
	end
	builder_state <= builder_next_state;
	builder_slave_sel_r <= builder_slave_sel;
	if (builder_wait) begin
		if ((~builder_done)) begin
			builder_count <= (builder_count - 1'd1);
		end
	end else begin
		builder_count <= 20'd1000000;
	end
	builder_interface0_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank0_sel) begin
		case (builder_interface0_bank_bus_adr[2:0])
			1'd0: begin
				builder_interface0_bank_bus_dat_r <= main_uart_rxtx_w;
			end
			1'd1: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_txfull_w;
			end
			2'd2: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_rxempty_w;
			end
			2'd3: begin
				builder_interface0_bank_bus_dat_r <= main_uart_status_w;
			end
			3'd4: begin
				builder_interface0_bank_bus_dat_r <= main_uart_pending_w;
			end
			3'd5: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_ev_enable0_w;
			end
		endcase
	end
	if (builder_csrbank0_ev_enable0_re) begin
		main_uart_storage[1:0] <= builder_csrbank0_ev_enable0_r;
	end
	main_uart_re <= builder_csrbank0_ev_enable0_re;
	builder_interface1_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank1_sel) begin
		case (builder_interface1_bank_bus_adr[1:0])
			1'd0: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_tuning_word3_w;
			end
			1'd1: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_tuning_word2_w;
			end
			2'd2: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_tuning_word1_w;
			end
			2'd3: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_tuning_word0_w;
			end
		endcase
	end
	if (builder_csrbank1_tuning_word3_re) begin
		main_uart_phy_storage[31:24] <= builder_csrbank1_tuning_word3_r;
	end
	if (builder_csrbank1_tuning_word2_re) begin
		main_uart_phy_storage[23:16] <= builder_csrbank1_tuning_word2_r;
	end
	if (builder_csrbank1_tuning_word1_re) begin
		main_uart_phy_storage[15:8] <= builder_csrbank1_tuning_word1_r;
	end
	if (builder_csrbank1_tuning_word0_re) begin
		main_uart_phy_storage[7:0] <= builder_csrbank1_tuning_word0_r;
	end
	main_uart_phy_re <= builder_csrbank1_tuning_word0_re;
	if (sys_rst_1) begin
		serial_tx <= 1'd1;
		main_uart_phy_storage <= 32'd64424509;
		main_uart_phy_re <= 1'd0;
		main_uart_phy_sink_ready <= 1'd0;
		main_uart_phy_uart_clk_txen <= 1'd0;
		main_uart_phy_phase_accumulator_tx <= 32'd0;
		main_uart_phy_tx_reg <= 8'd0;
		main_uart_phy_tx_bitcount <= 4'd0;
		main_uart_phy_tx_busy <= 1'd0;
		main_uart_phy_source_valid <= 1'd0;
		main_uart_phy_source_payload_data <= 8'd0;
		main_uart_phy_uart_clk_rxen <= 1'd0;
		main_uart_phy_phase_accumulator_rx <= 32'd0;
		main_uart_phy_rx_r <= 1'd0;
		main_uart_phy_rx_reg <= 8'd0;
		main_uart_phy_rx_bitcount <= 4'd0;
		main_uart_phy_rx_busy <= 1'd0;
		main_uart_tx_pending <= 1'd0;
		main_uart_tx_old_trigger <= 1'd0;
		main_uart_rx_pending <= 1'd0;
		main_uart_rx_old_trigger <= 1'd0;
		main_uart_storage <= 2'd0;
		main_uart_re <= 1'd0;
		builder_state <= 1'd0;
		builder_slave_sel_r <= 1'd0;
		builder_count <= 20'd1000000;
		builder_interface0_bank_bus_dat_r <= 8'd0;
		builder_interface1_bank_bus_dat_r <= 8'd0;
	end
	builder_regs0 <= serial_rx;
	builder_regs1 <= builder_regs0;
end

endmodule
