class spi_scenario5 extends uvm_sequence#(spi_seq_item);
//master active
  `uvm_object_utils(spi_scenario5)
  function new(string name = "spi_scenario5");
   super.new(name); 
  endfunction

  task body();
    spi_seq_item req = spi_seq_item::type_id::create("req");
    start_item(req);
    `uvm_info(get_type_name(), "Starting master active sequence", UVM_MEDIUM);
    req.load_master = 1;
    req.load_slave = 0;
    req.read_master = 1;
    req.read_slave = 0;
    assert(req.randomize() with {
      data_in_master == 8'h55;
    });
    finish_item(req);
  endtask
endclass
