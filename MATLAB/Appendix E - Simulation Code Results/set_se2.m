function position_global = set_se2(x, y, yaw)
% SET_SE2
% This function initializes a copter using a Special Euclidian
% Transformation Matrix in two-dimensional space. Easily updatable
% Two three dimensions
 
position_global = [cosd(yaw) -sind(yaw) x; sind(yaw) cosd(yaw) y; 0 0 1];
end