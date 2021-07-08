# RpiUsbSwitch
Switch the power of a active Usb hub over the Rpi4

1. connect the relay to your Rpi, you find many connecting diagram with google. in my case i use the GPIO pin 16 to control the relay
2. cut the power of the power adapter to th hub and control this with the relay.
3. copy the script maza_exthd.sh to your location and install the service maza_exthd.service and modify the paths to the script

after all, the power of the external USB hub will switch off and on reboot it will be switch on. This prevent the RPI4 to hang on boot up.


maza_exthd.sh
This script uses the http://wiringpi.com/ gpio controll program
