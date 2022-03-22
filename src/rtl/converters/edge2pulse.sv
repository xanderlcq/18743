module edge2pulse
#(parameter GAMMA_CYCLE_WIDTH=16,
  parameter PULSE_WIDTH = 8)
  (input logic rst,
   input logic gclk,
   input logic aclk,
   input logic edge_input,
   output logic pulse_output);

   logic [$clog2(PULSE_WIDTH):0] counter, counter_next;
   
   always_comb begin
       if(counter == (PULSE_WIDTH)) begin
           counter_next = counter;
       end else begin
           counter_next = counter + 1'b1;
       end
    end
    
    assign pulse_output = (edge_input && (counter != (PULSE_WIDTH))) | ((counter > 0) && (counter < (PULSE_WIDTH)));

    always_ff @( posedge aclk ) begin
        if(rst) begin
            counter <= '0;
        end else if(pulse_output) begin
            counter <= counter_next;
        end
    end

endmodule: edge2pulse