function reduce_formation_size(CA,CB,CC)
% This function reduces the formation size by a factor of 15%
 
global A B C rssi_a rssi_b rssi_c;
 
A = set_rotation(A, 0);
B = set_rotation(B, 180);
C = set_rotation(C, 270);
 
percentage = 0.15;
 
factor = 1 - (percentage*2);
dist_ab = sqrt((CA(1,3)-CB(1,3))^2+(CA(2,3)-CB(2,3))^2);
dist = dist_ab*percentage;
distc = abs(CA(2,3)-CC(2,3)) - sqrt((factor*dist_ab)^2-(factor*...
    dist_ab/2)^2);
 
fprintf('Reduce Formation Size \n');
 
A = local_translation(A,'A',dist,0);
B = local_translation(B,'B',dist,0);
C = local_translation(C,'C',distc,0);
end