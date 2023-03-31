add wave -hex -group "top_function_top" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -bydu top_function_top] 0]/*]]
add wave -hex -group "top_function_top" -group "top_function" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -r /top_function_inst] 0]/*]]
