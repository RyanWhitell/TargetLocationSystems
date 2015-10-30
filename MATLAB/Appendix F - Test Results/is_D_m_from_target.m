function within = is_D_m_from_target(current)
% This function determines if any of the quad copters are "D" meters from the
% target and returns the distance.
 
global rssi_a rssi_b rssi_c;
 
within = Inf;
 
if current > 10
    if (rssi_a < 62)
        fprintf('Copter A is within 10 meters from the target \n')
        within = 10;
    end
    if (rssi_b < 62)
        fprintf('Copter B is within 10 meters from the target \n')
        within = 10;
    end
    if (rssi_c < 62)
        fprintf('Copter C is within 10 meters from the target \n')
        within = 10;
    end
elseif current > 5
    if (rssi_a < 56)
        fprintf('Copter A is within 5 meters from the target \n')
        within = 5;
    end
    if (rssi_b < 56)
        fprintf('Copter B is within 5 meters from the target \n')
        within = 5;
    end
    if (rssi_c < 56)
        fprintf('Copter C is within 5 meters from the target \n')
        within = 5;
    end
else
    if (rssi_a < 52)
        fprintf('Copter A is within 3 meters from the target, success! \n')
        within = 3;
    end
    if (rssi_b < 52)
        fprintf('Copter B is within 3 meters from the target, success! \n')
        within = 3;
    end
    if (rssi_c < 52)
        fprintf('Copter C is within 3 meters from the target, success! \n')
        within = 3;
    end
end
end
