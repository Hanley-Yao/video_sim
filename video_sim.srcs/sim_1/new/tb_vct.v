`timescale 1ns / 1ps

module tb_vct();

    parameter H_Active     = 1920;
    parameter H_FrontPorch = 88;
    parameter H_SyncWidth  = 44;
    parameter H_BackPorch  = 148;

    parameter V_Active     = 1080;
    parameter V_FrontPorch = 4;
    parameter V_SyncWidth  = 5;
    parameter V_BackPorch  = 36;

    reg     vtc_rst_n;
    reg     vtc_pix_clk;
    wire    vtc_vs_o;
    wire    vtc_hs_o;
    wire    vtc_de_o;

    initial begin
        vtc_pix_clk = 0;
        forever #(3) vtc_pix_clk = ~vtc_pix_clk;
    end

    initial begin
        vtc_rst_n = 0;
        repeat(1000) @(posedge vtc_pix_clk);
        vtc_rst_n = 1;
    end

    vct #(
            .H_Active(H_Active),
            .H_FrontPorch(H_FrontPorch),
            .H_SyncWidth(H_SyncWidth),
            .H_BackPorch(H_BackPorch),
            .V_Active(V_Active),
            .V_FrontPorch(V_FrontPorch),
            .V_SyncWidth(V_SyncWidth),
            .V_BackPorch(V_BackPorch)
        ) inst_vct (
            .vtc_rst_n   (vtc_rst_n),
            .vtc_pix_clk (vtc_pix_clk),
            .vtc_vs_o    (vtc_vs_o),
            .vtc_hs_o    (vtc_hs_o),
            .vtc_de_o    (vtc_de_o)
        );


endmodule