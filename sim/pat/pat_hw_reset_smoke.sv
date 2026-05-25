task automatic pat_hw_reset_smoke(virtual ahb_if bus, input logic irq);
  import ahb_master_bfm_pkg::*;
  import ahb_types_pkg::*;
  import reg_model_pkg::*;

  ahb_master_bfm bfm;
  ahb_ctrl_cfg_t cfg;
  logic [31:0] r;
  int unsigned waited;

  $display("[PAT01] HW reset smoke start");

  cfg = default_cfg();
  bfm = new(bus, cfg);

  $root.tb_top.apply_hw_reset();

  // Provisional: verify 0x00..0x84 reset values via reg_model table (mask-aware)
  foreach (REGS[i]) begin
    bfm.reg_read32(REGS[i].addr, r, waited);
    if ((r & REGS[i].rmask) !== (REGS[i].reset & REGS[i].rmask)) begin
      $fatal(1,
        "[PAT01] reset mismatch %s addr=0x%08x got=0x%08x exp=0x%08x rmask=0x%08x",
        REGS[i].name, REGS[i].addr, r, REGS[i].reset, REGS[i].rmask
      );
    end
  end

  // Basic IRQ default expectation (provisional)
  repeat (20) @(posedge bus.HCLK);
  if (irq !== 1'b0) $fatal(1, "[PAT01] irq not low after reset");

  $display("[PAT01] PASS");
endtask
