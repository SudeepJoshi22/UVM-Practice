// Code your testbench here
// or browse Examples
`timescale 1ns/1ns

import uvm_pkg::*;
  
`include "uvm_macros.svh"
  

//--------------------------------------------------------
//Include Files
//--------------------------------------------------------
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"
  
// ------------------------
  
  module top();
  	
    logic clock;
    
    virtual alu_interface vif;
    
    // Instantiation
    alu_interface intf(.clock(clock));
    
    
    alu dut(
      .clock(intf.clock),
      .reset(intf.reset),
      .A(intf.a),
      .B(intf.b),
      .ALU_Sel(intf.opcode),
      .ALU_Out(intf.result),
      .CarryOut(intf.carry_out)
    );
    
    // Interface Setting
    initial begin
      uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf);
    end
    
    initial begin
    	// Dump waveform
    	$display("Dumping waveform to alu_wave.vcd ...");
    	$dumpfile("alu_wave.vcd");
    	$dumpvars(0, top); // dump everything under tb_top
  	end
    
    initial begin
	  #0; 
      run_test("alu_test");
    end
    
    initial begin
      clock = 0;
      #5;
      forever begin
        clock = ~clock;
        #2;
      end
    end
    
    initial begin
      #5000
      $display("Run out of Clock Cycles!");
      $finish();
    end
      
  endmodule
