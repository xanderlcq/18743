`default_nettype none

module tb();

`ifdef RISING
// rising edge transition base
    parameter NUM_INPUTS=4;

    logic grst;
    logic [NUM_INPUTS-1:0] inputs;
    logic [NUM_INPUTS-1:0] y;
    logic select_line;

    mux_t_t_t_N DUT(.grst(grst), .inputs(inputs), .select_line(select_line), .y(y));
    
    task reset();
       select_line = 0; grst = 1;
       inputs[0] = 0; inputs[1] = 0; inputs[2] = 0; inputs[3] = 0;
       #1; grst = 0;
    endtask

    initial begin
        $display("Rising Edge Signal");
        reset();
        
        // Scenario 1
        #10; inputs[0] = ~inputs[0]; 
        #10; inputs[1] = ~inputs[1]; 
        select_line = ~select_line;
        #10; inputs[2] = ~inputs[2];
        #10;  reset();
        
        // Scenario 2
        #10; inputs[0] = ~inputs[0]; 
        #10; inputs[3] = ~inputs[3]; 
        select_line = ~select_line;
        #10; inputs[2] = ~inputs[2];
        #10;  reset();
        
        // Scenario 3
        #10; inputs[0] = ~inputs[0]; 
        #10; select_line = ~select_line;
        #10; inputs[2] = ~inputs[2];
        #10;  reset();

        #40; $finish;
    end

`elsif FALLING
// falling edge transition base

`else
// pulse width base
    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;

    logic aclk;

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end

`endif

endmodule