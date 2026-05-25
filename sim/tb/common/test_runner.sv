module test_runner(
  input  logic    HCLK,
  input  logic    HRESETn,
  input  logic    irq,
  virtual ahb_if  bus
);
  import test_names_pkg::*;

  string test;

  initial begin
    if (!$value$plusargs("TEST=%s", test)) test = ALL;

    if (test == ALL || test == PAT01_HW_RESET_SMOKE) begin
      pat_hw_reset_smoke(bus, irq);
    end

    if (test == ALL || test == PAT02_SW_RESET_RETURN_DEFAULT) begin
      pat_sw_reset_return_to_default(bus, irq);
    end

    $display("[TEST_RUNNER] DONE: %s", test);
    $finish;
  end

endmodule
