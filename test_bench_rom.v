//////////////////////////////////////////////////////////////////////////////////
// Design: Test bench for ROM
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench_rom();
//inputs for DUT
    reg  [3:0] addr = 4'h0;
    reg  en;
//output from DUT
    wire [6:0] data;

    rom DUT (.addr(addr), .en(en), .data(data));

    initial
        begin
            $display($time, " << Simulation Results >>");
            $monitor($time, "addr=%b, , en=%b, data=%b", addr, en, data);
    end

    initial
        begin
            en = 1'b0;
            #2
            en = 1'b1;
            for(integer i=0; i<16; i=i+1) begin
                #2;
                addr = addr + 4'h1;
            end
         $finish;
        end

endmodule
