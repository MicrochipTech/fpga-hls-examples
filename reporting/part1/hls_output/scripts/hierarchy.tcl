add wave -hex -group "sobel_filter_top" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -bydu sobel_filter_top] 0]/*]]
add wave -hex -group "sobel_filter_top" -group "sobel_filter" -group "ports"  {*}[lsort [find nets -ports [lindex [find instances -r /sobel_filter_inst] 0]/*]]
