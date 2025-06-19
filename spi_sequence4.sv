class spi_scenario4 extends uvm_sequence#(spi_seq_item);
//no load
  `uvm_object_utils(spi_scenario4)
  function new(string name = "spi_scenario3");
    super.new(name);
  endfunction

  task body();
    spi_seq_item req;
    repeat(10) begin
    req = spi_seq_item::type_id::create("req");
    start_item(req);
    `uvm_info(get_type_name(), "Starting no load sequence", UVM_MEDIUM);
    req.load_master = 0;
    req.load_slave = 0;
    assert(req.randomize() with {
      data_in_master == 8'hAA;
      data_in_slave == 8'h55;
    });
    finish_item(req);
    end
  endtask
endclass
