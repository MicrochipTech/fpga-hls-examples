add wave -hex -group "sum_collatz_top" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -bydu sum_collatz_top] 0]/*]]
add wave -hex -group "sum_collatz_top" -group "sum_collatz" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -r /sum_collatz_inst] 0]/*]]
