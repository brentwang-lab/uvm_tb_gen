//----------------------------------------------------------------------------------
// This code is copyrighted by BrentWang and cannot be used for commercial purposes
// The github address:https://github.com/brentwang-lab/uvm_tb_gen                   
// You can refer to the book <UVM Experiment Guide> for learning, this is on this github
// If you have any questions, please contact email:brent_wang@foxmail.com          
//----------------------------------------------------------------------------------
//                                                                                  
// Author  : BrentWang                                                              
// Project : UVM study                                                              
// Date    : Sat Jan 26 06:05:52 WAT 2022                                           
//----------------------------------------------------------------------------------
//                                                                                  
// Description:                                                                     
//     File for tb_dadd.sv                                                       
//----------------------------------------------------------------------------------
import uvm_pkg::*;
`include "uvm_macros.svh"
module tb_dadd;
    import uvm_pkg::*;
    real  clk_period = 10;
    logic clk;
    logic reset_n;

    dadd_interface dadd_if(clk,reset_n);

    initial
        $timeformat(-9, 2,"ns", 10);

    initial 
    begin
        uvm_config_db#(virtual dadd_interface)::set(uvm_root::get(),"*","vif",dadd_if); 
    end

    initial
    begin
        clk = 1'b0;
        wait(clk_period > 0);
        forever
            clk = #(clk_period/2.0) ~ clk;
    end

    initial
    begin
        reset_n = 0;
        #10ns;
        reset_n = 1;
    end

    initial begin
        $vcdplusautoflushon;
        $vcdpluson();
    end

    initial
    begin
        run_test();
    end

    dadd dadd_inst
    (
        .clk       (dadd_if.clk),
        .rst_n     (dadd_if.reset_n),
        .dadd_in_en    (dadd_if.dadd_in_en ),
        .dadd_in_addr  (dadd_if.dadd_in_addr),
        .dadd_in       (dadd_if.dadd_in),
        .dadd_out      (dadd_if.dadd_out   ),
        .dadd_out_addr (dadd_if.dadd_out_addr),
        .dadd_out_en   (dadd_if.dadd_out_en)
    );

endmodule: tb_dadd
