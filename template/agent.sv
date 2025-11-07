// agent.sv

class test_agent extends uvm_agent;

	`uvm_componenet_utils(test_agent)

	// Instantiate the Classes
	test_sequencer seqr;
	test_monitor   mon;
	test_driver    drv;

	// constructor
	function new (string name = "test_agent", uvm_componenet parent = null);
		super.new(name, parent);

	endfunction: new


	// Build Phase
	function void build_phase(uvm_phase phase);

		// build componenets

		// 1. Build the Sequencer
	
		seqr	=	test_sequencer::type_id::create("seqr", this);
		

		// 2. Build the Monitor
		
		mon	=	test_monitor::type_id::create("mon", this);

		// 3. Build the Driver

		drv	=	test_driver::type_id::create("drv", this);
	
	endfunction: build_phase

	// Connect Phase
	function void connect_phase(uvm_phase phase);

		// connect componenets
		// namings from UVM library
		drv.seq_item_port.connect(seqr.seq_item_export)

	endfunction: connect_phase

	// main logic

endclass: test_agent
