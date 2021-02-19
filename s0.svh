// class s0 template
class s0 extends uvm_sequence #(itm) ;
  `uvm_object_utils(s0)

itm mx;

   function new(string name="s0");
      super.new(name);
   endfunction : new

   task doreset(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_reset;
       mx.randomize();
       finish_item(mx);
     end
   endtask : doreset
   
   task donop(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_nop;
       mx.randomize();
       finish_item(mx);
     end
   endtask : donop
   
// A sequence body template. put tests there
   task body;
     mx=itm::type_id::create("seq_item");
     doreset(3);
     donop(3);

// Put your stuff here...

	repeat($urandom_range(5,10)) begin
		//*************************
		dopush($urandom_range(3,6));
		dopushcomplete($urandom_range(0,3));
		
	end
   endtask : body
   
   //*************************
   task dopush(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_push;
       mx.randomize();
       finish_item(mx);
     end
   endtask : dopush
   
   task dopushcomplete(input int nr);
     repeat(nr) begin
       start_item(mx);
       mx.opcode=E_pushcomplete;
       mx.randomize();
       finish_item(mx);
     end
   endtask : dopushcomplete
   //*************************
   
   
endclass : s0

