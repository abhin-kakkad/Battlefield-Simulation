%BATTLE GROUND SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420

function [grids,i] = diffSim(m, n, armyAPos, armyBPos, emptyPos, t)
% Diffusion simulation
global ARMY_A ARMY_B DEAD
ARMY_B = 10;
DEAD = 30;
ARMY_A = 50;

% Initialize grid
ground = initialize(m, n, armyAPos, armyBPos);

% Simulation
grids = zeros(m, n, t + 1);
grids(:, :, 1) = ground;
for i = 2:(t + 1)
    % Extend matrix at each time-step
    groundExtended = absorbLat(ground);
    % Spread of heat function to each point in grid
    % Applying diffusion
    ground = applyDiffExt(groundExtended); 
    % Save new matrix
    grids(:, :, i) = ground;
end;
