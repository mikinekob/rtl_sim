package reg_model_pkg;
  import reg_defs_pkg::*;

  typedef enum int {ACC_RO, ACC_RW, ACC_W1C} acc_e;

  typedef struct {
    logic [31:0] addr;
    logic [31:0] reset;
    logic [31:0] wmask;
    logic [31:0] rmask;
    acc_e        acc;
    bit          readback;
    string       name;
  } reg_desc_t;

  function automatic string regname(input int unsigned a);
    return $sformatf("REG_%04h", a[15:0]);
  endfunction

  function automatic reg_desc_t mk_default(input int unsigned a);
    reg_desc_t d;
    d.addr     = a;
    d.reset    = 32'h0000_0000;
    d.wmask    = 32'hFFFF_FFFF;
    d.rmask    = 32'hFFFF_FFFF;
    d.acc      = ACC_RW;
    d.readback = 1'b1;
    d.name     = regname(a);
    return d;
  endfunction

  function automatic reg_desc_t build_reg(input int unsigned a);
    reg_desc_t d;

    unique case (a)
`include "reg_model.svh"
      default: begin
        d = mk_default(a);
      end
    endcase

    return d;
  endfunction

  localparam int unsigned REG_FIRST = 32'h0000;
  localparam int unsigned REG_LAST  = 32'h0084;
  localparam int unsigned REG_STEP  = 4;

  function automatic reg_desc_t gen_map[$]();
    reg_desc_t q[$];
    for (int unsigned a = REG_FIRST; a <= REG_LAST; a += REG_STEP) begin
      q.push_back(build_reg(a));
    end
    return q;
  endfunction

  localparam reg_desc_t REGS[$] = gen_map();

endpackage
