# Canny with RISC-V

The goal of this example is to demonstrate one way a design compiled using the SmartHLS IP Flow can
be reused to be compiled using the SmartHLS SoC Flow. To do this, we will show how the Canny design in [Training 1](../Training1),
which was originally compiled using the IP Flow, can be [modified slighty](canny.cpp) such that we can 
compile it using the SoC Flow, and run it on the [Icicle Kit](https://www.microchip.com/en-us/development-tool/mpfs-icicle-kit-es) board.

## Prerequisites
- If you haven't already, follow the [Icicle Kit Setup Instructions](https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=hls_iciclekit&redirect=true&version=latest) to set up the Icicle Kit.
- We assume you have already completed [Training 1](../Training1), and understand how the Canny module works,
as this example will focus on the SoC Flow rather than the Canny design itself.
- Having completed [Training 4](../Training4) as a primer on how the SoC Flow works will be useful for this example.

## Description
In [Training 1](../Training1), the implementation of the Canny module is described using the 
SmartHLS IP flow. This is designed exclusively for generating a Verilog module.

The focus of this example, however, is on the reuse of the same module and its
compilation using the SoC flow. This process automatically integrates the
Canny module into the RISC-V subsystem within the MPFS250T FPGA.

Here, the `main()` function is now cross-compiled and executed by the RISC-V processor operating on Linux on the MPFS250T FPGA in the Icicle Kit board.
The RISC-V processor loads an input image into the DDR memory. 
This allows the SmartHLS module to access, process, and subsequently write the output back directly into the DDR.

To change the Canny example from Training 1 to be compiled using the SoC flow instead of the IP flow, we have made minor
changes to [`canny.cpp`](canny.cpp). This Canny example employs the ['axi_initiator'](https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=hls_axi4_initiator&redirect=true&version=latest) argument type to transfer data between the CPU and fabric. This eliminates the need for on-chip buffers, which would be needed if the argument type was set to `axi_target`. For large images, there may not be enough LSRAM on-chip.

The original Canny IP flow design used FIFOs to stream data in and out of the module. As not to change the module, we added
the new straightforward `write_fifo()` and `read_fifo()` functions to move the data from and to the CPU:

```C
16  void write_fifo(unsigned char *buf, hls::FIFO<unsigned char> &out_fifo, int nWords) {
17  #pragma HLS loop pipeline
18  	for(int i=0; i<nWords; i++) {
19      	auto tmp = buf[i];
20      	out_fifo.write(tmp);
21      }
22  }
23
24  void read_fifo(hls::FIFO<unsigned char>  &in_fifo, unsigned char *buf, int nWords) {
25  #pragma HLS loop pipeline
26      for(int i=0; i<nWords; i++) {
27      	auto wd = in_fifo.read();
28      	buf[i] = wd;
29      }
30  }
```

```C
47  void canny_wrapper(unsigned char *bufIn, unsigned char *bufOut) {
48	#pragma HLS function top dataflow
49	#pragma HLS interface default type(axi_target)
50	#pragma HLS interface argument(bufIn) type(axi_initiator) num_elements(SIZE) max_burst_len(256)
51	#pragma HLS interface argument(bufOut) type(axi_initiator) num_elements(SIZE) max_burst_len(256)
52
53  	hls::FIFO<unsigned char> fifo_1(FIFO_DEPTH);
54  	hls::FIFO<unsigned char> fifo_2(FIFO_DEPTH);
55  	write_fifo(bufIn, fifo_1, SIZE);
56  	canny(fifo_1, fifo_2);
57  	read_fifo(fifo_2, bufOut, SIZE);
58  }
```

The same method can be applied to operate other modules that also utilize AXI
streams or FIFOs.

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


**NOTE:** For the sake of simplicity, all error checks, such as verifying the successful allocation of CPU memory, and comparing against a reference software,
have been omitted from this example. However, it is advisable to include error checking code.

## References

For a more comprehensive look at the AXI Initator interface, see [the SmartHLS User Guide](https://onlinedocs.microchip.com/v2/keyword-lookup?keyword=hls_axi4_initiator&redirect=true&version=latest).

