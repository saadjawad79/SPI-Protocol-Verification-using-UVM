class spi_scenario6 extends uvm_sequence#(spi_seq_item);
//slave active
  `uvm_object_utils(spi_scenario6)
  function new(string name = "spi_scenario6"); 
  super.new(name); 
  endfunction

  task body();
    spi_seq_item req = spi_seq_item::type_id::create("req");
    start_item(req);
    `uvm_info(get_type_name(), "Starting slave active sequence", UVM_MEDIUM);
    req.load_master = 0;
    req.load_slave = 1;
    req.read_master = 0;
    req.read_slave = 1;
    assert(req.randomize() with {
      data_in_slave == 8'hAA;
    });
    finish_item(req);
  endtask
endclass
