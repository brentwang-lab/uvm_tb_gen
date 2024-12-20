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
//     File for dtc_loc_define.sv                                                       
//----------------------------------------------------------------------------------
`ifndef DTC_LOC_DEFINE__SV
`define DTC_LOC_DEFINE__SV
    `ifndef DTC_LOC_DATA_WIDTH
        `define DTC_LOC_DATA_WIDTH 32
    `endif
    `ifndef DTC_LOC_ADD_WIDTH
        `define DTC_LOC_ADDR_WIDTH 32
    `endif
    `ifndef DTC_LOC_MASTER_INPUT_TIME
        `define DTC_LOC_MASTER_INPUT_TIME 1ns
    `endif
    `ifndef DTC_LOC_SLAVE_INPUT_TIME
        `define DTC_LOC_SLAVE_INPUT_TIME 1ns
    `endif
    `ifndef DTC_LOC_PASSIVE_INPUT_TIME
        `define DTC_LOC_PASSIVE_INPUT_TIME 1ns
    `endif
    `ifndef DTC_LOC_MASTER_OUTPUT_TIME
        `define DTC_LOC_MASTER_OUTPUT_TIME 1ns
    `endif
    `ifndef DTC_LOC_SLAVE_OUTPUT_TIME
        `define DTC_LOC_SLAVE_OUTPUT_TIME 1ns
    `endif
    `ifndef DTC_LOC_PASSIVE_OUTPUT_TIME
        `define DTC_LOC_PASSIVE_OUTPUT_TIME 1ns
    `endif

`endif //DTC_LOC_DEFINE__SV
