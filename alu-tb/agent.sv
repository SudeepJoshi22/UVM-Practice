class alu_agent extends uvm_agent;
  
  `uvm_component_utils(alu_agent)
  
  // Instantiations
  alu_driver 	driver;
  alu_monitor 	monitor;
  alu_sequencer seqr;
  
  function new(string name = "alu_agent", uvm_component parent);
    
    super.new(name, parent);
    
    `uvm_info("AGENT-CLASS", "CONSTRUCTOR", UVM_HIGH);
    
    driver 		= 	alu_driver::type_id::create("driver", this);
    monitor 	= 	alu_monitor::type_id::create("monitor", this);
    seqr		=	alu_sequencer::type_id::create("seqr", this);
    
  endfunction: new
  
  // Build Phase
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    `uvm_info("AGENT-CLASS", "BUILD-PHASE", UVM_HIGH);
    
  endfunction: build_phase
  
  // Connect Phase
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    `uvm_info("AGENT-CLASS", "CONNECT-PHASE", UVM_HIGH);
    
    driver.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction: connect_phase
  
  // Run Phase
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    `uvm_info("AGENT-CLASS", "RUN-PHASE START", UVM_HIGH);
    
    // Logic
    
  endtask: run_phase
  
  
endclass: alu_agent
