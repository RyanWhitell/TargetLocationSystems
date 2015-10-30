import serial, time, datetime, sys
from xbee import XBee
import numpy as np

print 'Time Delay Switch to XBee'
time.sleep(10)
print 'Delay Over'

SERIALPORT = "/dev/ttyUSB0"    # the com/serial port the XBee is connected to
BAUDRATE = 9600      # the baud rate we talk to the xbee

ser = serial.Serial(SERIALPORT, BAUDRATE)

xbee = XBee(ser)

while True:
        try:
                command = xbee.wait_read_frame()
                total = np.array([],int)
                if command['rf_data'] == 'GETRSSI':
                        for x in range(0,50):
                                xbee.send("tx_long_addr", frame_id='\x00', dest_addr='\x00\x13\xA2\x00\x40\xDC\x0D\x78', data='\x50\x49\x4E\x47\x41')
                                frame = xbee.wait_read_frame()
                                rssi_ASCII = frame['rssi']
                                rssi_int = ord(rssi_ASCII)
                                total = np.append(total,rssi_int)
                                avg_rssi = str(int(np.mean(total)))
				time.sleep(0.2)
                        xbee.send("tx_long_addr", frame_id='\x00', dest_addr='\x00\x13\xA2\x00\x40\xE2\xD0\xAA', data=avg_rssi)
        except KeyboardInterrupt:
                break

ser.close()