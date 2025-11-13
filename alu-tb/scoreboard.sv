class alu_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  // Instantiations
  alu_sequence_item transactions[$]; // Queue to store the transactions
  
  function new(string name = "alu_scoreboard", uvm_component parent);
    
    super.new(name, parent);
    
    `uvm_info("SCOREBOARD-CLASS", "CONSTRUCTOR", UVM_HIGH)
    
  endfunction: new
  
  // Build Phase
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    `uvm_info("SCOREBOARD-CLASS", "BUILD-PHASE", UVM_HIGH);
    
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  // Connect Phase
  function void connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    `uvm_info("SCOREBOARD-CLASS", "CONNECT-PHASE", UVM_HIGH)
    
    // Connect moniter with scoreboard
    
  endfunction: connect_phase
  
  // Write Method
  function void write(alu_sequence_item item);
    
    transactions.push_back(item);
    
  endfunction: write
  
  // Run Phase
  task run_phase (uvm_phase phase);
    
    super.run_phase(phase);
    `uvm_info("TEST-CLASS", "RUN-PHASE START", UVM_HIGH);
    
    forever begin
      
      alu_sequence_item current_trans;
      
      // get the packet
      
      wait(transactions.size() != 0);
      
      current_trans = transactions.pop_front();
      
      // generate expected value
      
      // compare it with actual value
  
      // score the transactions
      
      compare(current_trans);
      
      
    end
    
  endtask: run_phase
  
  task compare (alu_sequence_item trans);

    logic	[7:0]	expected;
    logic	[7:0]	actual;
    
    case(trans.opcode)
      0: begin // A + B
        expected = trans.a + trans.b;
      end
	  1: begin // A - B
        expected = trans.a - trans.b;
      end
	  2: begin // A * B
        expected = trans.a * trans.b;
      end
	  3: begin // A / B
        expected = trans.a / trans.b;
      end
      default: expected = 8'hAC ;
    endcase
    
    actual = trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction Failed! ACT = %d, EXP = %d", actual, expected))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT = %d, EXP = %d", actual, expected), UVM_LOW)  
    end
    
  endtask: compare

endclass: alu_scoreboard	
