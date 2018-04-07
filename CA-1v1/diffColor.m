%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420

function M = diffColor(grids, t)
% Function to return color movie visualization 

lengthGrids =t ;
disp(lengthGrids);
M = moviein(lengthGrids); % Number of frames of the movie is equal to the number of time-steps

m = size(grids, 1);
n = size(grids, 2);
disp('Size of the grid');
disp(m);
disp(n);

for k = 1:lengthGrids
    g = grids(:, :, k);
    image(g + 1)
    colormap(jet);

    axis([0 m 0 n]);
    axis equal;
    axis off;
    M(k) = getframe;
    pause(0.1);
end;

