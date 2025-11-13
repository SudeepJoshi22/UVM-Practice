// Object Class

class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence)
  
  alu_sequence_item reset_pkt;
  
  function new(string name="alu_base_sequence");
    super.new(name);
    `uvm_info("BASE-SEQ", "Base Seq Constructor", UVM_HIGH)
  endfunction: new
  
  task body();
    `uvm_info("BASE-SEQ", "Inside Body Class", UVM_HIGH)
    
    
    reset_pkt = alu_sequence_item::type_id::create("reset_pkt");
    `uvm_info("BASE-SEQ", "Created Reset Packet", UVM_HIGH)
    
    start_item(reset_pkt);
    
    reset_pkt.randomize() with {reset == 1;};
    
    finish_item(reset_pkt);
    
  endtask: body
  
//   task body();
//     `uvm_info("BASE-SEQ", "Inside Body Class", UVM_HIGH)

//     // create and prepare reset packet deterministically
//     reset_pkt = alu_sequence_item::type_id::create("reset_pkt");
//     reset_pkt.reset = 1;         // explicitly set reset field
//     reset_pkt.a = 0;
//     reset_pkt.b = 0;
//     reset_pkt.opcode = 0;
//     `uvm_info("BASE-SEQ", $sformatf("Created Reset Packet reset=%0b", reset_pkt.reset), UVM_HIGH)

//     // send to driver: randomize (not needed for reset), then start/finish
//     start_item(reset_pkt);
//     finish_item(reset_pkt);

//     // If you want a short delay to let reset be seen:
//     // `uvm_do_with` or explicit wait/delay could be used
//     // #5; // optional small delay
//   endtask
  
endclass: alu_base_sequence

class alu_test_sequence extends alu_base_sequence;
  `uvm_object_utils(alu_test_sequence)

  alu_sequence_item item_pkt;
  string op_str; // Declare at class level, not inside task

  function new(string name="alu_test_sequence");
    super.new(name);
    `uvm_info("TEST-SEQ", "Test Seq Constructor", UVM_HIGH)
  endfunction: new

  task body();
    `uvm_info("TEST-SEQ", "Inside Body Class", UVM_HIGH)

    item_pkt = alu_sequence_item::type_id::create("item_pkt");
    start_item(item_pkt);

    if (!item_pkt.randomize() with { reset == 0; }) begin
      `uvm_error("TEST-SEQ", "Randomization failed for item_pkt!")
    end

    finish_item(item_pkt);

    // --- Decode opcode ---
    case (item_pkt.opcode)
      0: op_str = "ADD";
      1: op_str = "SUB";
      2: op_str = "MUL";
      3: op_str = "DIV";
      default: op_str = $sformatf("UNKNOWN(%0d)", item_pkt.opcode);
    endcase

    // --- Print transaction ---
    $display("\n============================");
    $display("ALU TRANSACTION GENERATED");
    $display("============================");
    $display(" Time      : %0t", $time);
    $display(" Reset     : %0b", item_pkt.reset);
    $display(" Operand A : %0d", item_pkt.a);
    $display(" Operand B : %0d", item_pkt.b);
    $display(" Opcode    : %0d (%s)", item_pkt.opcode, op_str);
    $display("============================\n");

    `uvm_info("TEST-SEQ", 
      $sformatf("Generated Transaction -> A=%0d, B=%0d, OP=%s (code=%0d)", 
                item_pkt.a, item_pkt.b, op_str, item_pkt.opcode),
      UVM_MEDIUM)
  endtask
endclass : alu_test_sequence

