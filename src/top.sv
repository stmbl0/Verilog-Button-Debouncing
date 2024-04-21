module top(
    input clk,
    input inc_button,
    input res_button,
    output logic [3:0] leds
    );
    
    //// Clock Divider for the debouncing modules ////
    
    logic slow_clk;
    
    // Divide the fast clock to get a slower clock for the debouncing modules
    // N_BITS=21 -> Divison factor=1/2097152
    // Input freq: 100MHz -> Output freq: ~47.7Hz
    CLKDivider #(.N_BITS(21)) clock_div(
        .i_clk(clk),
        .o_sclk(slow_clk)
    );
    
    //// Actual Button Debouncing ////
    
    logic inc_signal;
    logic res_signal;
    
    ButtonDebounce debounce_inc(
        .i_btn(inc_button),
        .i_clk(slow_clk),
        .o_signal(inc_signal)
    );
    ButtonDebounce debounce_res(
        .i_btn(res_button),
        .i_clk(slow_clk),
        .o_signal(res_signal)
    );
    
    
    // Counter //
    Counter #(.SIZE(4)) counter(
        .i_clk(inc_signal||res_signal),
        .i_increment(inc_signal),
        .i_reset(res_signal),
        .o_count(leds)
    );
    
endmodule