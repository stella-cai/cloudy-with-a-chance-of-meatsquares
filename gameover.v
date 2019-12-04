module gameover(input clock, input reset, input draw, output reg [7:0] x, output reg [6:0] y, output [2:0] color,
                output finish_drawing);
    localparam x_start = 7'd130,
               y_start = 6'd100;
    
    localparam g = 35'b01111 10000 10000 10000 10011 10001 01111,
               a = 35'b01110 10001 10001 10001 11111 10001 10001,
               m = 35'b01010 10101 10101 10001 10001 10001 10001,
               e = 35'b11111 10000 10000 11111 10000 10000 11111,
               o = 35'b01110 10001 10001 10001 10001 10001 01110,
               v = 35'b10001 10001 10001 10001 10001 01010 00100,
               r = 35'b11110 10001 10010 11100 10100 10010 10001;
    reg row;
    reg [1:0] col;
    reg [34:0] letter;
    reg [5:0] index;

    initial begin
        row <= 0;
        col <= 0;
        index <= 1;
        finish_drawing <= 0;
    end

    always @(posedge clock) begin
        if (!reset) begin
            x <= 0;
            y <= 0;
            color <= 0;
            row <= 0;
            col <= 0;
            index <= 1;
        end
        else if (draw) begin
            if (row == 0) begin
                finish_drawing <= 0;

                if (col == 0) begin
                    color <= g[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1;
                    y <= y_start + index / 7 - 1;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 1;
                    end
                end
                
                if (col == 1) begin
                    color <= a[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1 + 8;
                    y <= y_start + index / 7 - 1;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 2;
                    end
                end
                
                else if (col == 2) begin
                    color <= m[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1 + 16;
                    y <= y_start + index / 7 - 1;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 3;
                    end
                end
                
                else if (col == 3) begin
                    color <= e[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1 + 24;
                    y <= y_start + index / 7 - 1;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 0;
                        row <= 1;
                    end
                end
            end

            else if (row == 1) begin
                if (col == 0) begin
                    color <= o[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1;
                    y <= y_start + index / 7 - 1 + 11;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 1;
                    end
                end
                
                if (col == 1) begin
                    color <= v[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1 + 8;
                    y <= y_start + index / 7 - 1 + 11;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 2;
                    end
                end
                
                else if (col == 2) begin
                    color <= e[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1 + 16;
                    y <= y_start + index / 7 - 1 + 11;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 3;
                    end
                end
                
                else if (col == 3) begin
                    color <= r[index] == 1'b1? 3'b111 : 3'b000;
                    x <= x_start + index % 7 - 1 + 24;
                    y <= y_start + index / 7 - 1 + 11;
                    if (index < 35) begin
                        index <= index + 1;
                    end
                    else (index == 35) begin
                        index <= 0;
                        col <= 0;
                        row <= 0;
                        finish_drawing <= 1;
                    end
                end
            end

        end
    end
endmodule
