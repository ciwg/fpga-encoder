# Brief

## Objective

A practical project definition for an FPGA-based quadrature encoder counter board, then use that definition to guide implementation experiments.

## Constraints

- Do not attempt a full drop-in reimplementation of the `LS7866C` feature set.
- Focus on the core value: high-speed quadrature decode, counting, and I2C access.
- Assume target pulse rates in the `500 kHz` range, with a stretch goal near `1.56 MHz`.
- Keep the first hardware target small enough to plausibly fit in roughly `1000` logic elements or an `iCE40UP5K` class device.
- Prioritize simple, understandable architecture over feature richness.

## Success Criteria

- Define the MVP feature set.
- Break the design into Verilog modules with clear responsibilities.
- Identify the verification plan, including a mock encoder pulse generator.
- Capture open technical questions that require research or discussion with Steve and Rebecca.

## Prompt Notes

- Steve and Rebecca want a board that replaces a hard-to-source `LS7866C-TS` / `LS7866C-S` encoder counter chip.
- The distinctive requirement is encoder counting with an `I2C` interface rather than `SPI`.
- A plausible architecture is Verilog quadrature decode plus an I2C-visible register block in an FPGA.
- OpenCores may provide an `I2C` core, but integration complexity needs evaluation.
- `Qwiic`, `STEMMA QT`, and `QWIIC` are all relevant I2C ecosystem targets for modular interconnect.
- Verification should include an I2C core, encoder counter, and a mock encoder generator capable of high-rate pulses.
- Longer term, this could become a building block for a closed-loop machine controller with CPU cores, display, USB, and FPGA soft logic.

## Proposed Module Breakdown

- `quadrature_decoder`
  Converts A/B encoder inputs into count direction events.
- `position_counter`
  Maintains count value and exposes status/control signals.
- `register_file`
  Maps count, status, and configuration into addressable registers.
- `i2c_slave_if`
  Accepts host reads and writes over I2C.
- `top`
  Wires decoder, counter, register block, and I2C interface together.
- `tb_mock_encoder`
  Generates quadrature sequences at controllable rates for simulation.
- `tb_top`
  Exercises reads, writes, and pulse streams in simulation.

## First Execution Plan

1. Define the minimum register map the host actually needs.
2. Confirm whether the system expects pure counter reads or additional control/config behavior.
3. Implement and simulate the quadrature decoder and counter first.
4. Add a simple register file around the counter state.
5. Integrate or prototype an I2C slave block.
6. Verify operation under representative pulse rates and edge cases.

## Open Questions

- Which exact `LS7866C` features are required in the existing system?
- What host will talk to this board over I2C?
- How many encoder channels are needed in the first revision?
- What counter width is required?
- What electrical and connector constraints matter for the board design?
- Does the team want an FPGA-only prototype first, or board design and HDL development in parallel?
