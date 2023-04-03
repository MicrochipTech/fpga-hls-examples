add wave -hex -group "row_cumulative_sum_top" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -bydu row_cumulative_sum_top] 0]/*]]
add wave -hex -group "row_cumulative_sum_top" -group "row_cumulative_sum" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -r /row_cumulative_sum_inst] 0]/*]]
