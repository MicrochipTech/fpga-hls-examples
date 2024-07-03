////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021, Microchip Corporation
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL MICROCHIP CORPORATIONM BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// APACHE LICENSE
// Copyright (c) 2021, Microchip Corporation 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////////////////////

module APB_ARBITER #(select_bit = 28) (
    input wire logic        in_penable, //
    input wire logic        in_psel, //
    input wire logic [31:0] in_paddr, //
    input wire logic        in_pwrite, //
    input wire logic [31:0] in_pwdata, //
    output     logic [31:0] in_prdata, //
    output     logic        in_pready, //
    output     logic        in_pslverr,
    output wire logic        out_low_penable,
    output wire logic        out_low_psel,
    output wire logic [31:0] out_low_paddr,
    output wire logic        out_low_pwrite,
    output wire logic [31:0] out_low_pwdata,
    input     logic [31:0] out_low_prdata,
    input     logic        out_low_pready,
    input     logic        out_low_pslverr,
    output wire logic        out_high_penable,
    output wire logic        out_high_psel,
    output wire logic [31:0] out_high_paddr,
    output wire logic        out_high_pwrite,
    output wire logic [31:0] out_high_pwdata,
    input     logic [31:0] out_high_prdata,
    input     logic        out_high_pready,
    input     logic        out_high_pslverr
    );  
    
    assign out_low_penable = in_penable;
    assign out_high_penable = in_penable;
    
    assign out_low_paddr = in_paddr;
    assign out_high_paddr = in_paddr;
    
    assign out_low_pwrite = in_pwrite;
    assign out_high_pwrite = in_pwrite;
    
    assign out_low_pwdata = in_pwdata;
    assign out_high_pwdata = in_pwdata;
    
    assign out_low_psel = in_psel & !in_paddr[select_bit];
    assign out_high_psel = in_psel & in_paddr[select_bit];
    
    assign in_prdata = out_low_prdata | out_high_prdata;
    
    assign in_pready = (in_psel & !in_paddr[select_bit]) ? out_low_pready : out_high_pready;
    
    assign in_pslverr = (in_psel & !in_paddr[select_bit]) ? out_low_pslverr : out_high_pslverr;
    
endmodule
