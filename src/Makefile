.PHONY: help lint

RTL := rtl/quadrature_decoder.v rtl/position_counter.v rtl/register_file.v rtl/i2c_slave_if.v rtl/top.v
TB := tb/tb_mock_encoder.v tb/tb_top.v

help:
	@printf "Targets:\n"
	@printf "  make lint   Run iverilog syntax check if installed\n"

lint:
	@command -v iverilog >/dev/null 2>&1 || { \
		echo "iverilog not installed"; \
		exit 1; \
	}
	@iverilog -g2012 -o /tmp/fpga-workshop-sim $(RTL) $(TB)
