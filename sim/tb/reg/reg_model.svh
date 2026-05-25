      // ---- keep existing 0x18-0x24 definitions ----
      32'h0018: begin
        d = mk_default(a);
        d.reset = RST_18;
        d.wmask = WM_18;
        d.rmask = 32'hFFFF_FFFF;
        d.name  = "REG_0018";
      end
      32'h001C: begin
        d = mk_default(a);
        d.reset = RST_1C;
        d.wmask = WM_1C;
        d.rmask = 32'hFFFF_FFFF;
        d.name  = "REG_001C";
      end
      32'h0020: begin
        d = mk_default(a);
        d.reset = RST_20;
        d.wmask = WM_20;
        d.rmask = 32'h00FF_FFFF;
        d.name  = "REG_0020";
      end
      32'h0024: begin
        d = mk_default(a);
        d.reset = RST_24;
        d.wmask = WM_24;
        d.rmask = 32'h00FF_FFFF;
        d.name  = "REG_0024";
      end

      // ---- provisional regs: 0x00..0x84 (step 4) except 0x18-0x24 ----
      32'h0000: d = mk_default(a);
      32'h0004: d = mk_default(a);
      32'h0008: d = mk_default(a);
      32'h000C: d = mk_default(a);
      32'h0010: d = mk_default(a);
      32'h0014: d = mk_default(a);
      32'h0028: d = mk_default(a);
      32'h002C: d = mk_default(a);
      32'h0030: d = mk_default(a);
      32'h0034: d = mk_default(a);
      32'h0038: d = mk_default(a);
      32'h003C: d = mk_default(a);
      32'h0040: d = mk_default(a);
      32'h0044: d = mk_default(a);
      32'h0048: d = mk_default(a);
      32'h004C: d = mk_default(a);
      32'h0050: d = mk_default(a);
      32'h0054: d = mk_default(a);
      32'h0058: d = mk_default(a);
      32'h005C: d = mk_default(a);
      32'h0060: d = mk_default(a);
      32'h0064: d = mk_default(a);
      32'h0068: d = mk_default(a);
      32'h006C: d = mk_default(a);
      32'h0070: d = mk_default(a);
      32'h0074: d = mk_default(a);
      32'h0078: d = mk_default(a);
      32'h007C: d = mk_default(a);
      32'h0080: d = mk_default(a);
      32'h0084: d = mk_default(a);
