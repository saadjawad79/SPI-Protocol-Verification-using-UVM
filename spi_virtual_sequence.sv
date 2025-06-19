class spi_virtual_sequence extends uvm_sequence;
  `uvm_object_utils(spi_virtual_sequence)
  //spi_virtual_sequencer vseqr;

  function new(string name = "spi_virtual_sequence");
    super.new(name);
  endfunction

  task body();
    //  spi_virtual_sequencer vseqr;
  spi_virtual_sequencer vseqr;
  if (!$cast(vseqr, m_sequencer)) begin
    `uvm_fatal("VSEQ", "Failed to cast m_sequencer to spi_virtual_sequencer")
  end

    spi_sequence::type_id::create("s1").start(vseqr.seqr);
    spi_scenario2::type_id::create("s2").start(vseqr.seqr);
    spi_scenario3::type_id::create("s3").start(vseqr.seqr);
    spi_scenario4::type_id::create("s4").start(vseqr.seqr);
    spi_scenario5::type_id::create("s5").start(vseqr.seqr);
    spi_scenario6::type_id::create("s6").start(vseqr.seqr);
  endtask
endclass
