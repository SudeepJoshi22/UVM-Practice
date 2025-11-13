class alu_test extends uvm_test;
  
  `uvm_component_utils(alu_test)
  
  // Instantiations
  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;
  
  function new(string name = "alu_test", uvm_component parent);
    
    super.new(name, parent);
    
    `uvm_info("TEST-CLASS", "CONSTRUCTOR", UVM_HIGH);
    
  endfunction: new
  
  // Build Phase
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    `uvm_info("TEST-CLASS", "BUILD-PHASE", UVM_HIGH);
    
    env = alu_env::type_id::create("env", this); 
    
  endfunction: build_phase
  
  // Connect Phase
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    `uvm_info("TEST-CLASS", "CONNECT-PHASE", UVM_HIGH);
    
    // Connect moniter with scoreboard
    
  endfunction: connect_phase
  
  // Run Phase
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    `uvm_info("TEST-CLASS", "RUN-PHASE START", UVM_HIGH);
    
    // Run the sequences
    phase.raise_objection(this);
    
    // start the sequences
    
    // reset sequence
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agent.seqr);
    #10;
    
    // test sequence
    repeat(50) begin
    	test_seq = alu_test_sequence::type_id::create("test_seq");
    	test_seq.start(env.agent.seqr);
    	#10;
    end
    
    phase.drop_objection(this);
    
    
  endtask: run_phase
  
  
endclass: alu_test
