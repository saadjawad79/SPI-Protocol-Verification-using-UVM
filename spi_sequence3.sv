class spi_scenario3 extends uvm_sequence#(spi_seq_item);
//load slave not master
  `uvm_object_utils(spi_scenario3)
  function new(string name = "spi_scenario2");
    super.new(name);
  endfunction

  task body();
    spi_seq_item req;
    repeat(10) begin
    req = spi_seq_item::type_id::create("req");
    start_item(req);
    `uvm_info(get_type_name(), "Starting load slave not master sequence", UVM_MEDIUM);
    req.load_master = 0;
    req.load_slave = 1;
    assert(req.randomize() with {
      data_in_master == 8'h00;
      data_in_slave inside {[8'h01:8'hFE]};
    });
    finish_item(req);
    end
  endtask
endclass
