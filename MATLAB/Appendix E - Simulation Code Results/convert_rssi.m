function distance = convert_rssi(rssi)
% This function uses the distance equation to estimate the distance
% corresponding to the given RSSI reading

distance = 10.^((rssi-43)/18);
end