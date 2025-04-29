module boolean_switch(
    input A, B, C, D,
    output Y
);

    wire n1, n2, n3, n4, Vdd, Gnd;
    assign Vdd = 1'b1;
    assign Gnd = 1'b0;

    // n1 = B + C (OR gate using transmission gate logic)
    wire notB, notC, nor_out;
    not (notB, B);
    not (notC, C);
    and (nor_out, notB, notC);
    not (n1, nor_out); // n1 = B + C

    // n2 = A & (B + C)
    and (n2, A, n1);

    // n3 = A & C
    and (n3, A, C);

    // n4 = A·C·D
    and (n4, n3, D);

    // Y = n2 + n4
    or (Y, n2, n4);

endmodule
