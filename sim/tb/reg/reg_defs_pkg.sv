package reg_defs_pkg;

  // Address map (byte offsets)
  localparam logic [31:0] A00 = 32'h0000;
  localparam logic [31:0] A04 = 32'h0004;
  localparam logic [31:0] A08 = 32'h0008;
  localparam logic [31:0] A0C = 32'h000C;
  localparam logic [31:0] A10 = 32'h0010; // (often IRQ_STATUS)
  localparam logic [31:0] A14 = 32'h0014; // (often IRQ_MASK)
  localparam logic [31:0] A18 = 32'h0018;
  localparam logic [31:0] A1C = 32'h001C;
  localparam logic [31:0] A20 = 32'h0020;
  localparam logic [31:0] A24 = 32'h0024;

  // Reset values
  // NOTE: Per request, 0x00..0x84 provisional regs default to 0.
  // Keep these existing reset values for 0x18-0x24 as-is (edit if your existing file differs).
  localparam logic [31:0] RST_18 = 32'h0000_0000;
  localparam logic [31:0] RST_1C = 32'h0000_0000;
  localparam logic [31:0] RST_20 = 32'h0000_0000;
  localparam logic [31:0] RST_24 = 32'h0000_0000;

  // Write masks (reserved bits must be 0 on write)
  // Keep existing wmask rules for 0x18-0x24 as-is (edit if your existing file differs).
  localparam logic [31:0] WM_18 = 32'hFFFF_FFFF;
  localparam logic [31:0] WM_1C = 32'hFFFF_FFFF;
  localparam logic [31:0] WM_20 = 32'h00FF_FFFF;
  localparam logic [31:0] WM_24 = 32'h00FF_FFFF;

endpackage
