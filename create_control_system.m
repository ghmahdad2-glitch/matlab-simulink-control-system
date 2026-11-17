%% Closed-loop control system project (MATLAB / Simulink)
% Reconstructed educational example inspired by an earlier university exercise.
% Plant: G(s) = 30 / (s^2 + 4s), unity negative feedback.
% Run this script in MATLAB Online with Simulink access.
% It creates and saves closed_loop_control.slx, runs a simulation,
% and saves the step response figure as step_response.png.

clearvars; clc;

model = 'closed_loop_control';
if ~license('test', 'Simulink')
    error('Simulink is not available for this MathWorks account.');
end
if bdIsLoaded(model)
    close_system(model, 0);
end
new_system(model);
open_system(model);

% Blocks
add_block('simulink/Sources/Step', [model '/Step'], ...
    'Position', [65 120 95 150], 'Time', '0', 'Before', '0', 'After', '1');
add_block('simulink/Math Operations/Sum', [model '/Error'], ...
    'Position', [155 118 180 152], 'Inputs', '+-');
add_block('simulink/Continuous/Transfer Fcn', [model '/Plant G(s)'], ...
    'Position', [245 115 370 155], 'Numerator', '[30]', ...
    'Denominator', '[1 4 0]');
add_block('simulink/Sinks/Scope', [model '/Scope'], ...
    'Position', [465 112 495 142]);
add_block('simulink/Sinks/To Workspace', [model '/Response'], ...
    'Position', [455 170 550 205], 'VariableName', 'yout_data', ...
    'SaveFormat', 'Timeseries');

% Wiring: unity negative feedback
add_line(model, 'Step/1', 'Error/1', 'autorouting', 'on');
add_line(model, 'Error/1', 'Plant G(s)/1', 'autorouting', 'on');
add_line(model, 'Plant G(s)/1', 'Scope/1', 'autorouting', 'on');
add_line(model, 'Plant G(s)/1', 'Response/1', 'autorouting', 'on');
add_line(model, 'Plant G(s)/1', 'Error/2', 'autorouting', 'on');

set_param(model, 'StopTime', '10', 'Solver', 'ode45');
save_system(model, [model '.slx']);

% Simulation and plot
simOut = sim(model);
y = simOut.get('yout_data');
figure('Color', 'w');
plot(y.Time, y.Data, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)'); ylabel('Output y(t)');
title('Unity-Feedback Closed-Loop Step Response');
exportgraphics(gcf, 'step_response.png', 'Resolution', 180);

disp('Created: closed_loop_control.slx and step_response.png');
