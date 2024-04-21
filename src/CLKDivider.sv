// Divides a fast clock to a slower clock using a simple counter
// of size N_BITS. The most significant bit represents the output clock.
// Division factor is 2^N_BITS (e.g N_BITS=8 -> Divison factor=256)
module CLKDivider #(parameter N_BITS = 16) (
    input i_clk,
    output o_sclk
    );
    
    logic [N_BITS-1:0] counter = '0;
    
    always_ff @(posedge i_clk) begin
        counter <= counter + 1;
    end
    
    assign o_sclk = counter[N_BITS-1];
    
endmodule