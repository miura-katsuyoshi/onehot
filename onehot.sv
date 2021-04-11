module onehot #(
    parameter int WIDTH = 4
) (
    input [WIDTH-1:0] bin,
    output [2**WIDTH-1:0] onehot
);

    generate
        genvar i;
        for(i=0; i<2**WIDTH; i++) begin: gen_onehot
            assign onehot[i] = (bin == i);
        end
    endgenerate

endmodule
