vsim -c -do "
  vlog rtl/axi_lite_slave.sv assertions/axi_lite_assertions.sv;
  formal compile;
  formal verify -all;
  quit;
"
