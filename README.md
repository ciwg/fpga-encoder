# FPGA Encoder

## Goal

Explore an FPGA-based replacement for the `LS7866C` quadrature encoder counter IC using Verilog, with an I2C interface and enough performance for high-speed optical encoders.

## Success Criteria

- Define a realistic MVP that does not try to clone the full `LS7866C` feature set.
- Identify the main logic blocks: quadrature decoder, counter/registers, I2C interface, and testbench.
- Estimate whether a small FPGA such as an `iCE40UP5K` is likely sufficient.
- Produce a concrete build plan for implementation and verification.

## MVP Direction

The current MVP direction is:

- decode quadrature A/B inputs
- maintain a position counter
- I2C-accessible register interface
- implementation on a small, low-cost FPGA

## Technical Questions

- What subset of `LS7866C` behavior is actually required?
- Is an `iCE40UP5K` class FPGA enough for the logic and I2C integration?
- Should the I2C block come from OpenCores or be implemented more simply for this use case?
- How should the encoder counter logic connect to the I2C peripheral interface?
- What testbench is needed to validate pulse rates around `500 kHz` to `1.56 MHz`?

## Files

- `notes/brief.md`
- `notes/retrospective.md`
- `src/`
