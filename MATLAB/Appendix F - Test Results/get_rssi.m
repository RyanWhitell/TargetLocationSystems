function get_rssi()
% This function propts the user for the RSSI value
 
global rssi_a rssi_b rssi_c;
prompt = 'RSSI A: ';
rssi_a = input(prompt);
prompt = 'RSSI B: ';
rssi_b =  input(prompt);
prompt = 'RSSI C: ';
rssi_c =  input(prompt);
end
