%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420


function ground = applyPosition(ground, ARMY_A1Pos, ARMY_A2Pos, ARMY_B1Pos, ARMY_B2Pos)

for k = 1:size(ARMY_A1Pos, 1)
    ground(ARMY_A1Pos(k, 1), ARMY_A1Pos(k, 2)) = ARMY_A1;
end;

for k = 1:size(ARMY_A2Pos, 1)
    ground(ARMY_A2Pos(k, 1), ARMY_A2Pos(k, 2)) = ARMY_A2;
end;

for k = 1:size(ARMY_B1Pos, 1)
    ground(ARMY_B1Pos(k, 1), ARMY_B1Pos(k, 2)) = ARMY_B1;
end;

for k = 1:size(ARMY_B2Pos, 1)
    ground(ARMY_B2Pos(k, 1), ARMY_B2Pos(k, 2)) = ARMY_B2;
end;
