% FlipCard.m
%    demonstrate: image texturemaps on surfaces
%                 hgtransform objects
%    uses function ArcPath.m
%        Author: Craig S. Lent
%
%%  read in array of  card images
clear
clf
[ACardQC, map, cardalpha]=imread('queen_of_clubs2.png');
ACardBack=imread('CardBack2.png');

%% flip for subsequent plotting in xy mode
for k=1:3
   ACardQC(:,:,k)=flipud(ACardQC(:,:,k));
   ACardBack(:,:,k)=flipud(ACardBack(:,:,k));
end

%%   get Card image dimensions, image ratio
%    set size of card image to be displayed
[ny, nx, n]=size(ACardQC);
cardImRatio=ny/nx;
cardWidth=2;  % picked just for demo purposes
cardHeight=cardWidth*cardImRatio;

%% flip QC back (it will start face down)
%      
for k=1:3
   ACardQC(:,:,k)=flipud(ACardQC(:,:,k));
end

%%  create rectangular coordinates for surface 
%             (just 4 corners)
x=[-1 1]; 
y=[-1 1]*cardImRatio; 
z=[0 0];
[X,Y] = meshgrid(x,y);
Z=zeros(2,2);

%%   create surface with image of QC on it in it
h_img = surface(X,Y,Z,...
    'FaceColor','texturemap','CData',ACardQC,...
    'AlphaData',cardalpha, ...
    'EdgeColor','none',...
    'AlphaDataMapping','none',...
    'FaceAlpha','texturemap');
axis(1*[-1 1 -1 1 -1 1])
    
%%   add cardback card on top of it
    deltaz=1e-3;   % shift up slightly so it's on top
    h_img2 = surface(X,Y,Z+deltaz,...
        'FaceColor','texturemap','CData',ACardBack,...
        'AlphaData',cardalpha,...
        'EdgeColor','none',...
        'AlphaDataMapping', 'none',...
        'FaceAlpha','texturemap');

%%  create hgtransform and add two card images as children
ht = hgtransform;
set(h_img,'Parent',ht)
set(h_img2,'Parent',ht);

%%  set path of card
pxy=5;
p0=[0; 0]; p2=pxy*[1; 1]; H=2;
Nt=30;
t=linspace(0, 1, Nt);  % artificial time

%  ArcPath defines parabolic path from vector p0 to p2 with height H
%      Nt points is R vector
R=ArcPath(p0,p2,H,Nt); 

%% set background green patch
patchx=[-1 pxy+2 pxy+2 -1 -1];
patchy=[-1.5  -1.5    pxy+2 pxy+2 -1.5];
hp=patch(patchx, patchy,'g');
hp.FaceColor=[0.2 0.5 0.2];    % dark green

%%  set axis and camera position and camera target
axis([-1.5 pxy+2 -1.5 pxy+2 0 pxy+3.5]);
axis vis3d off
axis off

campos manual
campos([0  -20 15]);
camtarget([3,3,0]);
    
%%   rotate hgtransform object around axes and translate
Nth=400;
theta=1*pi*t;
dz=0.02;
dtime=0.02;

pause(1);
for it=1:Nt 
    Ry = makehgtform('yrotate',1*theta(it));
    Rz = makehgtform('zrotate',2*theta(it));
    Rx = makehgtform('xrotate',0*theta(it));    
    Tran = makehgtform('translate',[ R(1,it), R(2,it), R(3,it)+dz]);
    set(ht,'Matrix',Tran*Ry*Rz*Rx)
    pause(dtime)
    %drawnow
end
axis vis3d on
axis off


