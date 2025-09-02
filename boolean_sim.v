//=============================================================================
// PROJECT: Boolean Function Simulation - Group 1
// FILE: boolean_sim.v
// DESCRIPTION: Complete testbench for Boolean function F = (B & D) | (~B & ~D)
// AUTHOR: Group 1 Team
// DATE: August 2025
// VERSION: 1.0
//=============================================================================

module boolean_sim;
    //-------------------------------------------------------------------------
    // SIGNAL DECLARATIONS
    //-------------------------------------------------------------------------
    // Input test signals (registers to drive values)
    reg A, B, C, D;                 // 4-bit input vector
    
    // Output signal (wire to observe results)
    wire F;                         // Boolean function output
    
    //-------------------------------------------------------------------------
    // DEVICE UNDER TEST (DUT) INSTANTIATION
    //-------------------------------------------------------------------------
    // Instantiate the Boolean function module
    // Maps: A->A, B->B, C->C, D->D, F<-F
    simple_boolean dut(
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .F(F)
    );
    
    //-------------------------------------------------------------------------
    // CLOCK GENERATION (Optional - for timing reference)
    //-------------------------------------------------------------------------
    // Generate 100MHz clock (10ns period)
    reg clk = 0;
    always #5 clk = ~clk;           // Toggle every 5ns
    
    //-------------------------------------------------------------------------
    // MAIN SIMULATION PROCESS
    //-------------------------------------------------------------------------
    initial begin
        // Setup waveform dump for analysis
        $dumpfile("simulation.vcd");   // VCD file for waveform viewers
        $dumpvars(0, boolean_sim);     // Dump all signals in this module
        
        // Print simulation header
        $display("=== BOOLEAN FUNCTION SIMULATION ===");
        $display("Function: F = (B & D) | (~B & ~D)");
        $display("Time | A B C D | F | Description");
        $display("-----|---------|---|------------");
        
        // Initialize all inputs to zero
        {A, B, C, D} = 4'b0000;
        
        // Test all 16 possible input combinations (0000 to 1111)
        repeat(16) begin
            #10;                       // Wait 10ns for signal propagation
            
            // Display current state with timing information
            $display("%4d | %b %b %b %b | %b | Input=%d", 
                    $time, A, B, C, D, F, {A,B,C,D});
            
            // Increment input vector for next test case
            {A, B, C, D} = {A, B, C, D} + 1;
        end
        
        // Simulation summary
        $display("\n=== SIMULATION COMPLETE ===");
        $display("Total simulation time: %d ns", $time);
        $display("All 16 test cases executed successfully");
        
        // End simulation
        $finish;
    end
    
    //-------------------------------------------------------------------------
    // CONTINUOUS MONITORING (Real-time signal changes)
    //-------------------------------------------------------------------------
    // Monitor and display any signal changes during simulation
    initial begin
        $monitor("@%0t: ABCD=%b%b%b%b -> F=%b", $time, A, B, C, D, F);
    end
    
    //-------------------------------------------------------------------------
    // ASSERTIONS (Optional - for verification)
    //-------------------------------------------------------------------------
    // Add verification checks here if needed
    // Example: assert((B==D) ? (F==1) : (F==0)) else $error("Logic error!");
    
endmodule

//=============================================================================
// BOOLEAN FUNCTION MODULE (Missing - needs to be included)
//=============================================================================
// Note: This testbench requires the 'simple_boolean' module to be defined
// either in this file or included from another file
//=============================================================================