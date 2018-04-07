%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420


function ground = initialize(m, n, deathEatersPos, ARMY_A2Pos, orderPos, studentPos)
% INITBAR return m-by-n bar initialized with all ambient temperatures
% except for hot and cold sites
global DEAD
ground = DEAD * ones(m, n);
ground = applyPosition(ground, deathEatersPos, ARMY_A2Pos, orderPos, studentPos);
