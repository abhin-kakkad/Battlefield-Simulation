%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420

function newLat = applyDiffExt(value)
m = size(value, 1) - 2;
n = size(value, 2) - 2;
newLat = zeros(m, n);    
for j = 2:(n + 1)
    for i = 2:(m + 1)
        site = value(i, j);
        N = value(i - 1, j);
        NE = value(i - 1, j + 1);
        E = value(i, j + 1);
        SE = value(i + 1, j + 1);
        S = value(i + 1, j);
        SW = value(i + 1, j - 1);
        W = value(i, j - 1);
        NW = value(i - 1, j - 1);
         [status,x_i,y_j] = weightedDiff(site, N, NE, E, SE, S, SW, W, NW, i-1, j-1);
       
         if status ~= -1
             newLat(i - 1, j - 1)=status;
         end
        if x_i~=-1 && y_j ~=-1
            newLat(x_i, y_j)=site;
       end
    end;
end;
