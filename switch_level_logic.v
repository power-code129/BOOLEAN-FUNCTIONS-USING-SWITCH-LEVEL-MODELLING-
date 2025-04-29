module switch_level_logic (
    input a, b, c, d,  // Inputs
    output y           // Output
);

    wire ab, cd;       // Intermediate wires for AND results

    // Transmission gate for AND operation ab
    nmos n1(ab, a, b);  // NMOS for AND (ab)
    pmos p1(ab, a, b);  // PMOS for AND (ab)

    // Transmission gate for AND operation cd
    nmos n2(cd, c, d);  // NMOS for AND (cd)
    pmos p2(cd, c, d);  // PMOS for AND (cd)

    // OR operation using transmission gates
    wire y1, y2;
    nmos n3(y1, ab, 1'b1);  // NMOS for OR (ab or cd)
    pmos p3(y1, ab, 1'b1);  // PMOS for OR (ab or cd)
    
    nmos n4(y2, cd, 1'b1);  // NMOS for OR (ab or cd)
    pmos p4(y2, cd, 1'b1);  // PMOS for OR (ab or cd)

    assign y = y1 | y2;     // Final output y

endmodule
