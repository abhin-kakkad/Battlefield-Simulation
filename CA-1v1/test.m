%BATTLE GROUND SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420


% testDiffusion.m

global ARMY_A ARMY_B DEAD
ARMY_B = 10;
DEAD = 30;
ARMY_A = 50;

m=60;
n=60;

%Initialize the battle conditions
armyAPos = [];
armyBPos = [];
global emptyPos;
emptyPos=[];

for i = 1:m
    for j = 1:n
            u = rand();
         if u < 800/2500
             armyAPos = [armyAPos; [i, j]];
         elseif u < 1200/2500
             armyBPos = [armyBPos; [i, j]];
        else
           emptyPos = [emptyPos; [i, j]];
         end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
t = 30;

grids = diffSim(m, n, armyAPos, armyBPos, emptyPos, t);

M = diffColor(grids,t);
title('Battle Field')
xlabel('t = 25')
