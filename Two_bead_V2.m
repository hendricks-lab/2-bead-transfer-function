% Ben G. 2023 
% Simulation of 2 bead transfer function.
% System description: 1st bead linked to trap 1 via constant stiffness and
% to bead 2 via constant stiffness and viscous component. Bead 2 is linked
% to a second trap in this assumption. Both beads are linked to the
% surrounding medium under the asumption that long range cytoplasmic
% elasticity and viscosity differ from close range interactions. 

% we are going to be looking to have stifness values on the scale of pN/nm
% and viscosities in the s/nm range.

% need to adjust the scalling of these parameters
K_1 = 0.1; % trap stifness 1 (pN/nm)
K_2 = 0.1; % trap stifness 2 (pN/nm)
K_C = 0.0001; % solution close range elastic component
K_C_L = 0.00005; % long range elastic component

% the viscosity of cell like material/cytoplasm has be documented on the
% scale of 1-100 Pa*s. Pa*s is on the scale of 10E-6 pN*s/nm^2
C_C = 0.00001; % close range solution viscosity  (pasca/s)
C_C_L = 0.00001; % long range solution viscosity

%sys_H11 = tf([(0) (C_C_L + C_C) (K_2+K_C_L)],[((C_C_L^2) + (2*C_C_L*C_C)) ((K_1*C_C_L) + (K_1*C_C) + (K_2*C_C_L) + (K_2*C_C) + (2*C_C_L*K_C_L) - (2*C_C*K_C) + (2*C_C*K_C_L)) ((K_1*K_2) - (K_C^2) + (K_C_L)^2 + (K_2*K_C_L))]); % defininin the X1/F1 transfer function%s = logspace(0,4,30);
%s = logspace(0,4,20);
%h = bodeplot(sys_H11,s); 
%setoptions(h,'FreqUnits','Hz','PhaseVisible','on');
%legend();
%hold on

sys_H21 = tf([(0) (C_C) (K_C)],[((C_C_L^2) + (2*C_C_L*C_C)) ((K_1*C_C_L) + (K_1*C_C) + (K_2*C_C_L) + (K_2*C_C) + (2*C_C_L*K_C_L) - (2*C_C*K_C) + (2*C_C*K_C_L)) ((K_1*K_2) - (K_C^2) + (K_C_L)^2 + (K_2*K_C_L))]); % defininin the X2/F1 transfer function
s = logspace(0,4,20);
h = bodeplot(sys_H21,s); 
setoptions(h,'FreqUnits','Hz','PhaseVisible','on');
hold on

%NOTE --> the transfer functions work! need to play with the parameter
% scalling fo it to make more sense. Not quite sure what valuesI should be
% using or if it's just relative size that matters.


%[((C_C_L^2) + (2*C_C_L*C_C)) ((K_1*C_C_L) + (K_1*C_C) + (K_2*C_C_L) +
%(K_2*C_C) + (2*C_C_L*K_C_L) - (2*C_C*K_C) + (2*C_C*K_C_L)) ((K_1*K_2) -
%(K_C^2) + (K_C_L)^2 + (K_2*K_C_L))]; denominator of TF

% [(0) (C_C_L + C_C) (K_2+K_C_L)]; H11 numerator

%[(0) (C_C) (K_C)], H21 numerator












