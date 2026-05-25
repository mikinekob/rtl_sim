module dut_empty (
  input  logic        HCLK,
  input  logic        HRESETn,

  // AHB-Lite (single slave)
  input  logic [31:0] HADDR,
  input  logic [ 1:0] HTRANS,
  input  logic        HWRITE,
  input  logic [ 2:0] HSIZE,
  input  logic [ 2:0] HBURST,
  input  logic [ 3:0] HPROT,
  input  logic        HMASTLOCK,
  input  logic [31:0] HWDATA,

  output logic [31:0] HRDATA,
  output logic        HREADYOUT,
  output logic [ 1:0] HRESP,

  output logic        irq
);

  // Always-ready, always-OKAY, read-as-zero stub.
  // This allows the testbench/BFM skeleton to run end-to-end.

  localparam logic [1:0] RESP_OKAY = 2'b00;

  always_comb begin
    HREADYOUT = 1'b1;
    HRESP     = RESP_OKAY;
    HRDATA    = 32'h0000_0000;
    irq       = 1'b0;
  end

endmodule
