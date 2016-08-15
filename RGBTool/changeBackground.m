function changeBackground(hObject, red, green, blue)
% changeBackground(hObject, rgbArray) changes the background color 
%   of an object passed through hObject
%   while the background color is specified by the 
%   corresponding names red, green, blue values
%
%       Author: Mojolagbe Jamiu

%% set parameters
r =  round(red);
b = round(blue);
g = round(green);
doOperation = false;

%% check if the values is non-negative and within 0 - 255
if (r >= 0 && r <=255) && (b >= 0 && b <=255) && (g >= 0 && g <=255)
    doOperation = true;
end

%% check if rgb values are not zeros
if r ~= 0 
    r = r/255;
end
if g ~= 0
    g = g/255;
end
if b ~= 0
    b = b/255;
end

%% change the background of the object
bgColor = [r g b];
% disp([num2str(r), ' ', num2str(g), ' ', num2str(b)]);
if doOperation
    hObject.BackgroundColor=bgColor;
end

