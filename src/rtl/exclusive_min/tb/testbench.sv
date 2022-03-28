`default_nettype none
module tb();


`ifdef RISING
//edge transition base, rising
    logic set, a, b, q;
    exclusive_min DUT(.set(set), .a(a), .b(b), .q(q));

`elsif FALLING
//edge transition base, falling
    logic set, a, b, q;
    exclusive_min DUT(.set(set), .a(a), .b(b), .q(q));

`else
//pulse width base
    logic aclk, grst, set, a, b, q;
    exclusive_min DUT(.*);

`endif


endmodule