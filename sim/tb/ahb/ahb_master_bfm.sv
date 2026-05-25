package ahb_master_bfm_pkg;
  import ahb_types_pkg::*;

  class ahb_master_bfm;
    virtual ahb_if.master bus;
    ahb_ctrl_cfg_t cfg;

    function new(virtual ahb_if.master bus_if, ahb_ctrl_cfg_t cfg_i = default_cfg());
      bus = bus_if;
      cfg = cfg_i;
    endfunction

    // Wait for slave ready with timeout
    task automatic wait_ready(output int unsigned waited);
      waited = 0;
      while (!bus.HREADYOUT) begin
        @(posedge bus.HCLK);
        waited++;
        if (waited >= cfg.timeout_cycles) begin
          $fatal(1, "[AHB_BFM] TIMEOUT waiting for HREADYOUT after %0d cycles", waited);
        end
      end
    endtask

    // Single-cycle aligned AHB-Lite write (NONSEQ)
    task automatic reg_write32(input logic [31:0] addr, input logic [31:0] data,
                               output int unsigned waited);
      // Address/control phase
      @(posedge bus.HCLK);
      bus.HSEL   <= 1'b1;
      bus.HADDR  <= addr;
      bus.HTRANS <= ahb_if::NONSEQ;
      bus.HWRITE <= 1'b1;
      bus.HSIZE  <= 3'b010; // 32-bit
      bus.HWDATA <= data;

      // Data phase / wait states
      wait_ready(waited);

      // Return to IDLE
      @(posedge bus.HCLK);
      bus.HSEL   <= 1'b0;
      bus.HTRANS <= ahb_if::IDLE;
      bus.HWRITE <= 1'b0;
      bus.HADDR  <= '0;
      bus.HWDATA <= '0;
    endtask

    // Single-cycle aligned AHB-Lite read (NONSEQ)
    task automatic reg_read32(input logic [31:0] addr, output logic [31:0] data,
                              output int unsigned waited);
      // Address/control phase
      @(posedge bus.HCLK);
      bus.HSEL   <= 1'b1;
      bus.HADDR  <= addr;
      bus.HTRANS <= ahb_if::NONSEQ;
      bus.HWRITE <= 1'b0;
      bus.HSIZE  <= 3'b010;

      // Data phase / wait states
      wait_ready(waited);
      data = bus.HRDATA;

      // Return to IDLE
      @(posedge bus.HCLK);
      bus.HSEL   <= 1'b0;
      bus.HTRANS <= ahb_if::IDLE;
      bus.HADDR  <= '0;
    endtask

  endclass

endpackage
