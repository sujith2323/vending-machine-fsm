module vending_machine (
    input logic clk,
    input logic reset,
    input logic coin_5,
    input logic coin_10,
    output logic dispense,
    output logic change
);

    typedef enum logic [2:0] {
        S0, S5, S10, S15, S20
    } state_t;

    state_t current_state, next_state;

    // State Register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;
            $display("[%0t] RESET -> State = S0", $time);
        end else begin
            current_state <= next_state;
            $display("[%0t] STATE CHANGE -> %s", $time, current_state.name());
        end
    end

    // Next State Logic
    always_comb begin
        next_state = current_state;

        case (current_state)

            S0: begin
                if (coin_5) begin
                    next_state = S5;
                    $display("[%0t] Coin Inserted: 5", $time);
                end
                else if (coin_10) begin
                    next_state = S10;
                    $display("[%0t] Coin Inserted: 10", $time);
                end
            end

            S5: begin
                if (coin_5) begin
                    next_state = S10;
                    $display("[%0t] Coin Inserted: 5", $time);
                end
                else if (coin_10) begin
                    next_state = S15;
                    $display("[%0t] Coin Inserted: 10", $time);
                end
            end

            S10: begin
                if (coin_5) begin
                    next_state = S15;
                    $display("[%0t] Coin Inserted: 5", $time);
                end
                else if (coin_10) begin
                    next_state = S20;
                    $display("[%0t] Coin Inserted: 10", $time);
                end
            end

            S15: begin
                next_state = S0;
            end

            S20: begin
                next_state = S0;
            end

        endcase
    end

    // Output Logic
    always_comb begin
        dispense = 0;
        change = 0;

        case (current_state)
            S15: begin
                dispense = 1;
                $display("[%0t] DISPENSE ITEM", $time);
            end

            S20: begin
                dispense = 1;
                change = 1;
                $display("[%0t] DISPENSE ITEM + RETURN CHANGE", $time);
            end
        endcase
    end

endmodule