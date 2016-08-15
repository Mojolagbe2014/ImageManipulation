function varargout = RGBTool(varargin)
% RGBTOOL MATLAB code for RGBTool.fig
%      RGBTOOL, by itself, creates a new RGBTOOL or raises the existing
%      singleton*.
%
%      H = RGBTOOL returns the handle to a new RGBTOOL or the handle to
%      the existing singleton*.
%
%      RGBTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGBTOOL.M with the given input arguments.
%
%      RGBTOOL('Property','Value',...) creates a new RGBTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGBTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGBTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGBTool

% Last Modified by GUIDE v2.5 30-Jul-2016 15:31:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGBTool_OpeningFcn, ...
                   'gui_OutputFcn',  @RGBTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RGBTool is made visible.
function RGBTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGBTool (see VARARGIN)

% Choose default command line output for RGBTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGBTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);

% --- Outputs from this function are returned to the command line.
function varargout = RGBTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function redSlider_Callback(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
rs = round(handles.redSlider.Value);
handles.redText.String = num2str(rs);
handles.redSlider.Value = rs;

changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);

% --- Executes during object creation, after setting all properties.
function redSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% set(hObject, 'SliderStep', [1/(hObject.Max+1), 10/ (hObject.Max+1)]);
% disp(num2str(hObject.Max+1));

% --- Executes on slider movement.
function greenSlider_Callback(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gs = round(handles.greenSlider.Value);
handles.greenText.String = num2str(gs);
handles.greenSlider.Value = gs;

changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);

% --- Executes during object creation, after setting all properties.
function greenSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function blueSlider_Callback(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
bs = round(handles.blueSlider.Value);
handles.blueText.String = num2str(bs);
handles.blueSlider.Value = bs;

changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);

% --- Executes during object creation, after setting all properties.
function blueSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function redText_Callback(hObject, eventdata, handles)
% hObject    handle to redText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redText as text
%        str2double(get(hObject,'String')) returns contents of redText as a double
rTxt = round(str2double(handles.redText.String));
rSliderMax = handles.redSlider.Max;
rSliderMin = handles.redSlider.Min;

if (rTxt <= rSliderMax) && (rTxt >= rSliderMin)
    handles.redSlider.Value = rTxt;
    handles.redText.String = rTxt;
    changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);
end

% --- Executes during object creation, after setting all properties.
function redText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenText_Callback(hObject, eventdata, handles)
% hObject    handle to greenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenText as text
%        str2double(get(hObject,'String')) returns contents of greenText as a double
gTxt = round(str2double(handles.greenText.String));
gSliderMax = handles.greenSlider.Max;
gSliderMin = handles.greenSlider.Min;

if (gTxt <= gSliderMax) && (gTxt >= gSliderMin)
    handles.greenSlider.Value = gTxt;
    handles.greenText.String = gTxt;
    changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);
end

% --- Executes during object creation, after setting all properties.
function greenText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blueText_Callback(hObject, eventdata, handles)
% hObject    handle to blueText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blueText as text
%        str2double(get(hObject,'String')) returns contents of blueText as a double
bTxt = round(str2double(handles.blueText.String));
bSliderMax = handles.blueSlider.Max;
bSliderMin = handles.blueSlider.Min;

if (bTxt <= bSliderMax) && (bTxt >= bSliderMin)
    handles.blueSlider.Value = bTxt;
    handles.blueText.String = bTxt;
    changeBackground(handles.colorPanel, handles.redSlider.Value, handles.greenSlider.Value, handles.blueSlider.Value);
end

% --- Executes during object creation, after setting all properties.
function blueText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function colorPanel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% bgcolor = [1 0 0];
% set(hObject, 'BackgroundColor', bgcolor);
