#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2004 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(simulator => 1);

compile(
    fails => 1,
    expect =>
'.*%Error: t/t_inst_recurse_bad.v:\d+: Unsupported: Recursive multiple modules \(module instantiates something leading back to itself\): looped
%Error: t/t_inst_recurse_bad.v:\d+: Note self-recursion \(module instantiating itself directly\) is supported.
%Error: Exiting due to.*',
    );

ok(1);
1;