class spi_scenario2 extends uvm_sequence#(spi_seq_item);
//load master not slave
  `uvm_object_utils(spi_scenario2)
  function new(string name = "spi_scenario1");
    super.new(name);
  endfunction

  task body();
    spi_seq_item req;
    repeat(10) begin

      req = spi_seq_item::type_id::create("req");
      start_item(req);
      `uvm_info(get_type_name(), "Starting load master not slave sequence", UVM_MEDIUM);
      req.load_master = 1;
      req.load_slave = 0;
      assert(req.randomize() with {
        data_in_slave == 8'h00;
        data_in_master inside {[8'h01:8'hFE]};
      });
      finish_item(req);
    end
  endtask
endclass
