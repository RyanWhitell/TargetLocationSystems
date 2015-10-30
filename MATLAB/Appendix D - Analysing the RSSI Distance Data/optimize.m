function n = optimize()
% This function determines the appropriate n value corresponding to the
% least amount of error

%Data
rssi = [31 42 47 52 50 58 53 52 55 62 59 60 61 61 60 60 59 59 60 62 61 62 62 65 63 64 62 63 64 64 66 65 65 67 69 67 68 67 67 71 72 72 72 73 74 70 76 73 69 74 70 74 71 77 71 73 74 75 77 72 75 74 74 77 74 74 74 75 73 76 75];
yards= [00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 70 73 78];

meters = yards*0.9144;
dist = 10.^((rssi-43)/41);
old_error = sum(abs(dist - meters));
for x = 0:0.1:4
    dist = 10.^((rssi-43)/(10*x));
    new_error = sum(abs(dist - meters));
    if new_error < old_error
        old_error = new_error;
        n = x;
    end
end