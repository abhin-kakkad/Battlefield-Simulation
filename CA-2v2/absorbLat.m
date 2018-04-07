%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420



function extLat = absorbLat(lat)
% ABSORBINGLAT returns extended lattice with absorbing boundary
% conditions

global DEAD
DEAD = 30;

s = size(lat);
row_s = s(2);

t_r = DEAD*ones(1,row_s);
latNS = [t_r; lat; t_r]; % Applying absorbing boundary condition

s = size(latNS);
col_s = s(1);
t_c = DEAD*ones(col_s,1);

extLat = [t_c latNS t_c]; % Applying absorbing boundary condition
