`timescale 1ns / 1ps

module tb_image_src();

    parameter H_Active     = 1920;
    parameter H_FrontPorch = 88;
    parameter H_SyncWidth  = 44;
    parameter H_BackPorch  = 148;

    parameter V_Active     = 1080;
    parameter V_FrontPorch = 4;
    parameter V_SyncWidth  = 5;
    parameter V_BackPorch  = 36;

    parameter Frame_cnt    = 10;
    parameter Frame_bpp    = 24;
    parameter Frame_src    = "../../../../viewer/txt_i/2.txt";

    reg                         pix_clk;
    reg                         rst_n;

    wire                        vs;
    wire                        hs;
    wire                        de;
    wire    [Frame_bpp -1:0]    image_data;

    always #3 pix_clk = ~pix_clk;

    initial begin
        pix_clk <=  1'b1;
        rst_n   <=  1'b0;
        #100
        rst_n   <=  1'b1;

    end

    image_src #(
            .H_Active(H_Active),
            .H_FrontPorch(H_FrontPorch),
            .H_SyncWidth(H_SyncWidth),
            .H_BackPorch(H_BackPorch),
            .V_Active(V_Active),
            .V_FrontPorch(V_FrontPorch),
            .V_SyncWidth(V_SyncWidth),
            .V_BackPorch(V_BackPorch),
            .Frame_cnt(Frame_cnt),
            .Frame_bpp(Frame_bpp),
            .Frame_src(Frame_src)
        ) inst_image_src (
            .pix_clk    (pix_clk),
            .rst_n      (rst_n),
            .vs         (vs),
            .hs         (hs),
            .de         (de),
            .image_data (image_data)
        );

endmodule
