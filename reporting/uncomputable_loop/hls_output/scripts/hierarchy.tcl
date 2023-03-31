add wave -hex -group "collatz_top" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -bydu collatz_top] 0]/*]]
add wave -hex -group "collatz_top" -group "collatz" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -r /collatz_inst] 0]/*]]
