## Week-by-Week Plan (FPGA Encoder Project)

## Week 1 — Environment + Simulation Basics

**Goal:** Get the team environment working and understand the toolchain.

* Set up repo structure
* Add `.devcontainer` (Dockerfile + devcontainer.json)
* Launch in Codespaces
* Verify tools: `yosys`, `nextpnr-ice40`, `iverilog`
* Run a simple simulation (`tb_top`)
* Learn basic flow: simulate → inspect waveform

**Output:**

* Working Codespaces environment
* `make sim` runs successfully

---

## Week 2 — Core Logic (Simulation Only)

**Goal:** Build and verify encoder logic in simulation.

* Implement `quadrature_decoder`
* Implement `position_counter`
* Expand `tb_mock_encoder` (forward + reverse pulses)
* Validate count behavior in simulation
* Document expected behavior in `docs/verification_plan.md`

**Output:**

* Correct counting in simulation
* Confidence in core logic

---

## Week 3 — Synthesis + Bitstream (Pre-Hardware)

**Goal:** Understand FPGA build flow without hardware.

* Run `make build`
* Inspect synthesis output (Yosys logs)
* Generate `.bin` bitstream
* Learn basic constraints (`.pcf`)
* Clean up `top_ice40up5k.v` wrapper

**Output:**

* Successful bitstream build
* Understanding of synthesis → place & route

---

## Week 4 — Hardware Bring-Up

**Goal:** First successful run on physical FPGA.

* Receive iCE40UP5K board
* Install `openFPGALoader` (host)
* Update `pins.pcf` for real board
* Flash simple design (LED blink or counter bit)
* Verify hardware behavior

**Output:**

* First working FPGA program
* End-to-end workflow complete

---

## Week 5 — Register Interface

**Goal:** Expose counter via register abstraction.

* Implement `register_file`
* Define minimal register map
* Connect counter → register interface
* Simulate register reads (mock access)

**Output:**

* Stable internal interface for data access
* Register map documented

---

## Week 6 — I2C Integration

**Goal:** Enable external communication.

* Integrate simple I2C slave (start minimal)
* Connect to register file
* Simulate I2C transactions (basic reads)
* Validate data path end-to-end

**Output:**

* Functional I2C read of counter value

---

## Week 7 — System Validation

**Goal:** Test under realistic conditions.

* Stress test with high-frequency pulses
* Validate edge cases (direction changes, overflow)
* Compare simulation vs hardware behavior
* Debug timing or signal issues

**Output:**

* Reliable encoder counting system

---

## Week 8 — Polish + Documentation

**Goal:** Make the project complete and reusable.

* Clean up RTL and testbenches
* Finalize documentation:

  * architecture
  * register map
  * usage instructions
* Add build + sim instructions to README
* Optional: demo with microcontroller over I2C

**Output:**

* Clean, shareable project
* Ready for team use or extension

---

## Summary Flow

1. Environment →
2. Simulation →
3. Build →
4. Hardware →
5. Interfaces →
6. Integration →
7. Validation →
8. Polish

---

## Key Principle

Do not move forward until the current stage is stable:

* Simulation must be correct before hardware
* Core logic must be correct before I2C
* Build flow must be stable before debugging hardware