function midpoint = determine_midpoint(A,B,C)
% This function determines the midpoint of the formation and plots it
% as a black dot
 
dist_ab = sqrt((A(1,3)-B(1,3))^2+(A(2,3)-B(2,3))^2);
y = (1/sqrt(3))*(dist_ab/2);
midpoint = [A(1,3)+(dist_ab/2);A(2,3)+y;1];
 
plot(midpoint(1),midpoint(2),'k.')
end
