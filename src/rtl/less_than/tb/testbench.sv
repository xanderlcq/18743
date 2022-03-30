`default_nettype none
module tb();


`ifdef RISING
// rising edge transition base
    logic a, b, q, set;
    less_than DUT(.set(set), .a(a), .b(b), .q(q));
    task reset();
       a = 0; b = 0; set = 1;
       #1 set = 0;
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
// falling edge transition base
    logic a, b, q, set;
    less_than DUT(.set(set), .a(a), .b(b), .q(q));
    task reset();
       a = 1; b = 1; set = 1;
       #1 set = 0;
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
// pulse width base
    logic rst, grst, aclk, a, b, q;
    less_than DUT(.*);

`endif

endmodule
