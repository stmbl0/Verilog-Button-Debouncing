// Module to debounce a single physical push button.
// If STANDALONE is enabled, this module will create the slow clock
// from the fast input clock on its own.
// If STANDALONE is disabled, the input clock has to be a slow clock.
module ButtonDebounce #(STANDALONE=0, CDIV_BITS=18) (
    input i_btn,
    input i_clk,
    output o_signal
    );
    
    logic slow_clk;
    
    generate
        if(STANDALONE) begin
            // STANDALONE enabled -> External fast clock has to be divided
            CLKDivider #(.N_BITS(CDIV_BITS)) clock_div(
                .i_clk,
                .o_sclk(slow_clk)
            );
        end
        else begin
            // STANDALONE disabled -> External slow clock
            assign slow_clk = i_clk;
        end
    endgenerate
    
    DFlipFlop dff0(
        .i_s(i_btn),
        .i_clk(slow_clk),
        .o_q(o_signal)
    );
endmodule