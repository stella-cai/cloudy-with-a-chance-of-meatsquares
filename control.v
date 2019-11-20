module control(clock, reset, start, delay_enable, finish_game, 
                update, plot, draw, reset_count, finish_drawing);

    input clock, reset, start, delay_enable, finish_game, finish_drawing;
    output reg update, plot, draw, reset_count;

    reg [2:0] current_state, next_state;

    localparam  s_start = 3'd0,
                s_start_wait = 3'd1,
                s_update = 3'd2,
                s_draw = 3'd3,
                s_reset_count = 3'd4,
                s_count = 3'd5,
                s_end = 3'd6;


    //state table
    always @(*)
    begin: state_table
        case (current_state)
            s_start: next_state = start ? s_start_wait : s_start;
            s_start_wait: next_state = start? s_start_wait : s_update;
            s_update : next_state = finish_game? s_end : s_draw;
            // s_draw : next_state = finish_drawing? s_reset_count : s_draw;
            s_draw : next_state = s_reset_count;
            s_reset_count : next_state = s_count;
            s_count : next_state = delay_enable ? s_update : s_count;
            s_end : next_state = s_end;
            default: next_state = s_start;
        endcase
    end 

    always @(*)
    begin: enable_signals
        // by default, set all signals to 0
        update = 0;
        plot = 0;
        draw = 0;
        reset_count = 0;

        case (current_state)
            s_start : begin
            end
            s_update : begin
                update = 1;
            end
            s_draw : begin
                plot = 1;
                draw = 1;
            end
            s_reset_count : begin
                reset_count = 1;
            end
            s_count : begin          
            end
            s_end : begin
            end
        endcase
    end

    always @(posedge clock)
        begin: state_FFs
            if(!reset)
                current_state <= s_start;
            else
                current_state <= next_state;
        end

endmodule

