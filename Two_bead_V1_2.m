% Ben G. 2023 
% Simulation of 2 bead transfer function.
% System description: 1st bead linked to trap 1 via constant stiffness and
% to bead 2 via constant stiffness and viscous component. Bead 2 is linked
% to a second trap in this assumption. Neither bead is linked to the
% surrounding medium. 

% need to adjust the scalling of these parameters
K = 1; % trap stifness 1
K_2 = 1; % trap stifness 2
K_C = 0.1; % solution stifness
C = 1; % solution damping

sys_H11 = tf([0 C (K_C + K_2)],[0 (C*(K + K_2)) ((K*K_C)+(K*K_2))]); % defininin the X1/F1 transfer function
s = logspace(0,3,20);
h = bodeplot(sys_H11,s); 
setoptions(h,'FreqUnits','Hz','PhaseVisible','on');
legend();
hold on

sys_H21 = tf([0 C K_C],[0 (C*(K + K_2)) ((K*K_C)+(K*K_2))]); % defininin the X1/F1 transfer function
s = logspace(0,3,20);
h = bodeplot(sys_H21,s); 
setoptions(h,'FreqUnits','Hz','PhaseVisible','on');

%NOTE --> the transfer functions work! need to play with the parameter
% scalling fo it to make more sense. Not quite sure what valuesI should be
% using or if it's just relative size that matters.