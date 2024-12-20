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
//     File for dsel_loc_define.sv                                                       
//----------------------------------------------------------------------------------
`ifndef DSEL_LOC_DEFINE__SV
`define DSEL_LOC_DEFINE__SV
    `ifndef DSEL_LOC_DATA_WIDTH
        `define DSEL_LOC_DATA_WIDTH 32
    `endif
    `ifndef DSEL_LOC_ADD_WIDTH
        `define DSEL_LOC_ADDR_WIDTH 32
    `endif
    `ifndef DSEL_LOC_MASTER_INPUT_TIME
        `define DSEL_LOC_MASTER_INPUT_TIME 1ns
    `endif
    `ifndef DSEL_LOC_SLAVE_INPUT_TIME
        `define DSEL_LOC_SLAVE_INPUT_TIME 1ns
    `endif
    `ifndef DSEL_LOC_PASSIVE_INPUT_TIME
        `define DSEL_LOC_PASSIVE_INPUT_TIME 1ns
    `endif
    `ifndef DSEL_LOC_MASTER_OUTPUT_TIME
        `define DSEL_LOC_MASTER_OUTPUT_TIME 1ns
    `endif
    `ifndef DSEL_LOC_SLAVE_OUTPUT_TIME
        `define DSEL_LOC_SLAVE_OUTPUT_TIME 1ns
    `endif
    `ifndef DSEL_LOC_PASSIVE_OUTPUT_TIME
        `define DSEL_LOC_PASSIVE_OUTPUT_TIME 1ns
    `endif
`endif //DSEL_LOC_DEFINE__SV
