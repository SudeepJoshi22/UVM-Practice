class alu_monitor extends uvm_monitor;
  
  `uvm_component_utils(alu_monitor)
  
  virtual alu_interface 	vif;
  alu_sequence_item 		item;
  
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  function new(string name = "alu_moniter", uvm_component parent);
    
    super.new(name, parent);
    
    `uvm_info("MONITOR-CLASS", "CONSTRUCTOR", UVM_HIGH);
    
  endfunction: new
  
  // Build Phase
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    `uvm_info("MONITOR-CLASS", "BUILD-PHASE", UVM_HIGH);
 
    monitor_port = new("monitor_port", this);
    
  endfunction: build_phase
  
  // Connect Phase 
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    `uvm_info("MONITOR-CLASS", "CONNECT-PHASE", UVM_HIGH);
     
    if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR-CLASS", "Failed to get vif from config DB!")
    end

    
  endfunction: connect_phase
  
  // Run Phase
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    `uvm_info("MONITOR-CLASS", "RUN-PHASE START", UVM_HIGH);
    
    forever begin
      item = alu_sequence_item::type_id::create("item");
    
      wait(!vif.reset);
      
      // sample inputs
      
      @(posedge vif.clock);
      item.a 		= 	vif.a;
      item.b 		= 	vif.b;
      item.opcode	=	vif.opcode;
      
      // samplt outputs
      @(posedge vif.clock);
      item.result	=	vif.result;
      
      // Send item to scoreboard
      monitor_port.write(item);
      
    end
    
    // Logic
    
  endtask: run_phase
  
  
endclass: alu_monitor
