function varargout = consola(varargin)
% CONSOLA MATLAB code for consola.fig
%      CONSOLA, by itself, creates a new CONSOLA or raises the existing
%      singleton*.
%
%      H = CONSOLA returns the handle to a new CONSOLA or the handle to
%      the existing singleton*.
%
%      CONSOLA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONSOLA.M with the given input arguments.
%
%      CONSOLA('Property','Value',...) creates a new CONSOLA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before consola_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to consola_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help consola

% Last Modified by GUIDE v2.5 04-Jun-2017 21:25:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @consola_OpeningFcn, ...
                   'gui_OutputFcn',  @consola_OutputFcn, ...
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


% --- Executes just before consola is made visible.
function consola_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to consola (see VARARGIN)

% Choose default command line output for consola
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes consola wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = consola_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function dinero_Callback(hObject, eventdata, handles)
% hObject    handle to dinero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dinero as text
%        str2double(get(hObject,'String')) returns contents of dinero as a double


% --- Executes during object creation, after setting all properties.
function dinero_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dinero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PAR.
function PAR_Callback(hObject, eventdata, handles)
% hObject    handle to PAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

if A >= B
    dinero=[];
    dinero(1)=A;
	plot(dinero)
    set(handles.resultado,'string',num2str(0));
    set(handles.dineroFinal,'string',num2str(A));
else        
    dineroF=0;
    gano=0;
    dinero=[];
    dinero(1)=A;
    iter=2;
    disp('Apostando a Rojo/Negro Par/Impar')

    while(dinero>0)

        dinero(iter)=dinero(iter-1)-1;
        aleatorio=randi(37);
        if aleatorio <= 18
            dinero(iter)=dinero(iter)+2;
        end

        if(dinero(iter)>=B)
            %objetivo ganr 20$
            gano = 1;
            dineroF=dinero(iter);
            break
        end

        iter = iter+1;
    end

    if(gano == 0)
           dineroF = dinero(iter-1);
    end

    iter
    plot(dinero)

    set(handles.resultado,'string',num2str(iter));
    set(handles.dineroFinal,'string',num2str(dineroF));
end

function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultado as text
%        str2double(get(hObject,'String')) returns contents of resultado as a double


% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in docena.
function docena_Callback(hObject, eventdata, handles)
% hObject    handle to docena (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

dineroF=0;
gano=0;
dinero=[];
dinero(1)=A;
iter=2;
disp('Apostando a las docenas')
%docenas
while(dinero>0)
                
    aleatorio=randi(37);
    if aleatorio <= 12
        dinero(iter)=dinero(iter-1)+2;
    else
        dinero(iter)=dinero(iter-1)-1;
    end
    
    if(dinero(iter)>=B)
        gano = 1;
        dineroF=dinero(iter);
    	break
    end
    
    iter = iter+1;

end 
 
if(gano == 0)
       dineroF = dinero(iter-1);
end
 
iter
plot(dinero)
 
set(handles.resultado,'string',num2str(iter));
set(handles.dineroFinal,'string',num2str(dineroF));



% --- Executes on button press in doubleUp.
function doubleUp_Callback(hObject, eventdata, handles)
% hObject    handle to doubleUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

dineroF=0;
gano=0;
dinero=[];
dinero(1)=A;
iter=2;

duplicado = 1;
disp('Double up')
            
while(dinero>0)
	if(dinero(iter-1)<duplicado)
        break
    end
	dinero(iter)=dinero(iter-1) - duplicado;
	aleatorio=randi(37);
	if aleatorio <= 18
        dinero(iter)=dinero(iter) + (duplicado*2);
        duplicado=1;
    else
        duplicado=duplicado*2;
    end
                
	if(dinero(iter)>=B)
        %objetivo ganr 20$
        gano = 1;
        dineroF=dinero(iter);
        break
    end
	iter = iter+1;

end

if(gano == 0)
       dineroF = dinero(iter-1);
end 

iter
plot(dinero)
set(handles.resultado,'string',num2str(iter));
set(handles.dineroFinal,'string',num2str(dineroF));



% --- Executes on button press in GrandMartingale.
function GrandMartingale_Callback(hObject, eventdata, handles)
% hObject    handle to GrandMartingale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

dineroF=0;
gano=0;
dinero=[];
dinero(1)=A;
iter=2;

duplicado = 1;
            disp('The Grand Martingale Strategy.')
while(dinero>0)
	if(dinero(iter-1)<duplicado)
        break
    end
	dinero(iter)=dinero(iter-1) - duplicado;
	aleatorio=randi(37);
	if aleatorio <= 18
        dinero(iter)=dinero(iter) + (duplicado*2);
        duplicado=1;
    else
        duplicado=(duplicado*2)+1;
    end
                
	if(dinero(iter)>=B)
        gano = 1;
        dineroF=dinero(iter);
        break
    end
	iter = iter+1;

end

if(gano == 0)
       dineroF = dinero(iter-1);
end 

iter
plot(dinero)
set(handles.resultado,'string',num2str(iter));
set(handles.dineroFinal,'string',num2str(dineroF));


% --- Executes on button press in jamesBond.
function jamesBond_Callback(hObject, eventdata, handles)
% hObject    handle to jamesBond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

dineroF=0;
dinero=[];
dinero(1)=A;
iter=2;
gano=0;

disp('James Bond Roulette Strategy.')
%requiere un minimo de 200$ por apuesta
duplicado = 1;
while(dinero>=200*duplicado)
	aleatorio=randi(37);
	if aleatorio >= 19 && aleatorio <= 36
        disp('de 19 a 36 -----apostamos 140$      multiplica por 2')
        dinero(iter)=dinero(iter-1) + (80*duplicado);
        duplicado = 1;
                    
	elseif aleatorio >= 13 && aleatorio <= 18
        disp('de 13 a 18 ------apostamos 50$       multiplica por 6')
        dinero(iter)=dinero(iter-1) + (100*duplicado);
        duplicado = 1;
                    
    elseif aleatorio == 37 
        disp('si es 0 ----- apostamos 10$      multiplica por 36')
        dinero(iter)=dinero(iter-1) + (160 * duplicado);
        duplicado = 1;
                    
    else
        dinero(iter)=dinero(iter-1) - (200 * duplicado);
        duplicado=duplicado*2;
    end
                
	if(dinero(iter)>=B)
        gano = 1;
        dineroF=dinero(iter);
        break
    end
	iter = iter+1; 
                
end

if(gano == 0)
       dineroF = dinero(iter-1);
end 

iter
plot(dinero)

set(handles.resultado,'string',num2str(iter));
set(handles.dineroFinal,'string',num2str(dineroF));




function dineroFinal_Callback(hObject, eventdata, handles)
% hObject    handle to dineroFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dineroFinal as text
%        str2double(get(hObject,'String')) returns contents of dineroFinal as a double


% --- Executes during object creation, after setting all properties.
function dineroFinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dineroFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function retirada_Callback(hObject, eventdata, handles)
% hObject    handle to retirada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of retirada as text
%        str2double(get(hObject,'String')) returns contents of retirada as a double


% --- Executes during object creation, after setting all properties.
function retirada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to retirada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
