module test_switch_level_logic;

    reg a, b, c, d;        // Inputs
    wire y;                // Output

    // Instantiate the switch-level logic module
    switch_level_logic uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    initial begin
        // VCD (waveform) dump setup
        $dumpfile("waveform.vcd");               // Create VCD file
        $dumpvars(0, test_switch_level_logic);   // Dump all variables in this module

        // Apply test vectors
        $monitor("a=%b, b=%b, c=%b, d=%b, y=%b", a, b, c, d, y);
        
        // Test cases
        a = 0; b = 0; c = 0; d = 0; #10;
        a = 1; b = 0; c = 0; d = 0; #10;
        a = 0; b = 1; c = 0; d = 0; #10;
        a = 0; b = 0; c = 1; d = 0; #10;
        a = 0; b = 0; c = 0; d = 1; #10;
        a = 1; b = 1; c = 0; d = 0; #10;
        a = 0; b = 0; c = 1; d = 1; #10;
        a = 1; b = 1; c = 1; d = 1; #10;

        $finish;
    end
endmodule
