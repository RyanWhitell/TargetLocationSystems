import serial, time, datetime, sys
from xbee import XBee

print 'Time Delay Switch to XBee'
time.sleep(10)
print 'Delay Over'

SERIALPORT = "/dev/ttyUSB0"    # the com/serial port the XBee is connected to
BAUDRATE = 9600      # the baud rate

ser = serial.Serial(SERIALPORT, BAUDRATE)

xbee = XBee(ser)

while True:
    try:
        command = xbee.wait_read_frame()
        if command['rf_data'] == 'PING':
                xbee.send("tx_long_addr", frame_id='\x00', dest_addr='\x00\x13\xA2\x00\x40\xD8\x76\x2E', data='\x50\x49\x4E\x47\x42\x41\x43\x4B')
    except KeyboardInterrupt:
        break

ser.close()