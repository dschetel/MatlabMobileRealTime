% Plots acceleration data (X,Y,Z) of Matlab Mobile in real time.
% Requirements:
% Get MATLAB Support Package for Android or iOS:
%   http://de.mathworks.com/products/matlab-mobile/features.html#acquiring_data_from_sensors
%
% The following lines need to be run in MATLAB beforehand.
% Doesn't work in a function for some weird reason..
  % m = mobiledev;
  % m.AccelerationSensorEnabled = 1;
  % m.Logging = 1;


% Initialize data
slidingX = zeros(1,300);
slidingY = zeros(1,300);
slidingZ = zeros(1,300);

% Initialize length of data
prevSize = 1;

% Initialize figure
p = figure;

% Loop runs forever - except figure is selected
while true
  % Read data
  data = m.accellog;
    % Check if data variable exists and is not empty
    if(exist('data','var')&&~isempty(data))

      % Read acceleration data
      accelX = data(:,1);
      accelY = data(:,2);
      accelZ = data(:,3);

      % Update data
      CurrentX = accelX(prevSize+1:length(data));
      CurrentY = accelY(prevSize+1:length(data));
      CurrentZ = accelZ(prevSize+1:length(data));

      % Eliminate old data
      slidingX = [slidingX(length(CurrentX)+1:length(slidingX)) CurrentX'];
      slidingY = [slidingY(length(CurrentY)+1:length(slidingY)) CurrentY'];
      slidingZ = [slidingZ(length(CurrentZ)+1:length(slidingZ)) CurrentZ'];

      % Look at pretty plots
      figure(p)
      plot(slidingX);
      hold on
      plot(slidingY);
      plot(slidingZ);
      title('Click figure to end loop')
      legend('X-Accel.', 'Y-Accel.', 'Z-Accel.')
      xlabel('Time')
      ylabel('[Acceleration m/s^2]')
      ylim([-20 20])
      xlim([0 300])
      drawnow
      hold off

      % Update last know data point
      prevSize = length(data);

      % Break loop if figure is selected
      if gco ~= p
       break;
      end

    end % end conditional
end % end loop
