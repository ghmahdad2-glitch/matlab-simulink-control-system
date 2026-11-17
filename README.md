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
