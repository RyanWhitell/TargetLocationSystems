function point = locate_target(A,B,C,T)
% This is the main running algorithm for locating the target. This
% algorithm uses the rssi level readings from each copter to create
% "imaginary" circles (trilateration) and then outputs the point on copter A's circle that
% is closest to both copter B and C's circles. This point should be close
% to the target.
 
global rssi_a rssi_b rssi_c;
 
% Read in the rssi levels (this is a distance in m, in real practice it will
% be an rssi level reading which will have to be converted to m)
rssi_a = get_rssi(A,T);
rssi_b = get_rssi(B,T);
rssi_c = get_rssi(C,T);
rad_a = convert_rssi(rssi_a);
rad_b = convert_rssi(rssi_b);
rad_c = convert_rssi(rssi_c);
 
% Plot the imaginary circles for visualization
plot_circle(A(1,3),A(2,3),rad_a,'A');
plot_circle(B(1,3),B(2,3),rad_b,'B');
plot_circle(C(1,3),C(2,3),rad_c,'C');
 
% Create 1001 plot points
angle=0:(2*pi)/1000:2*pi; 
 
% Initialize the imaginary circles in a 2x10001 matrix
% Each column corresponds to a point (x,y) on the circle
AR = [rad_a*cos(angle)+A(1,3);rad_a*sin(angle)+A(2,3)];
BR = [rad_b*cos(angle)+B(1,3);rad_b*sin(angle)+B(2,3)];
CR = [rad_c*cos(angle)+C(1,3);rad_c*sin(angle)+C(2,3)];
 
% Initialize a large distance for error checking
distance = 1000;
 
% Iterate around every circle and check if the total distance between
% points is a minimum
for i = 1:7:1001
    for j = 1:7:1001
        for k = 1:7:1001
             new_distance = sqrt((AR(1,i)-BR(1,j))^2+...
            (AR(2,i)-BR(2,j))^2) + sqrt((BR(1,j)-CR(1,k))^2+...
            (BR(2,j)-CR(2,k))^2) + sqrt((AR(1,i)-CR(1,k))^2+...
            (AR(2,i)-CR(2,k))^2);
            if new_distance < distance
                distance = new_distance;
                point = [AR(1,i);AR(2,i)];
            end
        end
    end
end 
 
if distance == 1000
        fprintf('Too much error, optimize and re-try\n');
        return   
end
 
% Plot a black diamond at the point
global BLACKDIAMOND;
delete(BLACKDIAMOND);
BLACKDIAMOND = plot(point(1),point(2),'kd');
end