% MoveAgentP
%   place image of Perry the platypus on axis
%         Author: CSL
clear
clf
%%  read in image information
[Perry, map, PAlpha]=imread('Perry_the_Platypus.png');

for k=1:3
    Perry(:,:,k)=flipud(Perry(:,:,k));
    PAlpha=flipud(PAlpha);
end
[ny, nx, nz]=size(Perry);

%%   create axis
axis([0, 15, 0, 10]);
axis xy
axis equal
hax=gca;
axis(hax,[0, 15, 0, 10]);

%% Set scale and place image  (not yet right size)
PerryWidth=6;
PerryHeight=PerryWidth*(ny/nx);
him=image('CData',Perry);  % handle to image
him.Parent=hax;

%% set coordinate of lower left and upper right corners
xLL=5;
yLL=0.2;
xUR=xLL+PerryWidth;
yUR=yLL+PerryHeight;

him.XData=[xLL, xUR];
him.YData=[yLL, yUR];

%% add alphaData
him.AlphaData=PAlpha;
 
%% move agent p
%     just shift x coordinates from right to left
xinit=15;
xfin=-15;
Nx=400;
x=linspace(xinit, xfin, Nx);

axis off
for ix=1:Nx
    xLL=x(ix);
    xUR=xLL+PerryWidth;
    
    him.XData=[xLL, xUR];
    
    drawnow
end



