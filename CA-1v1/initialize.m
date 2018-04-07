%BATTLE GROUND SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420

function ground = initialize(m, n, armyAPos, armyBPos)

global DEAD
ground = DEAD * ones(m, n);
ground = applyPosition(ground, armyAPos, armyBPos);
