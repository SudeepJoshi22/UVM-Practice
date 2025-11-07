// test.sv

class test_class extends uvm_test;

	`uvm_component_utils(test_class)

	// Instantiate the Classes
	test_env env;

	// constructor
	// super -> refer to uvm_componenet class methods and objects
	function new (string name = "test_class", uvm_component parent = null);
	
		super.new(name, parent)

	endfunction: new

	// Build Phase
	function void build_phase(uvm_phase phase);

		// build componenets

		// 1. Build the Env Class ( UVM Factory method)
		env	=	test_env::type_id::create("env", this);

	endfunction: build_phase

	// Connect Phase
	function void connect_phase(uvm_phase phase);

		// connect componenets
	
	endfunction: connect_phase

	/* 
	function -> zero sim time
	task	 -> time consuming statements(like run phase)
	*/

	// Run Phase
	task run_phase(uvm_phase phase);

		// main logic

	endtask: run_phase


	// methods
	// properties

endclass: test_class
