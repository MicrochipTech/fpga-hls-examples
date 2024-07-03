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

module APB_PASS_THROUGH (
    input wire logic        target_penable,
    input wire logic        target_psel,
    input wire logic [31:0] target_paddr,
    input wire logic        target_pwrite,
    input wire logic [31:0] target_pwdata,
    output     logic [31:0] target_prdata,
    output     logic        target_pready,
    output     logic        target_pslverr,
    output wire logic        initiator_penable,
    output wire logic        initiator_psel,
    output wire logic [31:0] initiator_paddr,
    output wire logic        initiator_pwrite,
    output wire logic [31:0] initiator_pwdata,
    input     logic [31:0] initiator_prdata,
    input     logic        initiator_pready,
    input     logic        initiator_pslverr
    );
    
    assign initiator_penable = target_penable;
    assign initiator_paddr = target_paddr;
    assign initiator_pwrite = target_pwrite;
    assign initiator_pwdata = target_pwdata;
    assign initiator_psel = target_psel;
    assign target_prdata = initiator_prdata;
    assign target_pready = initiator_pready;
    assign target_pslverr = initiator_pslverr;
    
endmodule
