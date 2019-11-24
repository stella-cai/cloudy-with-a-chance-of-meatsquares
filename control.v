module control(clock, reset, start, 
                delay_enable, 
                finish_game, 
                update, plot, 
                draw_squares, draw_catcher, 
                reset_count, 
                finish_drawing_squares, finish_drawing_catcher);

    input clock, reset, start, delay_enable, finish_game, finish_drawing_squares, finish_drawing_catcher;
    output reg update, plot, draw_squares, draw_catcher, reset_count;

    reg [2:0] current_state, next_state;

    localparam  s_start = 3'd0,
                s_start_wait = 3'd1,
                s_update = 3'd2,
                s_draw_squares = 3'd3,
                s_draw_catcher = 3'd7;
                s_reset_count = 3'd4,
                s_count = 3'd5,
                s_end = 3'd6;


    //state table
    always @(*)
    begin: state_table
        case (current_state)
            s_start: next_state = start ? s_start_wait : s_start;
            s_start_wait: next_state = start? s_start_wait : s_update;
            s_update : next_state = finish_game? s_end : s_draw_squares;
            s_draw_squares : next_state = finish_drawing_squares? s_draw_catcher : s_draw_squares;
            s_draw_catcher : next_state = finish_drawing_catcher? s_reset_count : s_draw_catcher;
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
        draw_squares = 0;
        draw_catcher = 0;
        reset_count = 0;

        case (current_state)
            s_start : begin
            end
            s_update : begin
                update = 1;
            end
            s_draw_squares : begin
                plot = 1;
                draw_squares = 1;
            end
            s_draw_catcher : begin
                plot = 1;
                draw_catcher = 1;
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

