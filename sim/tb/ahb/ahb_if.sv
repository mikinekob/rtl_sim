interface ahb_if(input logic HCLK, input logic HRESETn);

  // Master -> Slave
  logic [31:0] HADDR;
  logic [ 1:0] HTRANS;
  logic        HWRITE;
  logic [ 2:0] HSIZE;
  logic [ 2:0] HBURST;
  logic [ 3:0] HPROT;
  logic        HMASTLOCK;
  logic [31:0] HWDATA;

  // Slave -> Master
  logic [31:0] HRDATA;
  logic        HREADYOUT;
  logic [ 1:0] HRESP;

  localparam logic [1:0] IDLE   = 2'b00;
  localparam logic [1:0] BUSY   = 2'b01;
  localparam logic [1:0] NONSEQ = 2'b10;
  localparam logic [1:0] SEQ    = 2'b11;

  task automatic drive_defaults();
    HADDR     <= '0;
    HTRANS    <= IDLE;
    HWRITE    <= 1'b0;
    HSIZE     <= 3'b010;
    HBURST    <= 3'b000;
    HPROT     <= 4'b0011;
    HMASTLOCK <= 1'b0;
    HWDATA    <= '0;
  endtask

  modport master (
    input  HCLK, HRESETn,
    output HADDR, HTRANS, HWRITE, HSIZE, HBURST, HPROT, HMASTLOCK, HWDATA,
    input  HRDATA, HREADYOUT, HRESP
  );

  modport slave (
    input  HCLK, HRESETn,
    input  HADDR, HTRANS, HWRITE, HSIZE, HBURST, HPROT, HMASTLOCK, HWDATA,
    output HRDATA, HREADYOUT, HRESP
  );

endinterface
