`default_nettype none
module tb();


`ifdef RISING
//edge transition base, rising
    logic rst, a, b, q;
    exclusive_max DUT(.rst(rst), .a(a), .b(b), .q(q));
    
    task reset();
       a = 0; b = 0; rst = 1;
       #1; rst = 0;
    endtask

    initial begin
        $display("Rising Edge Signal");
        reset();
        
        // Case 1: No signal
        #10;
        #30; reset();

        // Case 2: a first, b second
        #10; a = ~a;
        #10; b = ~b;
        #20;  reset();
        
        // Case 3: b first, a second
        #10; b = ~b;
        #10; a = ~a;
        #20; reset();
        
        // Case 4: a and b at same time
        #10; a = ~a; b = ~b;
        #20; reset();

        #40; $finish;
    end

`elsif FALLING
//edge transition base, falling
    logic rst, a, b, q;
    exclusive_max DUT(.rst(rst), .a(a), .b(b), .q(q));
    
    task reset();
       a = 1; b = 1; rst = 1;
       #1; rst = 0;
    endtask

    initial begin
        $display("Falling Edge Signal");
        reset();
        
        // Case 1: No signal
        #10;
        #30; reset();

        // Case 2: a first, b second
        #10; a = ~a;
        #10; b = ~b;
        #20;  reset();
        
        // Case 3: b first, a second
        #10; b = ~b;
        #10; a = ~a;
        #20; reset();
        
        // Case 4: a and b at same time
        #10; a = ~a; b = ~b;
        #20; reset();

        #40; $finish;
    end

`else
//pulse width base
    parameter GAMMA_CYCLE_WIDTH = 16;
    parameter PULSE_WIDTH = 8;

    logic aclk, grst, rst, a, b, q;
    exclusive_max DUT(.*);
    
    task reset(int elapsed_cycles);
        a = 0; b = 0;
        grst = 1; rst = 1;
        @(posedge aclk);
        grst = 0; rst = 0;
        repeat (GAMMA_CYCLE_WIDTH - elapsed_cycles - 1) @(posedge aclk);
    endtask

    initial begin
        $display("Pulse Width Signal");
        reset(1);

        // Case 1: No signal
        reset(0);
        repeat (PULSE_WIDTH) @(posedge aclk);
        reset(PULSE_WIDTH);

        // Case 2: a first, b second
        repeat (2) @(posedge aclk); // Toggle On
        a = ~a;
        repeat (2) @(posedge aclk);
        b = ~b;
        repeat (PULSE_WIDTH - 2) @(posedge aclk); // Toggle Off
        a = ~a;
        repeat (2) @(posedge aclk);
        b = ~b;
        reset(PULSE_WIDTH);

        // Case 3: b first, a second
        repeat (2) @(posedge aclk); // Toggle On
        b = ~b;
        repeat (2) @(posedge aclk);
        a = ~a;        
        repeat (PULSE_WIDTH - 2) @(posedge aclk); // Toggle Off
        b = ~b;
        repeat (2) @(posedge aclk);
        a = ~a;
        reset(PULSE_WIDTH);
        
        // Case 4: a and b at same time
        repeat (2) @(posedge aclk); // Toggle On
        a = ~a; b = ~b;        
        repeat (PULSE_WIDTH - 2) @(posedge aclk); // Toggle Off
        a = ~a; b = ~b;
        reset(PULSE_WIDTH);

        $finish;
    end

    initial begin
        aclk = 0;
    end

    always begin
        #5 aclk = ~aclk;
    end

`endif

endmodule