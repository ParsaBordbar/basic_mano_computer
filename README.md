![common-bus32](https://github.com/ParsaBordbar/basic_computer/assets/124056966/13ca3844-a5ad-4675-a136-cb0506528f80)

# Mano Computer in VHDL

This repository contains the VHDL implementation of the Mano Computer, a basic computer architecture designed by M. Morris Mano. The Mano Computer is a simple digital system that includes a CPU, memory, and I/O devices.

## Components

The Mano Computer consists of several components, each implemented in VHDL:

1. **Control Unit**: The Control Unit is responsible for controlling the operation of the CPU and hence the computer. It takes instruction from the Instruction Register, interprets it, and sends signals to the CPU components.

2. **Arithmetic Logic Unit (ALU)**: The ALU performs arithmetic and logical operations.

3. **Registers**: The Mano Machine uses several registers, including:
    - **Accumulator (AC)**: Used to hold intermediate data during computations.
    - **Data Register (DR)**: Used to hold memory data, either for reading from or writing to memory.
    - **Temporary Register (TR)**: Used to hold intermediate data during computations.
    - **Output Register (OUTR)**: Used to hold the data that is to be outputted.
    - **Program Counter (PC)**: Holds the address of the next instruction to be executed.
    - **Instruction Register (IR)**: Holds the current instruction that is being executed.
    - **Address Register (AR)**: Holds the address of the memory location to be accessed.

4. **Memory**: The memory of the Mano Machine can be implemented as an array in VHDL. It manages read and write operations to the memory.

5. **Instruction Set**: The instruction set of the Mano Machine includes operations like ADD, SUB, AND, OR, NOT, etc.

## Shared Bus

The shared bus in the Mano Computer is used to transfer data between the CPU, memory, and I/O devices. It's a common pathway for all data and control signals.

## Usage

Each component is implemented as a separate VHDL entity. To use these components, instantiate them in your top-level VHDL design file and connect them using signals.

Please note that this is a complex task and requires a good understanding of VHDL and computer architecture. It's recommended to refer to a textbook like "Digital Design and Computer Architecture" by M. Mano for a comprehensive understanding.
