//=============================================================================
// PROJECT: Boolean Function Implementation - Group 1
// FILE: boolean_function.v  
// DESCRIPTION: Hardware implementation of simplified Boolean function
// FUNCTION: F = (B & D) | (~B & ~D) - XNOR logic between B and D
// AUTHOR: Group 1 Team
// DATE: August 2025
// VERSION: 1.0
//=============================================================================

//-----------------------------------------------------------------------------
// MAIN BOOLEAN FUNCTION MODULE
//-----------------------------------------------------------------------------
module simple_boolean(
    //-------------------------------------------------------------------------
    // PORT DECLARATIONS
    //-------------------------------------------------------------------------
    input  A,                       // Input A (MSB) - doesn't affect output
    input  B,                       // Input B - primary logic input
    input  C,                       // Input C - doesn't affect output  
    input  D,                       // Input D (LSB) - primary logic input
    output F                        // Output F - Boolean function result
);

    //-------------------------------------------------------------------------
    // COMBINATIONAL LOGIC IMPLEMENTATION
    //-------------------------------------------------------------------------
    // Boolean function: F = (B & D) | (~B & ~D)
    // This implements XNOR logic: F = 1 when B == D, F = 0 when B != D
    // Truth table:
    // B D | F
    // ----+---
    // 0 0 | 1  (Both low -> output high)
    // 0 1 | 0  (Different -> output low)  
    // 1 0 | 0  (Different -> output low)
    // 1 1 | 1  (Both high -> output high)
    
    assign F = (B & D) |            // Term 1: B AND D (both inputs high)
               (~B & ~D);           // Term 2: NOT B AND NOT D (both inputs low)
    
    // Alternative implementations (equivalent):
    // assign F = ~(B ^ D);         // XNOR using XOR negation
    // assign F = (B ~^ D);         // Direct XNOR operator (Verilog)

endmodule

//=============================================================================
// DESIGN NOTES AND ANALYSIS
//=============================================================================
// 1. FUNCTIONALITY: This module implements an XNOR gate between inputs B and D
// 2. INPUT DEPENDENCY: Only B and D affect the output; A and C are ignored
// 3. GATE COUNT: 2 AND gates + 2 NOT gates + 1 OR gate = 5 gates total  
// 4. PROPAGATION: Combinational logic with no clock - immediate response
// 5. SYNTHESIS: Will synthesize to basic logic gates in any FPGA/ASIC flow
//=============================================================================
