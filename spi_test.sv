
//SPI Test

class spi_test extends uvm_test;
  
  spi_environment env;
  
  virtual spi_interface vif;
  
  `uvm_component_utils(spi_test)
  
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env=spi_environment::type_id::create("env", this);
    uvm_config_db#(virtual spi_interface)::set(this, "env", "vif", vif);
    
    if(! uvm_config_db#(virtual spi_interface)::get(this, "", "vif", vif)) 
      begin
        `uvm_error("build_phase","Test virtual interface failed")
      end
  endfunction
  

  // task run_phase(uvm_phase phase);
  //   spi_sequence spi_seq;
  //   spi_seq = spi_sequence::type_id::create("spi_seq",this);
  //   phase.raise_objection( this, "Starting spi_base_seqin main phase" );
  //   $display("%t Starting sequence spi_seq run_phase",$time);
  //   spi_seq.start(env.agt.seq);
  //   #100ns;
  //   phase.drop_objection( this , "Finished spi_seq in main phase" );
  // endtask
  task run_phase(uvm_phase phase);
  spi_virtual_sequence vseq;
  vseq = spi_virtual_sequence::type_id::create("vseq", this);
  phase.raise_objection(this);
  vseq.start(env.vseqr);
  #100ns;
  phase.drop_objection(this);
endtask

  
endclass
