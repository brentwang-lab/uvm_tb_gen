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
//     File for hello_world.sv                                                       
//----------------------------------------------------------------------------------
import uvm_pkg::*;
`include "uvm_macros.svh"

class hello_world extends uvm_test;
    `uvm_component_utils(hello_world)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction // new

    task main_phase(uvm_phase phase);
        super.main_phase(phase);
        phase.raise_objection(this);
        `uvm_info(this.get_name(),"*******************Hello world from UVM*****************", UVM_LOW)

       // ToDo

       phase.drop_objection(this);
    endtask // main_phase
endclass // hello_world

module tb();
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    initial begin
        run_test("hello_world");
    end
endmodule // tb
