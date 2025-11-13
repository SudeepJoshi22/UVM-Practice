class alu_env extends uvm_env;
  
  `uvm_component_utils(alu_env)
  
  // Instantiations
  alu_agent agent;
  alu_scoreboard scb;
  
  function new(string name = "alu_env", uvm_component parent);
    
    super.new(name, parent);
    
    `uvm_info("ENV-CLASS", "CONSTRUCTOR", UVM_HIGH);
    
  endfunction: new
  
  // Build Phase
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    `uvm_info("ENV-CLASS", "BUILD-PHASE", UVM_HIGH);
    
    agent = alu_agent::type_id::create("agent", this);
    
    scb = alu_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  // Connect Phase
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    `uvm_info("ENV-CLASS", "CONNECT-PHASE", UVM_HIGH);
    
    agent.monitor.monitor_port.connect(scb.scoreboard_port);
    `uvm_info("ENV-CLASS", "Connected Monitor to Scoreboard", UVM_HIGH);
    
  endfunction: connect_phase
  
  // Run Phase
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    `uvm_info("ENV-CLASS", "RUN-PHASE START", UVM_HIGH);
    
    // Logic
    
  endtask: run_phase
  
  
endclass: alu_env
