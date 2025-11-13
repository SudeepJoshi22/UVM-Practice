// Object Class

class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)
  
  // Instantiation
  
  rand logic reset;
  
  rand logic		[7:0]	a, b;
  rand logic		[3:0]	opcode;
  
  logic				[15:0]	result;		// output
  bit						carry_out;	// output
  
  // Default Constraints
  constraint input1_c {
    a inside {[10:50]};
  }
  
  constraint input2_c {
    b inside {[10:50]};
  }
  
  constraint opcode_c {
    opcode inside {1,2,3,4};
  }
  
  function new(string name="alu_sequence_item");
               
  		super.new(name);          
  
  endfunction: new
              
  
endclass: alu_sequence_item
