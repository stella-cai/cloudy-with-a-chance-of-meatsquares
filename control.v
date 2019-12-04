module control(clock, reset, start, 
                delay_enable, 
                finish_game, 
                update, plot, 
                draw_squares, draw_catcher, draw_score, draw_end,
                reset_count, 
                finish_drawing_squares, finish_drawing_catcher, finish_drawing_score, finish_drawing_end);

    input clock, reset, start, delay_enable, finish_game, 
    finish_drawing_squares, finish_drawing_catcher, finish_drawing_score;
    output reg update, plot, draw_squares, draw_catcher, draw_score, reset_count;

    reg [3:0] current_state, next_state;

    localparam  s_start = 4'd0,
                s_start_wait = 4'd1,
                s_update = 4'd2,
                s_draw_squares = 4'd3,
                s_draw_catcher = 4'd4,
                s_draw_score = 4'd5;
                s_reset_count = 4'd6,
                s_count = 4'd7,
                s_draw_end = 4'd8,
                s_end = 4'd9;


    //state table
    always @(*)
    begin: state_table
        case (current_state)
            s_start: next_state = start ? s_start_wait : s_start;
            s_start_wait: next_state = start? s_start_wait : s_update;
            s_update : next_state = finish_game? s_draw_end : s_draw_squares;
            s_draw_squares : next_state = finish_drawing_squares? s_draw_catcher : s_draw_squares;
            s_draw_catcher : next_state = finish_drawing_catcher? s_draw_score : s_draw_catcher;
            s_draw_score : next_state = finish_drawing_score ? s_reset_count : s_draw_score;
            s_reset_count : next_state = s_count;
            s_count : next_state = delay_enable ? s_update : s_count;
            s_draw_end : next_state = finish_drawing_end ? s_end : s_draw_end;
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
        draw_score = 0;
        draw_end = 0;
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
            s_draw_score : begin
                plot = 1;
                draw_score = 1;
            end
            s_reset_count : begin
                reset_count = 1;
            end
            s_count : begin          
            end
            s_draw_end : begin
                plot = 1;
                draw_end = 1;
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

