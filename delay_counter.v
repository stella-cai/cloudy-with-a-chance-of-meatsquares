module delay_counter(clock, enable, reset);
    input clock, reset;
    output enable;

    localparam frames = 5'd15;
    localparam clock_cycles = 20'd833332;

    reg [19:0] count_cycles;
    reg [4:0] count_frames;
    wire count;

    always @(posedge clock)
    begin
        if(reset == 0 || count_cycles == 0)
            // count_cycles <= clock_cycles;
            count_cycles <= 32'b00000000000000000000000000000111;
        else
            count_cycles <= count_cycles - 1;

        if(reset == 0 || enable)
            // count_frames <= frames;
            count_frames <= 32'b00000000000000000000000000000011;
        else if(count)
            count_frames <= count_frames - 1;
    end
    assign count = (count_cycles == 0) ? 1 : 0;
    assign enable = (count_frames == 0) ? 1 : 0;

endmodule