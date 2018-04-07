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
b2_live = 0.5;
a2_live = 0.2;
ka = 0.7;
kb = 0.3;
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
    elseif neighbors(i) == 20
        count(2) = count(2) + 1;
    elseif neighbors(i) == 30
        count(3) = count(3) + 1;
        ep(k,1)=i;
        k=k+1;
    elseif neighbors(i) == 40
        count(4) = count(4) + 1;
    else
        count(5) = count(5) + 1;
    end
end

if (site==10 && (count(5)~=0 || count(4)~=0))|| (site==50 && (count(1) ~= 0 || count(2) ~= 0)) || (site==20 && (count(5)~=0 || count(4)~=0)) || (site==40 && (count(1) ~= 0 || count(2) ~= 0)) || site == 30
    % Change position if no neighbors
    u=rand();
    if site == 10 %&& (count(5) ~=0 || count(4) ~= 0)
% Site is Army B heavy artillery
% If more or equal number of Army B members in neighbors than Army A members: LIVE
% Else: DIE
        if count(1) >= count(5)
            status = 10;
        elseif u < ka
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        end

    elseif site == 20
        
% Site is Army B soldier
% If more Army B heavy artillery in neighbors than Army A heavy artillery: LIVE
% If less Army B heavy artillery in neighbors than Army A heavy artillery: DIE
% If equal in number, look at Army B soldiers and Army A soldiers
% If more Army B soldiers than Army A soldiers: LIVE
% If less Army B soldiers than Army A soldiers: DIE
% If equal in number, with probability b2_live: LIVE

        if count(1) > count(5)
            status = 20;
        elseif count(5) > count(1) && u < ka
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        else
            if count(2) > count(4) 
                status = 20;
            elseif count(4) > count(2) && u < ka
                status = 30;
                emptyPos=[emptyPos;[I,J]];
            else
                u1 = rand();
                if u1 < b2_live
                    status = 20;
                elseif u < ka
                    status = 30;
                    emptyPos=[emptyPos;[I,J]];
                end
            end
        end

    elseif site == 40

% Site is Army A soldier
% If more Army A heavy artillery in neighbors than Army B heavy artillery: LIVE
% If less Army A heavy artillery in neighbors than Army B heavy artillery: DIE
% If equal in number, look at Army B soldiers and Army B soldiers
% If more Army A soldiers than Army B soldiers: LIVE
% If less Army A soldiers than Army B soldiers: DIE
% If equal in number, with probability a2_live: LIVE

        if count(5) > count(1)
            status = 40;
        elseif count(1) > count(5) && u < kb
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        else
            if count(4) > count(2) 
                status = 40;
            elseif count(2) > count(4) && u < kb
                status = 30;
                emptyPos=[emptyPos;[I,J]];
            else
                u1 = rand();
                if u1 < b2_live
                    status = 40;
                elseif u < kb
                    status = 30;
                    emptyPos=[emptyPos;[I,J]];
                end
            end
        end

    elseif site == 50 %&& (count(1) ~=0 || count(2) ~= 0)
        
% Site is Army A heavy artillery
% If more or equal number of Army A members in neighbors than Army B members: LIVE
% Else: DIE
        if count(1) ~= 0 && u < ka
            status = 30;
            emptyPos=[emptyPos;[I,J]];
        end


    else
% Site is Dead
% Remain Dead
% Do not update if updated before while movement
        num_pos=size(emptyPos,1);
        if ~ismember([I, J], emptyPos, 'rows')
                status=-1;
        end
    end
    
else
% If no more enemies, soldiers will move to any of the 9 neighbouring
% squares which may be empty    
   if (site==10 && count(5)==0 && count(4)==0)|| (site==50 && count(1) == 0 && count(2) == 0) || (site==20 && count(5)==0 && count(4)==0)|| (site==40 && count(1) == 0 && count(2) == 0)
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


