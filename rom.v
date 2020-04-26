//////////////////////////////////////////////////////////////////////////////////
// Design: ROM file to store 7 segment display values
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module rom(addr, en, data);
    input  wire [3:0] addr;
    input  wire en;
    output wire [6:0] data;

    reg [6:0] mem [9:0];

    initial
        begin
            $display ("loading ROM");
            $readmemb("memory.mem",mem);  //holds the value for seven segment display
        end

    assign data = (en && (addr <= 4'h9)) ? mem[addr] : 8'b0;

endmodule
