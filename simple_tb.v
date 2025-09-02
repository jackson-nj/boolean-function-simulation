//=============================================================================
// PROJECT: Minimal Boolean Function Testbench - Group 1  
// FILE: simple_tb.v
// DESCRIPTION: Compact testbench for quick Boolean function verification
// AUTHOR: Group 1 Team
// DATE: August 2025
// VERSION: 1.0
// PURPOSE: Rapid testing with minimal code overhead
//=============================================================================

//-----------------------------------------------------------------------------
// MINIMAL TESTBENCH MODULE
//-----------------------------------------------------------------------------
module simple_tb;
    
    //-------------------------------------------------------------------------
    // SIGNAL DECLARATIONS
    //-------------------------------------------------------------------------
    reg [3:0] inputs;               // 4-bit input vector [A,B,C,D]
    wire F;                         // Boolean function output
    
    //-------------------------------------------------------------------------  
    // DEVICE UNDER TEST (DUT) INSTANTIATION
    //-------------------------------------------------------------------------
    // Instantiate Boolean function with bit-sliced connections
    // inputs[3] = A (MSB), inputs[2] = B, inputs[1] = C, inputs[0] = D (LSB)
    simple_boolean uut (
        .A(inputs[3]),              // Connect A to MSB
        .B(inputs[2]),              // Connect B 
        .C(inputs[1]),              // Connect C
        .D(inputs[0]),              // Connect D to LSB
        .F(F)                       // Output connection
    );
    
    //-------------------------------------------------------------------------
    // SIMULATION SEQUENCE
    //-------------------------------------------------------------------------
    initial begin
        // Waveform generation setup
        $dumpfile("wave.vcd");      // Output file for waveform viewer
        $dumpvars(0, simple_tb);    // Dump all signals in testbench
        
        // Print test header
        $display("=== MINIMAL BOOLEAN FUNCTION TEST ===");
        $display("Function: F = (B & D) | (~B & ~D)");
        $display("ABCD | F");
        $display("-----|--");
        
        // Test all 16 combinations using compact for-loop
        for (inputs = 0; inputs < 16; inputs = inputs + 1) begin
            #1;                     // 1ns delay for signal propagation
            
            // Display binary input and corresponding output
            $display("%b | %b", inputs, F);
        end
        
        // Simulation completion
        $display("=== TEST COMPLETE ===");
        $finish;                    // End simulation
    end
    
endmodule

//=============================================================================
// REQUIRED MODULE: simple_boolean
//=============================================================================
// This testbench requires the 'simple_boolean' module containing:
// module simple_boolean(input A, B, C, D, output F);
//     assign F = (B & D) | (~B & ~D);
// endmodule
//=============================================================================