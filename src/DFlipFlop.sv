module DFlipFlop(
    input i_s,
    input i_clk,
    output o_q,
    output o_qbar
    );
    
    logic state = 1'b0;
    
    always @(posedge i_clk) begin
        state <= i_s;
    end
    
    assign o_q = state;
    assign o_qbar = ~state;
endmodule