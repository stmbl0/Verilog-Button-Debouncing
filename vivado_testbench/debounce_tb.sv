`timescale 1ns / 1ps

module debounce_tb();
    logic clk;
    logic pb_1;
    
    logic pb_out;
    
    ButtonDebounce #(.STANDALONE(1), .CDIV_BITS(5)) debounce0(
        .i_btn(pb_1),
        .i_clk(clk),
        .o_signal(pb_out)
    );
    
    // Create the clock signal
    initial begin
        clk = 0;
        forever #10 clk = ~clk;     // Generate a 100MHz clock
    end
    
    // Simulate a bouncing button
    initial begin
        pb_1 = 0;
        #50;
        
        pb_1 = 1;
        #5;
        pb_1 = 0;
        #5;
        pb_1 = 1;
        #12;
        pb_1 = 0;
        #3;
        pb_1 = 1;
        #8;
        pb_1 = 0;
        #6;
        pb_1 = 1;
        #10;
        pb_1 = 0;
        #7;
        pb_1 = 1;
        #10;
        pb_1 = 0;
        #7;
        pb_1 = 1;
        #15;
        pb_1 = 0;
        #10;
        pb_1 = 1;
        #21;
        pb_1 = 0;
        #13;
        pb_1 = 1;
        #29;
        pb_1 = 0;
        #20;
        pb_1 = 1;
        #40;
        pb_1 = 0;
        #24;
        pb_1 = 1;
        #1000;
        
        $stop;
    end
    
endmodule