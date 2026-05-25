task automatic pat_sw_reset_return_to_default(virtual ahb_if bus, input logic irq);
  // Placeholder: no SW reset register defined yet in this skeleton.
  $display("[PAT02] SW reset return-to-default (placeholder) start");
  repeat (10) @(posedge bus.HCLK);
  (void'(irq));
  $display("[PAT02] PASS (placeholder)");
endtask
