# MatlabMobileRealTime
Read sensor data of Matlab Mobile

Plots acceleration data (X,Y,Z) of Matlab Mobile in real time (sort of).

## Requirements:
1. Get MATLAB Support Package for Android or iOS:

  http://de.mathworks.com/products/matlab-mobile/features.html#acquiring_data_from_sensors

2. The following lines need to be run in MATLAB beforehand.
Doesn't work in a function for some weird reason..

```MATLAB
  m = mobiledev;
  m.AccelerationSensorEnabled = 1;
  m.Logging = 1;
```
