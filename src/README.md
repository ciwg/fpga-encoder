# Source Layout

- `rtl/`: synthesizable Verilog modules for the hardware design
- `tb/`: simulation-only testbench modules

## Current RTL Status

- `quadrature_decoder.v`: step and direction detection from encoder A/B transitions
- `position_counter.v`: wrapping counter with clear support
- `register_file.v`: byte-wise reads of the counter plus a clear control register
- `i2c_slave_if.v`: current integration point for the required I2C host interface
- `top.v`: top-level wiring of the current design baseline

## Current Testbench Status

- `tb_mock_encoder.v`: simple forward quadrature source
- `tb_top.v`: integration harness for the current top-level design

The source tree is intended to grow into a physically implemented design. The main missing functional block today is the I2C interface logic required to expose the counter on hardware.
