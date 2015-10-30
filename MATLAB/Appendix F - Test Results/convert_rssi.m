function distance = convert_rssi(rssi)
% This function uses the lod-distance eqaution to estimate the distance
% cooresponding to the given RSSI reading
 
distance = 10.^((rssi-43)/18);
end
