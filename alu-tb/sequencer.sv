class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  
  `uvm_component_utils(alu_sequencer)
  
  function new(string name = "alu_sequencer", uvm_component parent);
    
    super.new(name, parent);
    
    `uvm_info("SEQUENCER-CLASS", "CONSTRUCTOR", UVM_HIGH);
    
  endfunction: new
  
  // Build Phase
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    `uvm_info("SEQUENCER-CLASS", "BUILD-PHASE", UVM_HIGH);
    
  endfunction: build_phase
  
  // Connect Phase
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    
    `uvm_info("SEQUENCER-CLASS", "CONNECT-PHASE", UVM_HIGH);
    
  endfunction: connect_phase
  
endclass: alu_sequencer
