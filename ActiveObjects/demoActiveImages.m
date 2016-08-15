function demoActiveImages
%      make two images "active" so they respond to mouse clicks
%      Information is stored in the UserData property of each image
%       Author: CSL
clear;
clf;
clc

%% read in image data arrays
ACard7D=imread('7_of_diamonds.png');
ACardQC=imread('queen_of_clubs2.png');
ACardBack=imread('CardBack.png');

%% flip images for xy coordinates
for k=1:3
    ACard7D(:,:,k)=flipud(ACard7D(:,:,k));
    ACardQC(:,:,k)=flipud(ACardQC(:,:,k));
    ACardBack(:,:,k)=flipud(ACardBack(:,:,k));
end
[ny, nx, nz]=size(ACard7D);


%%   create axis
axis xy
axis equal
hax=gca;
axis(hax,[0, 25, 0, 10]);
axis off


%% Set scale and place images on axis
CardWidth=6;
CardHeight=CardWidth*(ny/nx);

him1=image('CData',ACard7D);  % handle to image
him1.Parent=hax;
him2=image('CData',ACardQC);  % handle to image
him2.Parent=hax;

%% set coordinates of lower left and upper right corners
xLL=5;
yLL=0.2;
xUR=xLL+CardWidth;
yUR=yLL+CardHeight;
xShift=2*CardWidth;

him1.XData=[xLL, xUR];
him1.YData=[yLL, yUR];

him2.XData=[xLL+xShift, xUR+xShift];
him2.YData=[yLL, yUR];


%% store cards and handle to other image in UserData
FaceIsUp=true;   % face up
him1.UserData={ACard7D, ACardBack, FaceIsUp};
him2.UserData={ACardQC, ACardBack, FaceIsUp}; 

%% setup ButtonDownFcn callbacks for each image
%     send cell array with:
%     first element is handle to function below
%     second element is card number assigned to this particular card
%      ... other cell array elements can be added
set(him1,'ButtonDownFcn', {@imageButtonDown, 1} ); 
set(him2,'ButtonDownFcn', {@imageButtonDown, 2} );  


%%%%%%%%%%%%%%%%% Button Down function  %%%%%%%%%%%%%%%%%
function imageButtonDown(hThis,eventdata,cardNumber)
%   hThis is handle to the card over which mouse button is clicked
% get user data for this particular card
%       {FrontImage, BackImage, FaceIsUp};
Data=hThis.UserData;

%% flip card state
FaceIsUp=Data{3};
FaceIsUp=~FaceIsUp;
hThis.UserData={Data{1}, Data{2}, FaceIsUp};

%% show appropriate image
if FaceIsUp
    hThis.CData=Data{1};
else
    hThis.CData=Data{2};
end

%% just to illustrate: show card number and exact point of mouse click
disp(['Card number ',num2str(cardNumber),' has been clicked']);

curr_pt = get(gca,'CurrentPoint');
xpt=curr_pt(1,1);
ypt=curr_pt(1,2);
disp(['   Mouse click at cursor position (',num2str(xpt),', ',num2str(ypt),')']);


