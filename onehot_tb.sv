`include "vunit_defines.svh"

`define CUT CUT

module onehot%WIDTH%_tb;
    timeunit 1ns;
    timeprecision 1ps;

    parameter WIDTH = %WIDTH%;

    logic [WIDTH-1:0] bin;
    logic [2**WIDTH-1:0] onehot;

    `TEST_SUITE begin

        `TEST_SUITE_SETUP begin
        end

        `TEST_CASE_SETUP begin
            bin = 0;
        end

        `TEST_CASE("normal_operation_test") begin
            int i;

            for(i=0; i<(2**WIDTH); i++) begin
                bin = i;
                #10;
                `CHECK_EQUAL(onehot, 1<<i);
            end
        end

        `TEST_CASE_CLEANUP begin
        end

        `TEST_SUITE_CLEANUP begin
        end
    end;

    `WATCHDOG(1ms);

    onehot #(
        .WIDTH(WIDTH)
    )
    `CUT (
        .bin(bin),
        .onehot(onehot)
    );

endmodule
