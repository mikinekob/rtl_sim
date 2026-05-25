package reg_checks_pkg;
  import reg_model_pkg::*;

  // Minimal check helper (no dependency on a specific BFM implementation).
  // You can replace read32() binding once your AHB BFM is wired in.

  typedef class reg_read_ifc;
  virtual class reg_read_ifc;
    pure virtual task read32(input logic [31:0] addr, output logic [31:0] data);
  endclass

  task automatic check_reset_table(reg_read_ifc rd, string tag);
    logic [31:0] r;
    foreach (REGS[i]) begin
      rd.read32(REGS[i].addr, r);
      if ((r & REGS[i].rmask) !== (REGS[i].reset & REGS[i].rmask)) begin
        $fatal(1,
          "[%s] reset mismatch %s addr=0x%08x got=0x%08x exp=0x%08x rmask=0x%08x",
          tag, REGS[i].name, REGS[i].addr, r, REGS[i].reset, REGS[i].rmask
        );
      end
    end
    $display("[%s] reset table PASS (0x00..0x84)", tag);
  endtask

endpackage
