// sequencer.sv

class test_sequencer extends uvm_sequencer #(test_packet);

	`uvm_componenet_utils(test_sequencer)

	// constructor
	function new (string name = "test_sequencer", uvm_componenet parent = null);
		super.new(name, parent);

	endfunction: new

	// Build Phase
	function void build_phase(uvm_phase phase);

		// build componenets

	endfunction: build_phase

	// Connect Phase
	function void connect_phase(uvm_phase phase);

		// connect componenets
	
	endfunction: connect_phase
	
	// main logic

endclass: test_sequencer
