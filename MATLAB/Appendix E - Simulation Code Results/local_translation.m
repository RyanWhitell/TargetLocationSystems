function new_position_global = local_translation(position_global,identifier,x,y)
% This function takes as its input arguments a copter, a string
% identifying which copter it is (A,B,C) and an x and y translation value.
% This function translates the copter by concatenating matrices
 
new_position_global = position_global*[1 0 x;0 1 y;0 0 1];
 
plot_position(new_position_global,identifier);
end