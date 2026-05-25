task automatic pat_hw_reset_smoke(virtual ahb_if bus, input logic irq);
  // Minimal placeholder: just ensure reset task exists.
  // Replace with real AHB reads when BFM is wired.
  $display("[PAT01] HW reset smoke start");
  $root.tb_top.apply_hw_reset();
  // Basic IRQ default expectation (provisional)
  repeat (20) @(posedge bus.HCLK);
  if (irq !== 1'b0) $fatal(1, "[PAT01] irq not low after reset");
  $display("[PAT01] PASS");
endtask
