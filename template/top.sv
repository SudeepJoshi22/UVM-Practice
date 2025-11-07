// top.sv

`include "umv_macros.svh"

import uvm_pkg::*;

module top();

	test_interface  intf();
	test_design	uut();		// Instantiating the design

	initial begin
		// set method
		uvm_config_db #(virtual test_interface)::set(null, "*", "intf", intf);
	end

	initial begin
		run_test("test-0");
	end

endmodule
