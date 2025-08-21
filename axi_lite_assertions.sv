// AXI-Lite Protocol Assertions
property p_aw_handshake;
  @(posedge ACLK) disable iff (!ARESETn)
  AWVALID |-> ##[1:3] AWREADY;
endproperty
assert property (p_aw_handshake);

property p_w_after_aw;
  @(posedge ACLK) disable iff (!ARESETn)
  AWVALID && AWREADY |-> ##[1:3] WVALID;
endproperty
assert property (p_w_after_aw);

property p_bresp_valid;
  @(posedge ACLK) disable iff (!ARESETn)
  (AWVALID && AWREADY && WVALID && WREADY) |-> ##[1:2] BVALID;
endproperty
assert property (p_bresp_valid);

property p_ar_handshake;
  @(posedge ACLK) disable iff (!ARESETn)
  ARVALID |-> ##[1:3] ARREADY;
endproperty
assert property (p_ar_handshake);

property p_rresp_valid;
  @(posedge ACLK) disable iff (!ARESETn)
  (ARVALID && ARREADY) |-> ##[1:2] RVALID;
endproperty
assert property (p_rresp_valid);
