

//SPI Environment
 import uvm_pkg::*;
class spi_environment extends uvm_env;
  
  spi_agent agt;
  spi_coverage_collector cov;
  spi_scoreboard scb;
  spi_virtual_sequencer vseqr;
  virtual spi_interface vif;
  
  `uvm_component_utils(spi_environment)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    agt=spi_agent::type_id::create("agt", this);
    scb=spi_scoreboard::type_id::create("scb", this);
    cov = spi_coverage_collector::type_id::create("cov_collector", this);
    vseqr = spi_virtual_sequencer::type_id::create("vseqr", this);
    uvm_config_db#(virtual spi_interface)::set(this, "agt", "vif", vif);
    uvm_config_db#(virtual spi_interface)::set(this, "scb", "vif", vif);
    
    if(! uvm_config_db#(virtual spi_interface)::get(this, "", "vif", vif)) 
      begin
        `uvm_error("build_phase","Environment virtual interface failed")
      end
  endfunction
    
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.ap.connect(scb.mon_imp);
    agt.mon.ap.connect(cov.analysis_export);
    vseqr.seqr = agt.seq;
    uvm_report_info("SPI_ENVIRONMENT", "connect_phase, Connected monitor to scoreboard");
  endfunction
    
endclass
