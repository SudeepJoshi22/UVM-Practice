// monitor.sv

class test_monitor extends uvm_monitor;

	`uvm_componenet_utils(test_monitor)

	// Instantiate the Interface
	test_interface intf;

	// Instantiate the Packet
	test_packet    pkt;

	uvm_analysis_port #(test_packet) mon_port;

	function new (string name = "test_monitor", uvm_component parent = null);
	
		super.new(name, parent)

	endfunction: new
	
	// Build Phase
	function void build_phase(uvm_phase phase);

		// build componenets
		pkt	=	test_packet::type_id::create("Test Packet");

		// get method
		uvm_config_db #(virtual test_monitor)::get(null, "*", "intf", intf);

		mon_port = new("Monitor Port", this);

	endfunction: build_phase

	// Connect Phase
	function void connect_phase(uvm_phase phase);

		// connect componenets
	
	endfunction: connect_phase

	// run phase
	task run_phase(uvm_phase phase);

		forever begin
		
			@(posedge intf.clk);
			
				intf.input_1 <= pkt.input_1;
				intf.input_2 <= pkt.input_2;

		end

	endtask

endclass: test_monitor
