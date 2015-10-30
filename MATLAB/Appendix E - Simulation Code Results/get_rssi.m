function rssi = get_rssi(copter, target)
% This function uses the data from the RSSI/Distance test to 
% Return the RSSI value closest to the distance
% This simulates the readings that might be obtained from the full scale
% Test
 
% Data Model
rssi_measured = [31 42 43 47 52 50 58 53 52 55 62 59 60 61 61 60 60 59 59 60 62 61 62 62 65 63 64 62 63 64 64 66 65 65 67 69 67 68 67 67 71 72 72 72 73 74 70 76 73 69 74 70 74 71 77 71 73 74 75 77 72 75 74 74 77 74 74 74 75 73 76 75];
yards= [00 01 1.09361 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 70 73 78];
 
distance = sqrt((copter(1,3)-target(1))^2 + (copter(2,3)-target(2))^2);
meters = yards*0.9144;
diff = abs(distance - meters(1));
 
for x = 2:71
    new_diff = abs(distance - meters(x));
    if new_diff < diff
        diff = new_diff;
        rssi = rssi_measured(x);
    end
end
end