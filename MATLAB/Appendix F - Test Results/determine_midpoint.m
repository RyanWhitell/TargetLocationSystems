function midpoint = determine_midpoint(A,B,C)
% This function determins the midpoint of the formation
 
dist_ab = sqrt((A(1,3)-B(1,3))^2+(A(2,3)-B(2,3))^2);
y = (1/sqrt(3))*(dist_ab/2);
midpoint = [A(1,3)+(dist_ab/2);A(2,3)+y;1];
end
