module tb_vending;

    logic clk, reset;
    logic coin_5, coin_10;
    logic dispense, change;

    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin_5(coin_5),
        .coin_10(coin_10),
        .dispense(dispense),
        .change(change)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;

        clk = 0;
        reset = 1;
        coin_5 = 0;
        coin_10 = 0;

        #10 reset = 0;

        // Test 1
        #10 coin_5 = 1; #10 coin_5 = 0;
        #10 coin_10 = 1; #10 coin_10 = 0;

        // Test 2
        #20 coin_10 = 1; #10 coin_10 = 0;
        #10 coin_10 = 1; #10 coin_10 = 0;

        #100 $finish;
    end

endmodule