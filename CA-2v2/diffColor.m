%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420


function M = diffColor(grids, t)
% ANIMDIFFUSIONCOLOR - Function to return color movie visualization
% of grids in grids
global ARMY_A1 ARMY_A2 ARMY_B1 ARMY_B2 DEAD
lengthGrids =t ;
%lengthGrids = size(grids, 3);
disp(lengthGrids);
M = moviein(lengthGrids); % Number of frames of the movie is equal to the number of time-steps

m = size(grids, 1);
n = size(grids, 2);
disp('Size of the grid');
disp(m);
disp(n);

for k = 1:lengthGrids
    g = grids(:, :, k);
    image(g + 1) %understand how the mapping takes place between image and colormap and the role of moviein
    colormap(jet);

    axis([0 m 0 n]);
    axis equal;
    axis off;
    M(k) = getframe;
    pause(0.25);
end;
