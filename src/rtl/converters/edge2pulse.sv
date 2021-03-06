module edge2pulse
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH = 8)
  (input logic grst, //1 cycle wide pulse generated by gclkc
   input logic gclk, //not used
   input logic aclk, //unit clock
   input logic edge_input,
   output logic pulse_output);

    `ifdef RISING
        logic [$clog2(PULSE_WIDTH):0] counter, counter_next;
    
        always_comb begin
        if(counter == (PULSE_WIDTH)) begin
            counter_next = counter;
        end else begin
            counter_next = counter + 1'b1;
        end
        end
        
        assign pulse_output = (edge_input && (counter != (PULSE_WIDTH))) | ((counter > 0) && (counter < (PULSE_WIDTH)));

        always_ff @( posedge aclk, posedge grst) begin
            if(grst) begin
                counter <= '0;
            end else if(pulse_output) begin
                counter <= counter_next;
            end
        end
    `elsif FALLING
        logic [$clog2(PULSE_WIDTH):0] counter, counter_next;
    
        always_comb begin
        if(counter == (PULSE_WIDTH)) begin
            counter_next = counter;
        end else begin
            counter_next = counter + 1'b1;
        end
        end
        
        assign pulse_output = ~(((~edge_input) && (counter != (PULSE_WIDTH))) | ((counter > 0) && (counter < (PULSE_WIDTH))));

        always_ff @( posedge aclk, posedge grst) begin
            if(grst) begin
                counter <= '0;
            end else if(~pulse_output) begin
                counter <= counter_next;
            end
        end
    `else

    `endif

endmodule: edge2pulse