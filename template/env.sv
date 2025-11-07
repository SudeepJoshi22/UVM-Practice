// env.sv

class test_env extends uvm_env;

	`uvm_componenet_utils(test_env)

	// Instantiate the Classes
	test_agent agnt;

	// constructor
	function new (string name = "test_env", uvm_componenet parent = null);
		super.new(name, parent);

	endfunction: new


	// Build Phase
	function void build_phase(uvm_phase phase);

		//`uvm_info("COMPONENET", "MESSAGE", "PRIORITY);
		`uvm_info(get_type_name, "IN THE BUILD PHASE", UVM_MEDIUM)
		// build componenets

		// 1. Build the Agent class
		agnt	=	test_agent::type_id::create("agnt", this);

	endfunction: build_phase

	// Connect Phase
	function void connect_phase(uvm_phase phase);

		// connect componenets
	
	endfunction: connect_phase

	// main logic

endclass: test_env
