class spi_virtual_sequencer extends uvm_sequencer;
  `uvm_component_utils(spi_virtual_sequencer)

  spi_sequencer seqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
