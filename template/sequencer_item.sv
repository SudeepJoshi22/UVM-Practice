// sequence_item.sv

class test_packet extends uvm_sequence_item;

	`uvm_componenet_utils(test_packet)

	// Input -> Request Items
	// Output -> Response Items
	// Define inputs and outputs here

	// requests
	rand 	bit	[7:0]	input_1;
	rand	bit	[7:0]	input_2;

	// response
	bit		[15:0]	output_1;

	function new( string name = "test_packet");

		super.new(name);

	endfunction: new

endclass: test_packet
