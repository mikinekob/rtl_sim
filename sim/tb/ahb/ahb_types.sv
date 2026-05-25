package ahb_types_pkg;

  // Minimal AHB-Lite types for the BFM.

  typedef struct packed {
    int unsigned timeout_cycles; // max cycles to wait for HREADYOUT
  } ahb_ctrl_cfg_t;

  function automatic ahb_ctrl_cfg_t default_cfg();
    ahb_ctrl_cfg_t c;
    c.timeout_cycles = 1000;
    return c;
  endfunction

endpackage
