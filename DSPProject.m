function varargout = DSPProject(varargin)
% DSPPROJECT MATLAB code for DSPProject.fig
%      DSPPROJECT, by itself, creates a new DSPPROJECT or raises the existing
%      singleton*.
%
%      H = DSPPROJECT returns the handle to a new DSPPROJECT or the handle to
%      the existing singleton*.
%
%      DSPPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSPPROJECT.M with the given input arguments.
%
%      DSPPROJECT('Property','Value',...) creates a new DSPPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DSPProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DSPProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DSPProject

% Last Modified by GUIDE v2.5 26-Apr-2017 18:32:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DSPProject_OpeningFcn, ...
                   'gui_OutputFcn',  @DSPProject_OutputFcn, ...
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


% --- Executes just before DSPProject is made visible.
function DSPProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DSPProject (see VARARGIN)

% Choose default command line output for DSPProject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DSPProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);
para_eq(handles);

% --- Outputs from this function are returned to the command line.
function varargout = DSPProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function freqSlider_Callback(hObject, eventdata, handles)
% hObject    handle to freqSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.freqText.String = num2str(handles.freqSlider.Value);
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function freqSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function widthSlider_Callback(hObject, eventdata, handles)
% hObject    handle to widthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.widthText.String = num2str(handles.widthSlider.Value);
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function widthSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ampSlider_Callback(hObject, eventdata, handles)
% hObject    handle to ampSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.ampText.String = num2str(handles.ampSlider.Value);
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function ampSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ampSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function freqText_Callback(hObject, eventdata, handles)
% hObject    handle to freqText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freqText as text
%        str2double(get(hObject,'String')) returns contents of freqText as a double
handles.freqSlider.Value = str2double(handles.freqText.String);
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function freqText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function widthText_Callback(hObject, eventdata, handles)
% hObject    handle to widthText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of widthText as text
%        str2double(get(hObject,'String')) returns contents of widthText as a double
handles.widthSlider.Value = str2double(handles.widthText.String);
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function widthText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widthText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ampText_Callback(hObject, eventdata, handles)
% hObject    handle to ampText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ampText as text
%        str2double(get(hObject,'String')) returns contents of ampText as a double
handles.ampSlider.Value = str2double(handles.ampText.String);
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function ampText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ampText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in audioBox.
function audioBox_Callback(hObject, eventdata, handles)
% hObject    handle to audioBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns audioBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from audioBox
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function audioBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to audioBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in audioButton.
function audioButton_Callback(hObject, eventdata, handles)
% hObject    handle to audioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
para_eq(handles);

% --- Executes on button press in filterButton.
function filterButton_Callback(hObject, eventdata, handles)
% hObject    handle to filterButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in audioFButton.
function audioFButton_Callback(hObject, eventdata, handles)
% hObject    handle to audioFButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
para_eq(handles);


function durationText_Callback(hObject, eventdata, handles)
% hObject    handle to durationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationText as text
%        str2double(get(hObject,'String')) returns contents of durationText as a double
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function durationText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in audioPop.
function audioPop_Callback(hObject, eventdata, handles)
% hObject    handle to audioPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns audioPop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from audioPop
para_eq(handles);


% --- Executes during object creation, after setting all properties.
function audioPop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to audioPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in viewFvButton.
function viewFvButton_Callback(hObject, eventdata, handles)
% hObject    handle to viewFvButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
para_eq(handles);


% --- Executes on button press in selectFile.
function selectFile_Callback(hObject, eventdata, handles)
% hObject    handle to selectFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
para_eq(handles);


% --- Executes on button press in checkbox.
function checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox
para_eq(handles);
