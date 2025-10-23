# 8-bit-Synchronous-RAM
Designed and simulated an 8-bit synchronous RAM using Verilog HDL with parameterized data and address widths. Verified read/write operations through a structured testbench to ensure accurate memory functionality.


Working of the 8-bit Synchronous RAM :

1.Initialization:
The RAM is defined as an array of registers, where each location stores 8-bit data, and addresses are defined by the address width parameter.

2.Clock Synchronization:
All write operations occur on the positive edge of the clock, ensuring synchronous and stable data storage.

3.Write Operation:
When the write enable (wr_en) signal is high, the input data (w_data) is stored at the memory location specified by the write address (w_addr).

4.Read Operation:
The read address (r_addr) continuously selects a memory location, and its stored data is output through r_data (asynchronous read).

5.Verification:
A testbench applies various write and read cycles to confirm correct data transfer, memory storage, and retrieval during simulation.
