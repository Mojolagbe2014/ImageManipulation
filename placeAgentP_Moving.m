% placeAgentP_Moving
%   import image of Perrry the Platypus and place it 
%    on an axis
%
%       Author: CSL

clear; 
clc;
clf;

%% read in image information
[Perry, mode, PAlpha] = imread('Perry_the_Platypus.png');

for k = 1:3
    Perry(:, :, k) = flipud(Perry(:, :, k));
    PAlpha = flipud(PAlpha);
end
[ny, nx, nz] = size(Perry);

%% create axes 
axis([0, 15, 0, 10]);
axis xy
axis off
axis equal
hax = gca;
axis(hax, [0, 15, 0, 10]);  


%% set scale and place image  (not yei right size) 
PerryWidth = 6;     % width
PerryHeight = PerryWidth*(ny/nx);
him = image('CData', Perry);    % handle to image
him.Parent = hax;


%% set coordinates of lower left and upper right corners 
xLL = 5;        % x position
yLL = 0.2;      % y position
xUR = xLL + PerryWidth;
yUR = yLL + PerryHeight;

him.XData = [xLL, xUR];
him.YData = [yLL, yUR];

%% add Alpha data
him.AlphaData = PAlpha;

%% move agent
%   just shift x-coordianate from right
xinit = 15;
xfin = -15;
Nx = 800;
x = linspace(xinit,xfin,  Nx);

for ix = 1:Nx
    xLL = x(ix);
    xUR = xLL + PerryWidth;
    
    him.XData = [xLL, xUR];
    
    drawnow
end