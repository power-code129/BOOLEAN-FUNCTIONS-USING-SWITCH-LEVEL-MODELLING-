`timescale 1ns/1ps
module boolean_switch_tb;

    reg A, B, C, D;
    wire Y;

    // Instantiate the module under test
    boolean_switch uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y)
    );

    initial begin
        $dumpfile("boolean_switch.vcd");
        $dumpvars(0, boolean_switch_tb);

        // Apply all 16 combinations of A, B, C, D
        A = 0; B = 0; C = 0; D = 0;
        repeat (16) begin
            #10 {A, B, C, D} = {A, B, C, D} + 1;
        end

        #10 $finish;
    end

endmodule
