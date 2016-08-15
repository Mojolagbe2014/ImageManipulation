% placeAgentP
%   import image of Perrry the Platypus and place it 
%    on an axis
%
%       Author: H Doofenshmirtz 

clear; 
clc;
clf;

%% import figure 
Perry = imread('Perry_the_Platypus.png');

%% find image scale inorder to keep aspect ratio
[ny, nx, nz] = size(Perry);
PerryWidth = 4;     %width
PerryHeight = PerryWidth*(ny/nx);


%% flip color panes
for k = 1:3
    Perry(:, :, k) = flipud(Perry(:, :, k));
end

%% create axes 
axis xy
% axis off
axis equal
axis([0, 15, 0, 10]);
hax = gca; % gca => get current axes


%% create figure and place on axis 
hPimage = image('CData', Perry);
hPimage.Parent = hax;


%% set coordinates of lower left and upper right corners 
xLL = 7;        % x position
yLL = 0.5;      % y position
xUR = xLL + PerryWidth;
yUR = yLL + PerryHeight;

hPimage.XData = [xLL, xUR];
hPimage.YData = [yLL, yUR];
