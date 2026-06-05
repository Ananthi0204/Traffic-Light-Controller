module traffic_light(
    input clk,
    input rst,
    output reg [1:0] light
);

parameter RED = 2'b00,
          YELLOW = 2'b01,
          GREEN = 2'b10;

reg [1:0] state;
reg [3:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= RED;
        count <= 0;
    end
    else
    begin
        count <= count + 1;

        case(state)
            RED:
                if(count == 4)
                begin
                    state <= GREEN;
                    count <= 0;
                end

            GREEN:
                if(count == 4)
                begin
                    state <= YELLOW;
                    count <= 0;
                end

            YELLOW:
                if(count == 2)
                begin
                    state <= RED;
                    count <= 0;
                end
        endcase
    end
end

always @(*)
begin
    case(state)
        RED:    light = 2'b00;
        YELLOW: light = 2'b01;
        GREEN:  light = 2'b10;
        default:light = 2'b00;
    endcase
end

endmodule