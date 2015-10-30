function advance(CA,CB,CC,x)
% This function predicts the target location using the 
% locate target function and advances the midpoint of the formation 
% towards the predicted location
 
global A B C rssi_a rssi_b rssi_c;
 
old_a = A;
old_b = B;
old_c = C;
 
point = locate_target(CA,CB,CC);
 
mid = determine_midpoint(CA,CB,CC);
yaw = determine_yaw(mid,point);
 
A = set_rotation(CA, yaw);
B = set_rotation(CB, yaw);
C = set_rotation(CC, yaw);
 
A = local_translation(A,'A',x,0);
B = local_translation(B,'B',x,0);
C = local_translation(C,'C',x,0);
 
hyp_a = sqrt((old_a(1,3)-A(1,3))^2+(old_a(2,3)-A(2,3))^2);
AX = cosd(yaw)*hyp_a;
AY = sind(yaw)*hyp_a;
fprintf('Translate Locations: (%d,%d)\n', AX, AY);
end
