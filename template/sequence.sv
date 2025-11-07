// sequence.sv

class test_sequence extends uvm_sequence;

	`uvm_object_utils(test_sequence)

	test_packet pkt;

	function new( string name = "test_sequence");
		
		super.new(name);

	endfunction: new

	// Body to randamize the transactions
	task body()

		pkt	= 	test_packet::type_id:create("Test Packet");

		repeat(10)
		begin
			start_item(pkt);

			pkt.randomize();

			finish_item(pkt);
		end

	endtask: body

endclass: test_sequence
