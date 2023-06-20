% Ben G. 2023
% assuming a single degree of freedom system where the first bead is
% completely coupled to the trap position. We can therefor assum its
% position as following the sinusoidal oscillation. This collapsed the
% second degree of freedom making it much easier to model the response of
% the second bead.

% This assumption is made considering the trap stifness linking the first
% bead to the trap is much higher than the stifness of the medium. We can
% assumed its deviation from the center is neglieable - this simplifies the
% model. 

K = 0.1; % (pN/nm) % trap 2 stifness, might actually be lower than this given the power of the trap. Fit the y - PSD to find a better approximation
Kc = 0.0001;% (pN/nm)  % assumed to be small in PEG solutions
Kl = 0.0001;% (pN/nm) % assumed to be small in PEG solutions
a = 0.5; % (nm) bead radius
viscosity_close = 0.001; % (pascal/s or pN*s/nm^2)
viscosity_long = 0.0001;
Dc = 6*(pi)*a*viscosity_close; % drag coefficient governed by close range viscosty
Dl =  6*(pi)*a*viscosity_long; % drag coefficient governed by long range viscosty

i= 1;

% plots the frequency response for a 50% change in close range viscosity
% value - does this for 10 iterations.
while i < 10
    sys_bead2 = tf([(0) (Dc) (Kc)],[(0) (Dc- Dl) (Kc + Kl + K)]); % defininin the X1/F1 transfer function%s = logspace(0,4,30);
    s = logspace(-2,4,20);
    h = bodeplot(sys_bead2,s); 
    setoptions(h,'FreqUnits','Hz','PhaseVisible','on');
    %legend();
    hold on 

    i = i + 1;
    Kl = 1.5*Kl; % (pascal/s or pN*s/nm^2)
end

% numerator of transfer function

%   [(0) (Dc) (Kc)]

% denominator of transfer function

%   [(0) (Dc- Dl) (Kc + Kl + K)]