function demoButtonDownFcn
% demoButtonDownFcn demostrate button down property
%
%    Author: CSL

clc; clf;

%% make axes and patch
axis([-5, 5, -5, 5]);
axis square

X = [0, 1, 1, 0, 0];
Y = [0, 0, 1, 1, 0];

hp(1) = patch(X, Y, 'r');
hp(2) = patch(X-2, Y, 'b');

%% set button down function
for ip = 1:2
    hp(ip).ButtonDownFcn = @mypatchButtonDownFcn;
    % store the index to patch and type of object
    hp(ip).UserData = {ip, 'Square'}; % stored two information about each object
end


%% set button down function for axis
set(gca, 'ButtonDownFcn', @axesButtonDownFcn);

function mypatchButtonDownFcn(hThis, event, varargin)
% unpack/get the stored user data
Data = hThis.UserData;
patchNum = Data{1};

disp(' *************** ');

switch (patchNum)
    case 1 
        disp([num2str(patchNum), ' (red square) is clicked!']);
        
    case 2
        disp([num2str(patchNum), ' (blue square) is clicked!']);
end


function axesButtonDownFcn(hThis, event, varargin)
disp('Dude, you missed the patches')
% report position of mouse click 
currPt = get(gca, 'CurrentPoint');
xpt = currPt(1,1);
ypt = currPt(1,2);
disp(['   Mouse click at position (',num2str(xpt),',',num2str(ypt),')']);