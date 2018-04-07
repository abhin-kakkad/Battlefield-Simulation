%BATTLE FIELD SIMULATION
%CS-302 Modeling and Simulation
%
%Abhin Kakkad : 201501419
%Manthan Mehta : 201501420


function [status,x_i,y_j] = weightedDiff(site, N, NE, E, SE, S, SW, W, NW, I, J)
% Diffusion
x_i=-1;
y_j=-1;
final=-1;

global emptyPos;
count = zeros(1, 5);
kb = 0.5;
ka = 0.3;
status = site;
neighbors = [N, NE, E, SE, S, SW, W, NW];
rx=I+1;
ry=J+1;
xpos = [rx-1,rx-1,rx,rx+1,rx+1,rx+1,rx,rx-1];
ypos = [ry,ry+1,ry+1,ry+1,ry,ry-1,ry-1,ry-1];
ep=[];
k=1;
for i = 1:length(neighbors)
% Count number of each type of neighbor
    if neighbors(i) == 10
        count(1) = count(1) + 1;
    elseif neighbors(i) == 30
        count(3) = count(3) + 1;
        ep(k,1)=i;
        k=k+1;
    else
        count(5) = count(5) + 1;
    end
end

if (site==10 && (count(5)~=0)|| (site==50 && (count(1) ~= 0 ) || site == 30))
    % Change position if no neighbors
    u=rand();
    if site == 10 && (count(5) ~=0)
% Site is Army B soldier
% If more or equal number of Army B soldiers in neighbors than Army A soldier: LIVE
% Else: DIE
        if count(1) >= count(5)
            status = 10;
        elseif u >= ka
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        end

    
    elseif site == 50 && (count(1) ~=0)
% Site is Army A soldier
% If more or equal number of Army A soldiers in neighbors than Army B soldier: LIVE
% Else: DIE

        if count(5) >= count(1)
            status = 50;
        elseif u >= kb
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        end

    else
% Site is Dead
% Remain Dead
% Do not update if updated before while moving
        num_pos=size(emptyPos,1);
        if ~ismember([I, J], emptyPos, 'rows')
                status=-1;
        end
    end
    else
% If no more enemies, soldiers will move to any of the 9 neighbouring
% squares which may be empty
    if (site==10 && count(5)==0) || (site==50 && count(1) == 0)
          m_size=size(ep,1);
          x1=randi(m_size);
          pos=ep(x1,1);
          x_i1=xpos(pos);
          y_j1=ypos(pos);
          if x_i1 == 0
              x_i1=60;
          end
          
          if y_j1 == 0
              y_j1=60;
          end
          
          if x_i1>60
              x_i1=x_i1-60;
          end
          
          if y_j1>60
              y_j1=y_j1-60;
          end
          for j=1:size(emptyPos,1)
              if (emptyPos(j,1)== x_i1 && emptyPos(j,2)==y_j1)
                  final = j;
              end
          end
          if final == -1
              final = 1;
          end
          x_i=emptyPos(final,1);
          y_j=emptyPos(final,2);
          emptyPos(final,1)=I;
          emptyPos(final,2)=J;
          status=30;
   end
end


