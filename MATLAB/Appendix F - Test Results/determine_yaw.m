function yaw = determine_yaw(midpoint,point)
%  This function determines the rotation angle corresponding to the
%  midpoint of the formation (first argument) and the point 
%  generated from the LOCATE_TARGET
%  algorithm (or any (x,y) point as the second argument).
 
x = midpoint(1);
y = midpoint(2);
a = point(1);
b = point(2);
 
if x == a
    if y > b
        yaw = 270;
    else 
        yaw = 90;
    end
elseif b == y
    if x > a
        yaw = 180;
    else
        yaw = 0;
    end
else
    yaw = atand(abs((y-b)/(x-a)));
    if a<x && b>y
        yaw = (90-yaw)*2 + yaw;
    elseif a<x && b<y
        yaw = 180 + yaw;
    elseif a>x && b<y
        yaw = 360 - yaw;
    end
end
end
