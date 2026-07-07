<img width="335" height="591" alt="image" src="https://github.com/user-attachments/assets/5a5ac235-e09e-484a-8681-f090834318de" /># RISC-V Single Cycle Processor (Verilog)

A **32-bit Single Cycle RISC-V (RV32I)** processor implemented in **Verilog HDL** by following the architecture described in **Digital Design and Computer Architecture (RISC-V Edition)**.

This project is being developed from scratch to gain a strong understanding of **Computer Architecture**, **Digital Logic Design**, **RTL Design**, and **Processor Implementation**.

---

## Features

- 32-bit RV32I Single Cycle Processor
- Modular Verilog HDL Design
- Word-addressable Instruction Memory
- Data Memory with synchronous write and combinational read
- 32 × 32-bit Register File
- Program Counter (PC)
- Sign Extension Unit
- Main Decoder
- ALU Decoder
- Arithmetic Logic Unit (ALU)
- PC + 4 Adder
- Control Unit
- Top-Level Processor Integration
- GTKWave Simulation Support

---

## Supported Instructions

### Load Instructions

| Instruction | Status |
|------------|--------|
| LW | ✅ |

### Store Instructions

| Instruction | Status |
|------------|--------|
| SW | ✅ |

### R-Type Instructions

| Instruction | Status |
|------------|--------|
| ADD | ✅ |
| SUB | ✅ |
| AND | ✅ |
| OR | ✅ |
| SLT | ✅ |

### Branch Instructions

| Instruction | Status |
|------------|--------|
| BEQ | 🚧 In Progress |

---

## Datapath Overview

```
                +---------------------+
                |     Program Counter |
                +----------+----------+
                           |
                           v
                  +------------------+
                  | Instruction Mem  |
                  +------------------+
                           |
                           v
                  +------------------+
                  |  Control Unit    |
                  +------------------+
                           |
         +-----------------+----------------+
         |                                  |
         v                                  v
  Register File                     Sign Extension
         |                                  |
         +---------------+------------------+
                         |
                         v
                      ALU
                         |
         +---------------+----------------+
         |                                |
         v                                v
    Data Memory                     PC Selection
```

---

## Project Structure

```
RISC_V_SINGLE_CYCLE_CORE
│
├── ALU.v
├── alu_decoder.v
├── main_decoder.v
├── Control_unit.v
├── P_c.v
├── PC_Adder.v
├── inst_mem.v
├── data_mem.v
├── Register_files.v
├── sign_extend.v
├── Single_cycle_top.v
├── Single_cycle_top_tb.v
├── README.md
└── LICENSE
```

---

## Modules

### Program Counter (PC)

- Synchronous Program Counter
- Active-low Reset
- Updates on every positive clock edge

---

### Instruction Memory

- 1024 × 32-bit Memory
- Combinational Read
- Word Addressable (`A[31:2]`)

---

### Register File

- 32 General Purpose Registers
- Two Read Ports
- One Write Port
- Combinational Read
- Synchronous Write

---

### Data Memory

- 1024 × 32-bit Memory
- Combinational Read
- Synchronous Write

---

### Sign Extension Unit

Supports immediate generation for:

- I-Type
- S-Type
- B-Type

---

### Arithmetic Logic Unit (ALU)

Supported Operations:

- ADD
- SUB
- AND
- OR
- SLT

---

### Main Decoder

Generates:

- RegWrite
- MemWrite
- ResultSrc
- ALUSrc
- ImmSrc
- Branch
- ALUOp

---

### ALU Decoder

Generates ALU Control signals using:

- ALUOp
- funct3
- funct7
- opcode[5]

---

### Control Unit

The Control Unit consists of:

- Main Decoder
- ALU Decoder

It generates all datapath control signals required for instruction execution.

---

## Simulation

Simulation Tools

- Icarus Verilog
- GTKWave

### Compile

```bash
iverilog -o out.vvp Single_cycle_top_tb.v
```

### Run

```bash
vvp out.vvp
```

### View Waveforms

```bash
gtkwave "Single Cycle.vcd"
```

---

## Current Progress

- ✅ Program Counter
- ✅ PC + 4 Adder
- ✅ Instruction Memory (Word Addressable)
- ✅ Data Memory
- ✅ Register File
- ✅ Sign Extension Unit
- ✅ Arithmetic Logic Unit
- ✅ Main Decoder
- ✅ ALU Decoder
- ✅ Control Unit
- ✅ Top-Level Processor Integration
- ✅ Load Instruction (LW)
- ✅ Store Instruction (SW)
- ✅ R-Type Instruction Support
- 🚧 Branch Instructions (BEQ)
- 🚧 Complete Processor Verification

---

## Future Improvements

- Implement Remaining RV32I Instructions
- Add Jump Instructions (JAL, JALR)
- Add Immediate ALU Instructions (ADDI, ORI, ANDI, XORI)
- Add AUIPC and LUI
- Load Programs using `$readmemh`
- Comprehensive Testbench
- Automated Verification
- Pipeline the Processor (5-Stage RISC-V Pipeline)
- FPGA Implementation

---

## Learning Outcomes

This project helped in understanding:

- Computer Architecture
- RISC-V Instruction Set Architecture
- RTL Design
- Verilog HDL
- Datapath Design
- Control Unit Design
- Processor Design
- Memory Organization
- Hardware Simulation and Debugging
- Digital System Verification

---

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code

---

## References

- *Digital Design and Computer Architecture – RISC-V Edition* by Sarah Harris & David Harris
- RISC-V Unprivileged ISA Specification

---

## Author

**Harshith Manupati**
