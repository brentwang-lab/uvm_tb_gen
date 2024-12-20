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
//     File for dadd_driver.sv                                                       
//----------------------------------------------------------------------------------
class dadd_driver extends uvm_driver #(dadd_item);
    `uvm_component_utils(dadd_driver)
    extern function new(string name ="dadd_driver", uvm_component parent = null);
    extern task          reset_phase(uvm_phase phase);
    extern task          main_phase(uvm_phase phase);
endclass: dadd_driver

function dadd_driver :: new(string name ="dadd_driver", uvm_component parent = null);
    super.new(name, parent);
endfunction: new

task          dadd_driver :: reset_phase(uvm_phase phase);
    phase.raise_objection(this);
    tb_dadd.dadd_if.mcb.dadd_in_en      <= 0 ;
    tb_dadd.dadd_if.mcb.dadd_in_addr    <= 0 ;
    tb_dadd.dadd_if.mcb.dadd_in         <= 0 ;
    wait(tb_dadd.dadd_if.reset_n);
    phase.drop_objection(this);
endtask : reset_phase

task dadd_driver :: main_phase(uvm_phase phase);
    @(posedge tb_dadd.dadd_if.clk);
    forever 
    begin
        seq_item_port.get_next_item(req);
        if(req.data_en)
        begin
            tb_dadd.dadd_if.mcb.dadd_in_en <= req.data_en;
            tb_dadd.dadd_if.mcb.dadd_in <= req.data;
            tb_dadd.dadd_if.mcb.dadd_in_addr <= req.addr;
        end
        else 
        begin
            tb_dadd.dadd_if.mcb.dadd_in_en <= 0;
            tb_dadd.dadd_if.mcb.dadd_in <= 0;
            tb_dadd.dadd_if.mcb.dadd_in_addr <= 0;
        end
        @(posedge tb_dadd.dadd_if.clk);
        tb_dadd.dadd_if.mcb.dadd_in_en <= 0;
        tb_dadd.dadd_if.mcb.dadd_in <= 0;
        tb_dadd.dadd_if.mcb.dadd_in_addr <= 0;
        seq_item_port.item_done();
    end
endtask: main_phase

