function advance(CA,CB,CC,CT,x)
% This function predicts the target location using the 
% locate target function and advances the midpoint of the formation 
% towards the predicted location
 
global A B C rssi_a rssi_b rssi_c;
 
point = locate_target(CA,CB,CC,CT);
 
mid = determine_midpoint(CA,CB,CC);
yaw = determine_yaw(mid,point);
 
A = set_rotation(CA, yaw);
B = set_rotation(CB, yaw);
C = set_rotation(CC, yaw);

% Pause for visualization
k = waitforbuttonpress;
 
A = local_translation(A,'A',x,0);
B = local_translation(B,'B',x,0);
C = local_translation(C,'C',x,0);
end