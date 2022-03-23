`default_nettype none
module tb();


`ifdef RISING
//edge transition base, rising


`elsif FALLING
//edge transition base, falling

    logic rst, a, b, q;
    less_than DUT(.*);


`else
//pulse width base



`endif


endmodule