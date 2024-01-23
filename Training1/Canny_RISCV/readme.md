# Canny with RISC-V

This example illustrates the application of the Canny module, as detailed in 
previous examples, on the IcicleKit board. Here, a RISC-V processor operating on 
Linux loads an input image into the DDR memory. This allows the SmartHLS module 
to access, process, and subsequently write the output back into the DDR.

In other examples, the implementation of the Canny module is described using the 
SmartHLS `IP flow`. This is designed exclusively for generating a Verilog module.

The focus of this example, however, is on the reuse of the same module and its
compilation using the `SoC flow`. This process automatically integrates the
Canny module into the RISC-V subsystem within the MPFS250T FPGA.

This example employs the 'axi_initiator' type of arguments to transfer data
between the CPU and Fabric, eliminating the need for creating on-chip buffers
and instead utilizing FIFOs. This is exemplified in the highly straightforward
`write_fifo()` and `read_fifo()` functions.

The same method can be applied to operate other modules that also utilize AXI
streams or FIFOs.

Please note: For the sake of simplicity, all error checks have been omitted from
the code, such as verifying the successful allocation of CPU memory. However, it
is advisable to include them.

This is an image of what the design looks like:

```
                          +--------------+
                          |    RISC-V    |
                          +--------------+
                                  |
                                  |
                                  V
                            +------------+
                            |            |
                            |------------|
                            |  BufOut    |<-----------------+
                            |------------|                  |
                            |            |                  |
                            |------------|                  |
            +---------------|  BufIn     |                  |
            |               |------------|                  |
            |               |            |                  |
            |               +------------+                  |
            |                 DDR Memory                    |
            |                                               |
            V                                               |
    +--------------+         +--------------+         +-------------+
    | write_fifo() |--FIFO-->|    Canny()   |--FIFO-->| read_fifo() |
    +--------------+         +--------------+         +-------------+

```

