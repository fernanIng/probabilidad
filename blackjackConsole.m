function varargout = blackjackConsole(varargin)
% BLACKJACKCONSOLE MATLAB code for blackjackConsole.fig
%      BLACKJACKCONSOLE, by itself, creates a new BLACKJACKCONSOLE or raises the existing
%      singleton*.
%
%      H = BLACKJACKCONSOLE returns the handle to a new BLACKJACKCONSOLE or the handle to
%      the existing singleton*.
%
%      BLACKJACKCONSOLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BLACKJACKCONSOLE.M with the given input arguments.
%
%      BLACKJACKCONSOLE('Property','Value',...) creates a new BLACKJACKCONSOLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before blackjackConsole_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to blackjackConsole_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help blackjackConsole

% Last Modified by GUIDE v2.5 08-Jun-2017 02:58:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @blackjackConsole_OpeningFcn, ...
                   'gui_OutputFcn',  @blackjackConsole_OutputFcn, ...
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


% --- Executes just before blackjackConsole is made visible.
function blackjackConsole_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to blackjackConsole (see VARARGIN)

% Choose default command line output for blackjackConsole
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes blackjackConsole wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = blackjackConsole_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

            
% --- Executes on button press in jugar.
function jugar_Callback(hObject, eventdata, handles)
% hObject    handle to jugar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.carta3J,'string','');
set(handles.carta4J,'string','');
set(handles.carta3D,'string','');
set(handles.carta4D,'string','');
%limpiamos las casillas


[valores,as,suma]=mano;
%llamamos a mano que nos crea aleatoriamente los valores de la mano de un
%jugador

field = 'f';
value = {'Jugador1';valores;as;suma};
manoJ = struct(field,value);
%creamos un struct, con las siguientes parates:-identificador, -valor de
%las cartas, -si tiene un As o no y con que posicion corresponde, -y la
%suma de valores

[valores,as,suma]=mano;

field = 'f';
value = {'Dealer';valores;as;suma};
manoD = struct(field,value);
%creamos el struct para el Dealer


manoJ = pedirCartasJugador(manoJ,manoD(2).f(1));
%llamando a esta función calcula si el jugador debería pedir carta, segun
%los parametros de probabilidad


L = length(manoJ(2).f);
%nos da la longitud de valores que es el número de cartas

if L == 3
    %Imprime la primera carta que pedímos si tenemos 3 cartas
    set(handles.carta3J,'string',num2str(manoJ(2).f(3)));
    
elseif L == 4
    %Imprime la primera y segunda carta que pedímos si tenemos 4 cartas
    set(handles.carta3J,'string',num2str(manoJ(2).f(3)));
    set(handles.carta4J,'string',num2str(manoJ(2).f(4)));
end


manoD = pedirCartasDealer(manoD);
%LLama a la funcion pedirCartasDealer que decide si debe pedir mas cartas o
%no

L = length(manoD(2).f);

if L == 3
    %Imprime la primera carta que pedímos si tenemos 3 cartas
    set(handles.carta3D,'string',num2str(manoD(2).f(3)));
    
elseif L == 4
    %Imprime la primera y segunda carta que pedímos si tenemos 4 cartas
    set(handles.carta3D,'string',num2str(manoD(2).f(3)));
    set(handles.carta4D,'string',num2str(manoD(2).f(4)));
end

set(handles.carta1J,'string',num2str(manoJ(2).f(1)));
set(handles.carta2J,'string',num2str(manoJ(2).f(2)));
set(handles.carta1D,'string',num2str(manoD(2).f(1)));
set(handles.carta2D,'string',num2str(manoD(2).f(2)));

set(handles.totalJ,'string',num2str(manoJ(4).f));
set(handles.totalD,'string',num2str(manoD(4).f));
if manoJ(4).f > 21
    set(handles.finJ,'string','PERDEDOR');
    set(handles.finD,'string','GANADOR');
    
elseif manoD(4).f > 21
    set(handles.finJ,'string','GANADOR');
    set(handles.finD,'string','PERDEDOR');
    
elseif manoJ(4).f > manoD(4).f 
    set(handles.finJ,'string','GANADOR');
    set(handles.finD,'string','PERDEDOR');
    
elseif manoJ(4).f < manoD(4).f 
    set(handles.finJ,'string','PERDEDOR');
    set(handles.finD,'string','GANADOR');
    
elseif manoJ(4).f == manoD(4).f 
    set(handles.finJ,'string','EMPATE');
    set(handles.finD,'string','EMPATE');
end
%imprimimos las dos primeras cartas de cada jugador




function carta1J_Callback(hObject, eventdata, handles)
% hObject    handle to carta1J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta1J as text
%        str2double(get(hObject,'String')) returns contents of carta1J as a double


% --- Executes during object creation, after setting all properties.
function carta1J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta1J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carta2J_Callback(hObject, eventdata, handles)
% hObject    handle to carta2J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta2J as text
%        str2double(get(hObject,'String')) returns contents of carta2J as a double


% --- Executes during object creation, after setting all properties.
function carta2J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta2J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carta1D_Callback(hObject, eventdata, handles)
% hObject    handle to carta1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta1D as text
%        str2double(get(hObject,'String')) returns contents of carta1D as a double


% --- Executes during object creation, after setting all properties.
function carta1D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carta2D_Callback(hObject, eventdata, handles)
% hObject    handle to carta2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta2D as text
%        str2double(get(hObject,'String')) returns contents of carta2D as a double


% --- Executes during object creation, after setting all properties.
function carta2D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carta3J_Callback(hObject, eventdata, handles)
% hObject    handle to carta3J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta3J as text
%        str2double(get(hObject,'String')) returns contents of carta3J as a double


% --- Executes during object creation, after setting all properties.
function carta3J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta3J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carta3D_Callback(hObject, eventdata, handles)
% hObject    handle to carta3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta3D as text
%        str2double(get(hObject,'String')) returns contents of carta3D as a double


% --- Executes during object creation, after setting all properties.
function carta3D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on uitable1 and none of its controls.
function uitable1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function carta4D_Callback(hObject, eventdata, handles)
% hObject    handle to carta4D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta4D as text
%        str2double(get(hObject,'String')) returns contents of carta4D as a double


% --- Executes during object creation, after setting all properties.
function carta4D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta4D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function carta4J_Callback(hObject, eventdata, handles)
% hObject    handle to carta4J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of carta4J as text
%        str2double(get(hObject,'String')) returns contents of carta4J as a double


% --- Executes during object creation, after setting all properties.
function carta4J_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carta4J (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function totalJ_Callback(hObject, eventdata, handles)
% hObject    handle to totalJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalJ as text
%        str2double(get(hObject,'String')) returns contents of totalJ as a double


% --- Executes during object creation, after setting all properties.
function totalJ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function totalD_Callback(hObject, eventdata, handles)
% hObject    handle to totalD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalD as text
%        str2double(get(hObject,'String')) returns contents of totalD as a double


% --- Executes during object creation, after setting all properties.
function totalD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function finJ_Callback(hObject, eventdata, handles)
% hObject    handle to finJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finJ as text
%        str2double(get(hObject,'String')) returns contents of finJ as a double


% --- Executes during object creation, after setting all properties.
function finJ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function finD_Callback(hObject, eventdata, handles)
% hObject    handle to finD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finD as text
%        str2double(get(hObject,'String')) returns contents of finD as a double


% --- Executes during object creation, after setting all properties.
function finD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
