// Fixed-size counter that can be incremented by 1 and reset to 0
module Counter #(SIZE=4) (
    input i_clk,
    input i_increment,
    input i_reset,
    output logic [SIZE-1:0] o_count
    );
    
    logic [SIZE-1:0] counter;
    
    always @(posedge i_clk) begin
        begin
            if(i_reset)
                counter <= '0;
            else if(i_increment)
                counter <= counter + 1;
        end
    end
    
    // Write current count to output port o_bits
    assign o_count = counter;
    
endmodule