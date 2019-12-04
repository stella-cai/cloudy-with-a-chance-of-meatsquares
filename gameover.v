module gameover(input clock, input reset, input draw, 
                output reg [7:0] x, output reg [6:0] y, output reg [2:0] color,
                output reg finish_drawing);
    localparam x_start = 8'd130,
               y_start = 7'd100;
    
    localparam g = 35'b11110100011100100001000010000111110,
               a = 35'b10001100011111110001100011000101110,
               m = 35'b10001100011000110001101011010101010,
               e = 35'b11111000010000111111000010000111111,
               o = 35'b01110100011000110001100011000101110,
               v = 35'b00100010101000110001100011000110001,
               r = 35'b10001010010010100111010011000101111;
    reg row;
    reg [1:0] col;
    reg [5:0] index;

    initial begin
        row = 0;
        col = 0;
        index = 0;
        finish_drawing = 0;
    end

    always @(posedge clock) begin
        if (!reset) begin
            x = 0;
            y = 0;
            color = 0;
            row = 0;
            col = 0;
            index = 0;
        end
        else if (draw) begin
            if (row == 0) begin
                finish_drawing = 0;

                if (col == 0) begin
                    color = (g[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5;
                    y = y_start + index / 5;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 1;
                    end
                end
                
                if (col == 1) begin
                    color = (a[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5 + 8;
                    y = y_start + index / 5;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 2;
                    end
                end
                
                else if (col == 2) begin
                    color = (m[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5 + 16;
                    y = y_start + index / 5;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 3;
                    end
                end
                
                else if (col == 3) begin
                    color = (e[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5 + 24;
                    y = y_start + index / 5;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 0;
                        row = 1;
                    end
                end
            end

            else if (row == 1) begin
                if (col == 0) begin
                    color = (o[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5;
                    y = y_start + index / 5 + 11;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 1;
                    end
                end
                
                if (col == 1) begin
                    color = (v[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5 + 8;
                    y = y_start + index / 5 + 11;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 2;
                    end
                end
                
                else if (col == 2) begin
                    color = (e[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5 + 16;
                    y = y_start + index / 5 + 11;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 3;
                    end
                end
                
                else if (col == 3) begin
                    color = (r[index] == 1'b1) ? 3'b111 : 3'b000;
                    x = x_start + index % 5 + 24;
                    y = y_start + index / 5 + 11;
                    if (index < 34) begin
                        index = index + 1;
                    end
                    else if (index == 34) begin
                        index = 0;
                        col = 0;
                        row = 0;
                        finish_drawing = 1;
                    end
                end
            end

        end
    end
endmodule
