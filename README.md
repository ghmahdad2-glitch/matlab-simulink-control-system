# Closed-Loop Control System – MATLAB & Simulink

## 1. Project Overview

This project demonstrates the modeling, simulation, and analysis of a second-order closed-loop control system using MATLAB and Simulink.

The objective is to investigate the system's dynamic behavior under a unit step input, focusing on stability, overshoot, damping, and settling time.

## 2. Tools and Technologies

- MATLAB
- Simulink
- Transfer Function Modeling
- Feedback Control
- Step Response Analysis

## 3. Mathematical Model

The open-loop transfer function is:

\[
G(s)=\frac{30}{s^2+4s}
\]

The system uses unity negative feedback:

\[
H(s)=1
\]

The resulting closed-loop transfer function is:

\[
T(s)=\frac{G(s)}{1+G(s)H(s)}
=\frac{30}{s^2+4s+30}
\]

The standard second-order transfer function is:

\[
T(s)=\frac{\omega_n^2}{s^2+2\zeta\omega_n s+\omega_n^2}
\]

Comparing coefficients:

- Natural frequency: \(\omega_n=\sqrt{30}\approx5.48\) rad/s
- Damping ratio: \(\zeta=2/\sqrt{30}\approx0.365\)
- System type: Underdamped second-order system

## 4. Simulink Model

The simulation includes:

1. Step Input – generates a unit step reference signal.
2. Sum Block – calculates the difference between the reference and the feedback signal.
3. Transfer Function – represents the dynamic system.
4. Scope – visualizes the system response.
5. To Workspace – exports simulation data for MATLAB analysis.
6. Unity Negative Feedback – feeds the output back to the summing junction.

The simulation time is 10 seconds.

## 5. Simulation Results

![Closed-Loop Step Response](step_response.png)

The step response demonstrates an underdamped system with an initial overshoot followed by decaying oscillations.

### Performance Analysis

| Parameter | Approximate Value |
|---|---|
| Natural Frequency | 5.48 rad/s |
| Damping Ratio | 0.365 |
| Percentage Overshoot | 28.8% |
| Peak Time | 0.62 s |
| Settling Time (2% approximation) | 2.0 s |
| Steady-State Output | 1 |
| Steady-State Error (Unit Step) | 0 |

The overshoot and oscillations occur because the damping ratio is between zero and one.

## 6. Stability Analysis

The characteristic equation is:

\[
s^2+4s+30=0
\]

The poles are:

\[
s_{1,2}=-2\pm j\sqrt{26}
\]

Since both poles have negative real parts, the closed-loop system is asymptotically stable.

The output eventually converges to the reference value.

## 7. Running the Project

1. Open MATLAB with Simulink available.
2. Download the repository files.
3. Open `closed_loop_control.slx` in Simulink.
4. Run the simulation.
5. Open the Scope block to visualize the output.

Alternatively, execute the MATLAB script:

```matlab
create_control_system
```

The script automatically creates the Simulink model, runs the simulation, and exports the step response figure.

## 8. Repository Structure

```text
matlab-simulink-control-system/
├── README.md
├── create_control_system.m
├── closed_loop_control.slx
└── step_response.png
```

## 9. Learning Outcomes

This project demonstrates:

- Modeling dynamic systems with transfer functions
- Designing a unity negative feedback structure
- Simulating dynamic systems using Simulink
- Understanding transient and steady-state behavior
- Analyzing damping ratio and overshoot
- Evaluating closed-loop stability
- Automating model generation using MATLAB scripts

## 10. Project Scope

This is an educational simulation project focused on fundamental control engineering concepts.

The model does not represent a validated industrial control application. The performance values are based on analytical second-order system relationships and approximate calculations.
