%BATTLE GROUND SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420

function ground = applyPosition(ground, armyAPos, armyBPos)
global ARMY_A ARMY_B

for k = 1:size(armyAPos, 1)
    ground(armyAPos(k, 1), armyAPos(k, 2)) = ARMY_A;
end;

for k = 1:size(armyBPos, 1)
    ground(armyBPos(k, 1), armyBPos(k, 2)) = ARMY_B;
end;
