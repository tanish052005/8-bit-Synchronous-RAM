module reg_file
#(
    parameter B = 8, // number of bits
    parameter W = 2 // number of address bits
)
(
    input wire clk, wr_en,
    input wire [W-1:0] w_addr, r_addr,
    input wire [B-1:0] w_data,
    output wire [B-1:0] r_data
);

    // signal declaration
    reg [B-1:0] array_reg [(2**W)-1:0];

    // write operation
    always @(posedge clk)
    begin
        if (wr_en)
            array_reg[w_addr] <= w_data;
    end

    // read operation
    assign r_data = array_reg[r_addr];

endmodule


module tb;
    reg clk, wr_en;
    reg [1:0] w_addr, r_addr;
    reg [7:0] w_data;
    wire [7:0] r_data;

    reg_file uut(clk, wr_en, w_addr, r_addr, w_data, r_data);

    always #5 clk = ~clk;

    initial
    begin
        // Initial setup and first write
        clk = 0;
        wr_en = 1;
        w_addr = 0;
        w_data = 100;

        // Second write (at time 20)
        #20;
        w_addr = 1;
        w_data = 101;

        // Third write (at time 40)
        #20;
        w_addr = 2;
        w_data = 110;
        
        // This is a repeated operation in the source images (at time 60)
        #20;
        w_addr = 3; 
        w_data = 120; // This overwrites the previous value at address 1
        wr_en=0;

        // First read (at time 80)
        #20;
        r_addr = 2;

        // Second read (at time 100)
        #20;
        r_addr = 0;
    end

endmodule
