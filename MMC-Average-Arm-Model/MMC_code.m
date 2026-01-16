clear all; clc; close all;

%% Load MMC parameters
S_1      = 1000e6;                        % [VA] rated power
U_ll1    = 320e3;                         % [V_rms] line-line
U_pnpeak1= U_ll1*sqrt(2)/sqrt(3);         % [V_peak] phase-neutral
U_pnrms1 = U_ll1/sqrt(3);                 % [V_rms] phase-neutral
f_grid   = 50;                            % [Hz]
w0       = 2*pi*f_grid;                   % [rad/s]
Vpeak_d1 = U_pnpeak1;
Vpeak_i1 = Vpeak_d1;
psi_Vi1  = 0;
Vdc      = 640e3;                         % [V]
Ibase1   = S_1/U_ll1/sqrt(3);             % [A_rms]
vb       = 320e3;                         % [V]

Zbase_1  = U_ll1^2/S_1;                   % [Ohm]
Rg_1     = 0.005*Zbase_1;                 % [Ohm] grid eq. R
Lg_1     = 0.18*Zbase_1/(2*pi*50);        % [H]   grid eq. L
Ra_1     = 0.01*Zbase_1;                  % [Ohm] arm R
La_1     = 0.15*Zbase_1/(2*pi*50);        % [H]   arm L

Leq      = Lg_1 + La_1/2;                 % [H]   series eq. L
Req      = Rg_1 + Ra_1/2;                 % [Ohm] series eq. R

Cap      = 9.5e-3;                        % [F] per SM
N        = 400;                           % [#]  submodules/arm (assumed)
Carm     = Cap/N;                         % [F] equivalent per SM in an arm
ArmVoltageRef = 640e3;                    % [V]

%% AC grid current control design
s=tf('s');
G_iac = 1/((Lg_1+La_1/2)*s+(Rg_1+Ra_1/2));                   %Plant definition
ts_G_iac = 10e-3;                                           %Desired settling time parameter

%% AC power loop control design
ts_G_P = 25e-3;                                           %Desired settling time parameter
tau_Pac=ts_G_P/4;

ts_G_Q = 25e-3;                                           %Desired settling time parameter
tau_Qac=ts_G_Q/4;


%% Circulating current control design
s=tf('s');
% PI
G_isum = 1/((2*La_1)*s+(2*Ra_1));            %Plant definition
ts_G_isum = 1e-3;                           %Desired settling time parameter

% PR
wc = 2*pi*5;                                 %cut-off frequency for PR