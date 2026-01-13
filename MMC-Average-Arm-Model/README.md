# Modular Multilevel Converter (MMC) for Grid-Following Applications

## 📌 Project Overview
This repository contains the design, simulation, and analysis of a **Modular Multilevel Converter (MMC)** for grid-following applications in high-voltage direct current (HVDC) systems. The project focuses on validating control strategies, energy balancing, and dynamic performance under various operational scenarios.

This model serves as a validation platform for:
* **HVDC Transmission**
* **Renewable Energy Integration**
* **Grid Stability Enhancement**

---

## ✨ Key Features

### 1. Simplified MMC Architecture
* **Design:** Single submodule per arm for reduced computational complexity while retaining dynamic accuracy.
* **Modeling:** Implemented **Average Arm Models (AAM)** to simulate capacitor voltage dynamics without switching-level overhead.
* **Tool:** Developed entirely in **MATLAB/Simulink**.

### 2. Advanced Control Systems
* **Controllers:** Utilized **Proportional-Resonant (PR)** and **Proportional-Integral (PI)** controllers for precise current tracking.
* **Synchronization:** Grid-following synchronization achieved via **Phase-Locked Loop (PLL)**.
* **Balancing:** Implemented active energy balancing algorithms between upper/lower arms and across phases.

### 3. Mathematical Framework
* **Transformations:** Clarke ($$\alpha\beta$$), Park ($$dq$$), and Fortescue transformations used for signal decoupling.
* **Dynamic Modeling:** Full derivation of AC/DC power exchange equations.

---

## 📊 Simulation Highlights & Results

### 1. Active/Reactive Power Tracking
* **Active Power (P):** Achieved **500 MW** reference tracking with **<2% steady-state error**.
* **Reactive Power (Q):** Successfully tracked **400 MVAR** reference commands, validating grid-support capability.

### 2. Capacitor Voltage Stability
* **Balancing:** Maintained balanced upper/lower arm voltages during aggressive P/Q injections.
* **Damping:** Oscillation damping achieved within **0.5 seconds** post-disturbance.

### 3. Energy Balancing
* **Steady State:** Zero energy difference maintained between phases and arms.
* **Transient Response:** Robust recovery from **1 MJ step changes**, with convergence within **1.5 seconds**.

### 4. Grid Synchronization
* PLL-based synchronization locked effectively to the **50 Hz** AC grid.
* Minimal harmonic distortion observed in output current waveforms.

---

## 🚀 Getting Started

### Prerequisites
* MATLAB R2024b or newer (Recommended)
* Simulink
* Simscape Electrical

### How to Run
1. **Clone the repository:**
   ```bash
   git clone [link to repository]