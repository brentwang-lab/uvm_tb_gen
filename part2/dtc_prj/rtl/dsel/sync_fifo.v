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
//     File for sync_fifo.v                                                       
//----------------------------------------------------------------------------------
`ifndef SYNC_FIFO__V
`define SYNC_FIFO__V
module sync_fifo#(
	parameter 		WIDTH		=	64,
	parameter 		DEPTH		=	1024,
	parameter 		ADDR_WIDTH	=	clogb2(DEPTH)
)(
	input 			clk,
	input 			rst_n,
	input 			wr_en,
	input			[WIDTH-1:0]din,
	input 			rd_en,
	output reg		[WIDTH-1:0]dout,
	output reg 		full,
	output reg 		empty,
	output reg		[ADDR_WIDTH-1:0]fifo_cnt
);
    reg		[WIDTH-1:0]			ram[DEPTH-1:0];
    reg		[ADDR_WIDTH-1:0]	wr_addr;
    reg		[ADDR_WIDTH-1:0]	rd_addr;
    
    function integer clogb2;
    	input[31:0]value;
    	begin
    		value=value-1;
    		for(clogb2=0;value>0;clogb2=clogb2+1)
    			value=value>>1;
    	end
    endfunction
    //read
    always@(posedge clk or negedge rst_n)begin 
    	if(~rst_n)
    		rd_addr		<=		{ADDR_WIDTH{1'b0}};
    	else if(rd_en && !empty)begin
    		rd_addr		<=		rd_addr+1'd1;
    		dout		<=		ram[rd_addr];
    		end
    	else begin
    		rd_addr		<=		rd_addr; 
    		dout		<=		dout;
    		end
    end
    //write
    always@(posedge clk or negedge rst_n)begin 
    	if(~rst_n)
    		wr_addr		<=		{ADDR_WIDTH{1'b0}};
    	else if(wr_en && !full) begin
    		wr_addr		<=		wr_addr+1'd1;
    		ram[wr_addr]<=		din;
    		end
    	else
    		wr_addr		<=		wr_addr;
    end					
    //fifo_cnt
    always@(posedge clk or negedge rst_n)begin 
    	if(~rst_n)
    		fifo_cnt	<=		{ADDR_WIDTH{1'b0}};
    	else if(wr_en && !full && !rd_en)
    		fifo_cnt	<=		fifo_cnt + 1'd1;
    	else if(rd_en && !empty && !wr_en)
    		fifo_cnt	<=		fifo_cnt - 1'd1;	
    	else 
    		fifo_cnt	<=		fifo_cnt;
    end
    //empty 
    always@(posedge clk or negedge rst_n)begin
    	if(~rst_n)
    		empty	<=	1'b1;
    	else
    		empty	<=	(!wr_en && (fifo_cnt[ADDR_WIDTH-1:1] == 'b0))&&((fifo_cnt[0] == 1'b0) || rd_en);
    end
    //full
    always@(posedge clk or negedge rst_n)begin
    	if(~rst_n)
    		full	<=	1'b0;
    	else
    		full	<=	(!rd_en	&&	(fifo_cnt[ADDR_WIDTH-1:1]=={(ADDR_WIDTH-1){1'b1}})) && ((fifo_cnt[0] == 1'b1) || wr_en);
    end
endmodule
`endif//SYNC_FIFO__V
