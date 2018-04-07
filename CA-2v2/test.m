%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420

% testDiffusion.m

global ARMY_A1 ARMY_A2 ARMY_B1 ARMY_B2 DEAD
ARMY_B1 = 10;
ARMY_B2 = 20;
DEAD = 30;
ARMY_A2 = 40;
ARMY_A1 = 50;

m=60;
n=60;

%Initialize conditions
ARMY_A1Pos = [];
ARMY_A2Pos = [];
ARMY_B1Pos = [];
ARMY_B2Pos = [];
global emptyPos;
emptyPos=[];

for i = 1:m
    for j = 1:n
            u = rand();
         if u < 150/2150
             ARMY_A1Pos = [ARMY_A1Pos; [i, j]];
         elseif u < 350/2150
             ARMY_B1Pos = [ARMY_B1Pos; [i, j]];
        elseif u < 950/2150
            ARMY_A2Pos = [ARMY_A2Pos; [i, j]];
        elseif u < 1550/2150
            ARMY_B2Pos = [ARMY_B2Pos; [i, j]];
        else
           emptyPos = [emptyPos; [i, j]];
         end
    end
end

%====================================


t = 50;

grids = diffSim(m, n, ARMY_A1Pos, ARMY_A2Pos, ARMY_B1Pos, ARMY_B2Pos, emptyPos, t);

M = diffColor(grids,t)
title('Battle Field')
xlabel('t = 25')
