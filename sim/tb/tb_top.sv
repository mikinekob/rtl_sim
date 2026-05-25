`timescale 1ns/1ps

module tb_top;
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

  // Reset task called by patterns via $root.tb_top.apply_hw_reset()
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

  // DUT (empty stub for now)
  logic irq;

  dut_empty u_dut (
    .HCLK(HCLK),
    .HRESETn(HRESETn),

    .HADDR(bus.HADDR),
    .HTRANS(bus.HTRANS),
    .HWRITE(bus.HWRITE),
    .HSIZE(bus.HSIZE),
    .HBURST(bus.HBURST),
    .HPROT(bus.HPROT),
    .HMASTLOCK(bus.HMASTLOCK),
    .HWDATA(bus.HWDATA),

    .HRDATA(bus.HRDATA),
    .HREADYOUT(bus.HREADYOUT),
    .HRESP(bus.HRESP),

    .irq(irq)
  );

  // Runner
  test_runner u_test(
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .irq(irq),
    .bus(bus)
  );

endmodule
