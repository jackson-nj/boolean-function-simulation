# Boolean Function Simulation Project - Group 1
**Digital Logic Design Course | August 2025**

## 📋 Project Overview
This project implements and simulates a simplified Boolean function using Verilog hardware description language and creates an interactive web-based waveform viewer.

**Boolean Function:** `F = (B & D) | (~B & ~D)`  
**Logic Type:** XNOR between inputs B and D  
**Team:** Group 1

---

## 📁 File Structure
```
model sim/
├── boolean_function.v          # Main Boolean function module
├── boolean_sim.v               # Comprehensive testbench  
├── simple_tb.v                 # Minimal testbench
├── interactive_verilog_waves.html  # Interactive waveform viewer
├── verilog_simulation.html     # Basic simulation viewer
└── README.md                   # This documentation
```

---

## 🔧 File Descriptions

### 1. **boolean_function.v**
- **Purpose:** Hardware implementation of the Boolean function
- **Module:** `simple_boolean`
- **Inputs:** A, B, C, D (4-bit)
- **Output:** F (1-bit)
- **Logic:** `assign F = (B & D) | (~B & ~D);`
- **Features:** 
  - Comprehensive comments and documentation
  - Truth table analysis in comments
  - Alternative implementation suggestions

### 2. **boolean_sim.v** 
- **Purpose:** Complete testbench for thorough verification
- **Features:**
  - Clock generation for timing reference
  - VCD waveform dump generation
  - All 16 input combinations tested
  - Real-time signal monitoring
  - Comprehensive output formatting
  - Assertion capabilities (commented)

### 3. **simple_tb.v**
- **Purpose:** Minimal testbench for quick verification
- **Features:**
  - Compact 4-bit input vector approach
  - Rapid testing with for-loop
  - Essential waveform generation
  - Minimal code footprint

### 4. **interactive_verilog_waves.html**
- **Purpose:** Professional interactive waveform simulator
- **Technology:** HTML5 + CSS3 + JavaScript + Plotly.js
- **Features:**
  - Professional engineering color scheme
  - Interactive digital waveforms with zoom/pan
  - Truth table with logic explanations
  - VCD file export capability
  - Responsive design
  - Real-time hover tooltips
  - Team branding integration

### 5. **verilog_simulation.html**
- **Purpose:** Basic simulation viewer (legacy)
- **Features:**
  - Simple truth table display
  - Basic waveform visualization
  - Lightweight implementation

---

## 🎯 Boolean Function Analysis

### Truth Table
| A | B | C | D | F | Logic Explanation |
|---|---|---|---|---|-------------------|
| 0 | 0 | 0 | 0 | **1** | ~B & ~D = 1 ✓ |
| 0 | 0 | 0 | 1 | **0** | B ≠ D → F = 0 |
| 0 | 0 | 1 | 0 | **1** | ~B & ~D = 1 ✓ |
| 0 | 0 | 1 | 1 | **0** | B ≠ D → F = 0 |
| 0 | 1 | 0 | 0 | **0** | B ≠ D → F = 0 |
| 0 | 1 | 0 | 1 | **1** | B & D = 1 ✓ |
| 0 | 1 | 1 | 0 | **0** | B ≠ D → F = 0 |
| 0 | 1 | 1 | 1 | **1** | B & D = 1 ✓ |
| 1 | 0 | 0 | 0 | **1** | ~B & ~D = 1 ✓ |
| 1 | 0 | 0 | 1 | **0** | B ≠ D → F = 0 |
| 1 | 0 | 1 | 0 | **1** | ~B & ~D = 1 ✓ |
| 1 | 0 | 1 | 1 | **0** | B ≠ D → F = 0 |
| 1 | 1 | 0 | 0 | **0** | B ≠ D → F = 0 |
| 1 | 1 | 0 | 1 | **1** | B & D = 1 ✓ |
| 1 | 1 | 1 | 0 | **0** | B ≠ D → F = 0 |
| 1 | 1 | 1 | 1 | **1** | B & D = 1 ✓ |

### Key Observations
- **Input Dependency:** Only B and D affect the output; A and C are ignored
- **Logic Pattern:** F = 1 when B = D (XNOR behavior)
- **Gate Implementation:** 2 AND + 2 NOT + 1 OR = 5 gates total
- **Timing:** Pure combinational logic with immediate response

---

## 🚀 Usage Instructions

### Verilog Simulation
```bash
# Using Icarus Verilog (if available)
iverilog -o sim boolean_function.v boolean_sim.v
vvp sim

# Using ModelSim (if available) 
vlib work
vlog *.v
vsim -gui boolean_sim
```

### Interactive Web Simulator
1. Open `interactive_verilog_waves.html` in any modern browser
2. Click "▶️ Run Simulation" to generate waveforms
3. Hover over waveforms for detailed timing information
4. Use zoom controls for detailed analysis
5. Export VCD files for external waveform viewers

### Quick Verification
1. Open `simple_tb.v` with any Verilog simulator
2. Run simulation to verify all 16 combinations
3. Check console output for truth table verification

---

## 🔍 Verification Results

### ✅ **Simulation Status:** PASSED
- All 16 test cases executed successfully
- Boolean function correctly implements XNOR(B,D)
- Timing analysis shows proper signal propagation
- Interactive waveforms match expected behavior
- VCD export generates valid waveform files

### 📊 **Performance Metrics:**
- **Simulation Time:** 160ns (16 × 10ns per test)
- **Gate Delay:** Combinational (immediate response)
- **Coverage:** 100% (all possible input combinations)
- **Verification:** Truth table and waveform analysis

---

## 🛠️ Technical Specifications

### **Hardware Requirements:**
- Any FPGA or ASIC technology
- Minimum 5 logic gates
- No clock or sequential elements required

### **Software Requirements:**
- Verilog simulator (Icarus, ModelSim, Vivado, Quartus)
- Modern web browser for interactive viewer
- Optional: GTKWave for VCD file analysis

### **Browser Compatibility:**
- Chrome 60+ ✅
- Firefox 55+ ✅  
- Safari 12+ ✅
- Edge 79+ ✅

---

## 👥 Team Information
- **Team:** Group 1
- **Course:** Digital Logic Design
- **Institution:** [Your Institution]
- **Date:** August 2025
- **Project Status:** Complete ✅

---

## 📈 Future Enhancements
- [ ] Add more complex Boolean functions
- [ ] Implement sequential logic elements
- [ ] Add timing constraint analysis
- [ ] Create mobile-responsive interface
- [ ] Integrate with cloud simulation platforms

---

**© 2025 Group 1 - Digital Logic Design Project**  
*"Implementing the future of digital design, one Boolean function at a time!"*
