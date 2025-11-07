// driver.sv

class test_driver extends uvm_driver #(test_packet);

	`uvm_component_utils(test_driver)

	// Instantiate the Interface
	test_interface intf;

	// Instantiate the Packet
	test_packet    pkt;

	function new (string name = "test_driver", uvm_component parent = null);
	
		super.new(name, parent)

	endfunction: new
	
	// Build Phase
	function void build_phase(uvm_phase phase);

		// build componenets
		pkt	=	test_packet::type_id::create("Test Packet");

		// get method
		uvm_config_db #(virtual test_interface)::get(null, "*", "intf", intf);

	endfunction: build_phase

	// Connect Phase
	function void connect_phase(uvm_phase phase);

		// connect componenets
	
	endfunction: connect_phase

	// Run Phase
	task run_phase(uvm_phase phase);

		forever begin
			@(posedge intf.clk)

				seq_item_port.get_next_item(pkt);

				intf.input_1 <= pkt.input_1;
				intf.input_2 <= pkt.input_2;

				seq_item_port.item_done();
		end

	endtask
	


endclass: test_driver
