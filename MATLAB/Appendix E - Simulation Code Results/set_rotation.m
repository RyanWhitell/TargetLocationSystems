function new_position_global = set_rotation(position_global,yaw)
% This function sets the rotation of the copter that is passed in as an
% argument in the Special Euclidian Matrix
 
new_position_global = [cosd(yaw) -sind(yaw)...
    position_global(1,3); sind(yaw) cosd(yaw)...
    position_global(2,3); 0 0 1];
end