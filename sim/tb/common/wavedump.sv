module wavedump;
  initial begin
`ifdef SHMFILE
    $shm_open("wave.shm");
    $shm_probe("AS");
    $shm_probe(tb_top, "AS");
`endif
  end
endmodule
