`timescale 1ns/1ps

module tb_top;
  // TODO: Fill in DUT instance and connect to AHB interface as discussed.
  // This placeholder exists so sim compiles once you add the missing pieces.

  logic HCLK;
  logic HRESETn;

  initial begin
    HCLK = 1'b0;
    forever #5 HCLK = ~HCLK;
  end

  // Create AHB interface
  ahb_if bus(HCLK, HRESETn);

  // Default drive
  initial begin
    bus.drive_defaults();
  end

  // Reset task called by test_runner
  task automatic apply_hw_reset();
    bus.drive_defaults();
    HRESETn = 1'b0;
    repeat (5) @(posedge HCLK);
    HRESETn = 1'b1;
    @(posedge HCLK);
    bus.drive_defaults();
  endtask

  initial begin
    HRESETn = 1'b1;
    apply_hw_reset();
  end

  // Stub IRQ
  logic irq;
  assign irq = 1'b0;

  // Runner
  test_runner u_test(
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .irq(irq),
    .bus(bus)
  );

endmodule
