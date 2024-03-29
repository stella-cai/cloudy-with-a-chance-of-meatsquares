module catcher(input clock, input reset, input enable_tracking, input draw,
inout PS2_CLK, inout PS2_DAT, 
output [7:0] x, output [6:0] y, output [2:0] color, output finish_drawing,
output [8:0] position);

// we only care about the x-position (position) of the mouse. Ignore these outputs.
wire [8:0] y_position;
wire right_click, left_click;
wire [3:0] count;

		mouse_tracker mouse(.clock(clock), .reset(reset), .enable_tracking(enable_tracking), .PS2_CLK(PS2_CLK), .PS2_DAT(PS2_DAT),

		.x_pos(position), .y_pos(y_position), .left_click(left_click), .right_click(right_click), .count(count));

defparam    mouse.XMAX = 119,
            mouse.YMAX = 119,
            mouse.XMIN = 0,
            mouse.YMIN = 90,
				mouse.XSTART = 60,
				mouse.YSTART = 100; 

draw_catcher d(.clock(clock), .reset(reset), .draw(draw), .position(position[7:0]), 
.finish_drawing(finish_drawing), .x(x), .y(y), .color(color));


endmodule

module draw_catcher(input clock, input reset, input draw, input [7:0] position, output reg finish_drawing, 
    output reg [7:0] x,
    output reg [6:0] y,
    output reg [2:0] color);

    reg [7:0] i = 0;
    reg [1:0] j = 0;

    initial
        finish_drawing = 0;
		  
		  
    always @(posedge clock) begin
        if(!reset) begin
                x <= 0;
                y <= 0;
                color <= 0;
                finish_drawing = 0;
        end

        else begin
            // draw a 7 x 3 unit (centered around the mouse x position)
            if(draw == 1) begin
                if ( i < 119) begin
                    finish_drawing <= 0;
                    x <= i;
                    if (position - 3 < i && position + 3 > i) begin
                        // this pixel should be drawn
                        color <= 3'b001;
                        if(j == 2'b00) begin
                            y <= 7'd112;
                            j <= 2'b01;
                        end
                        else if (j == 2'b01) begin
                            y <= 7'd113;
                            j <= 2'b10;
                        end
                        else begin
                            y <= 7'd114;
                            j <= 0;
                            i <= i + 1;
                        end
                    end

                    else begin
                        // this pixel should be erased
                        color <= 3'b000;
                        if(j == 2'b00) begin
                            y <= 7'd112;
                            j <= 2'b01;
                        end
                        else if (j == 2'b01) begin
                            y <= 7'd113;
                            j <= 2'b10;
                        end
                        else begin
                            y <= 7'd114;
                            j <= 0;
                            i <= i + 1;
                        end
                    end
                end

                else begin
                // finished drawing catcher
                    finish_drawing = 1;
                    i = 0;
                end

            end
        end

    end
endmodule