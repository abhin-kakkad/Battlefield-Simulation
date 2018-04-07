%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420


function [grids,i] = diffSim(m, n, ARMY_A1Pos, ARMY_A2Pos, ARMY_B1Pos, ARMY_B2Pos, emptyPos, t)
% DIFFUSIONSIM Diffusion simulation
%Stores all the grids for different time-steps from 1 to t
global ARMY_A1 ARMY_A2 ARMY_B1 ARMY_B2 DEAD
ARMY_B1 = 10;
ARMY_B2 = 20;
DEAD = 30;
ARMY_A2 = 40;
ARMY_A1 = 50;

%%% Initialize grid
ground = initialize(m, n, ARMY_A1Pos, ARMY_A2Pos, ARMY_B1Pos, ARMY_B2Pos);

%%% Perform simulation
grids = zeros(m, n, t + 1);
grids(:, :, 1) = ground;
for i = 2:(t + 1)
    % Extend matrix at each time-step
    groundExtended = absorbLat(ground);
    % Apply spread of heat function to each grid point
    ground = applyDiffExt(groundExtended); %Applying diffusion
    % Save new matrix
    grids(:, :, i) = ground;
end;
