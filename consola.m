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

% Last Modified by GUIDE v2.5 07-Jun-2017 19:58:40

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
%Recogemos los valores por consola del dinero con el que comenzamos y el
%dinero con el que dejariamos de ganar 

if(A >= B)
    errordlg('Introduzca un objetivo mayor que la cantidad Inicial');
    %Salta un mensaje de error si nuestro objetivo no es mayor que la
    %cantidad con la que comenzamos
    
else
    %si los datos son correctos empezamos el preceso
    %inicializamos valores
    dineroF = 0;
    gano = 0;
    dinero = [];
    %dinero es un array con el dinero que tenemos en cada iteracción
    
    dinero(1) = A;
    iter = 2;
    disp('Apostando a Rojo/Negro Par/Impar')

    while(dinero > 0)
        %bucle hasta que se nos acabe el dinero o llge al breack debido a
        %que ganamos la cantidad necesaria
        
        dinero(iter) = dinero(iter-1)-1;
        %restamos a la cantidad de dinero de esta iterración la apuesta que
        %es 1
        
        aleatorio = randi(37);
        %aleatorio con las 37 números posibles de la ruleta
        
        if aleatorio <= 18
            %la posibilidad de ganar son 18 de 37, si entra gana
            
            dinero(iter) = dinero(iter) + 2;
            %los beneficios son 2
        end

        if(dinero(iter) >= B)
            %si el dinero de esta iteracción  es igual o mayor que B hemos
            %llegago a nuestro objetivo
            
            gano = 1;
            %marcamos que el jugador a ganado poniendo gano a 1
            
            dineroF=dinero(iter);
            %guardamos en dineroF la cantidad de dinero en esta
            %iteracción
            
            break
            %salimos del while
        end

        iter = iter+1;
        %cada pasa por el while avanzamos una iteracción, es una jugada
    end

    if(gano == 0)
        %si no gano, el dineroF sera el de la iteracción antes de
        %salirse del bucle
        dineroF = dinero(iter-1);
        
        set(handles.situacionFin,'string','PERDEDOR');
        %devuelve por pantalla si perdimos
        
     else
        set(handles.situacionFin,'string','GANADOR');
        %devuelve por pantalla si ganamos
    end

    plot(dinero)
    %nos da la grafica de las iteraciones y como ha avnzado nuestro dinero

    set(handles.resultado,'string',num2str(iter));
    set(handles.dineroFinal,'string',num2str(dineroF));
    %Nos devuelve por pantalla las iteraciones transcurridas y el dinero
    %con el que acabamos

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
%Recogemos los valores por consola del dinero con el que comenzamos y el
%dinero con el que dejariamos de ganar 

if(A >= B)
    errordlg('Introduzca un objetivo mayor que la cantidad Inicial');
    %Salta un mensaje de error si nuestro objetivo no es mayor que la
    %cantidad con la que comenzamos
    
else
    %si los datos son correctos empezamos el preceso
    %inicializamos valores
    dineroF = 0;
    gano = 0;
    dinero = [];
    dinero(1) = A;
    iter = 2;
    disp('Apostando a las docenas')
    
    while(dinero > 0)

        aleatorio = randi(37);
        
        if aleatorio <= 12
             %la posibilidad de ganar son 12 de 37, si entra gana suma 2
            dinero(iter) = dinero(iter-1)+2;
            
        else
            % si entra a perdido y pierde  1
            dinero(iter) = dinero(iter-1)-1;
            
        end

        if(dinero(iter) >= B)
            %si el dinero de esta iteracción  es igual o mayor que B hemos
            %llegago a nuestro objetivo, y saldremos del bucle
            
            gano = 1;
            %ponnemos gano=1 para indicar que ha ganado
            dineroF = dinero(iter);
            
            break
            
        end

        iter = iter+1;
         %cada pasa por el while avanzamos una iteracción, es una jugada
    end 

    if(gano == 0)
        %entra si perdemos
        
        dineroF = dinero(iter-1);
        set(handles.situacionFin,'string','PERDEDOR');
        %devuelve por pantalla si perdimos
        
    else
        set(handles.situacionFin,'string','GANADOR');
        %devuelve por pantalla si ganamos   
    end

    plot(dinero)

    set(handles.resultado,'string',num2str(iter));
    set(handles.dineroFinal,'string',num2str(dineroF));
end




% --- Executes on button press in doubleUp.
function doubleUp_Callback(hObject, eventdata, handles)
% hObject    handle to doubleUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

if(A >= B)
    errordlg('Introduzca un objetivo mayor que la cantidad Inicial');
    
else
    dineroF = 0;
    gano = 0;
    dinero = [];
    dinero(1)= A;
    iter = 2;

    apuesta = 1;
    %contador que nos dice la cantidad a apostar y que se dúplica cada vez
    %que perdemos
    
    disp('Double up')

    while(dinero > 0)
        
        if(dinero(iter-1) < apuesta)
            %si no podemos realizar el valor de la siguiente apuesta
            %dejamos de jugar
            
            break
            
        end
        
        dinero(iter) = dinero(iter-1) - apuesta;
        %restamos el valor de la apuesta a nuestro dinero
        
        aleatorio = randi(37);
        
        if aleatorio <= 18
            %si entre nuestra apuesta es ganadora
            
            dinero(iter)=dinero(iter) + (apuesta*2);
            %sumamos nuestros beneficios que son el doble de nuestra
            %apuesta que es en valor "apuesta"
            
            apuesta = 1;
            %reseteamos el valor de "apuesta" a 1
        else
            apuesta = apuesta * 2;
            % si perdemos duplicamos el valor de la siguiente apuesta
            
        end

        if(dinero(iter) >= B)
            %salimos del bucle si llegamos a nuestro objetivo
            gano = 1;
            dineroF = dinero(iter);
            break
        end
        
        iter = iter+1;
        %aumentamos la iteración
    end

    if(gano == 0)
        %entra si perdemos
        
        dineroF = dinero(iter-1);
        set(handles.situacionFin,'string','PERDEDOR');
        %devuelve por pantalla si perdimos
        
    else
        set(handles.situacionFin,'string','GANADOR');
        %devuelve por pantalla si ganamos
    end 

    
    plot(dinero)
    %gráfica
    set(handles.resultado,'string',num2str(iter));
    set(handles.dineroFinal,'string',num2str(dineroF));
    %devolvemos los valores por pantalla
end





% --- Executes on button press in GrandMartingale.
function GrandMartingale_Callback(hObject, eventdata, handles)
% hObject    handle to GrandMartingale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

if(A >= B)
    errordlg('Introduzca un objetivo mayor que la cantidad Inicial');
    
else
    dineroF = 0;
    gano = 0;
    dinero = [];
    dinero(1) = A;
    iter = 2;

    apuesta = 1;
    %contador que nos dice la cantidad a apostar y que se dúplica y se 
    %añade una unidad cada vez que perdemos
    
    disp('The Grand Martingale Strategy.')
    
    while(dinero > 0)
        
        if(dinero(iter-1) < apuesta)
            %si no podemos realizar el valor de la siguiente apuesta
            %dejamos de jugar
       
            break
        end
        
        dinero(iter) = dinero(iter-1) - apuesta;
        %restamos el valor de la apuesta a nuestro dinero
     
        aleatorio = randi(37);
        
        if aleatorio <= 18
            %si entre nuestra apuesta es ganadora
            
            dinero(iter) = dinero(iter) + (apuesta*2);
            %sumamos nuestros beneficios que son el doble de nuestra
            %apuesta que es en valor "apuesta"
            
            apuesta = 1;
            %reseteamos el valor de "apuesta" a 1
        else
            apuesta = (apuesta*2)+1;
            % si perdemos duplicamos el valor y le sumamos una unidad
            
        end

        if(dinero(iter) >= B)
            %salimos si llegamos a nuestro objetivo
            
            gano = 1;
            dineroF = dinero(iter);
            break
            
        end
        iter = iter+1;
        %indicador de iteracciones

    end

    if(gano == 0)
        %entra si perdimos
        dineroF = dinero(iter-1);
        set(handles.situacionFin,'string','PERDEDOR');
        %devuelve por pantalla si perdimos
        
    else
        set(handles.situacionFin,'string','GANADOR');
        %devuelve por pantalla si ganamos
        
    end 

    plot(dinero)
    %gráfica
    
    set(handles.resultado,'string',num2str(iter));
    set(handles.dineroFinal,'string',num2str(dineroF));
    %devolvemos valores por pantalla
end




% --- Executes on button press in jamesBond.
function jamesBond_Callback(hObject, eventdata, handles)
% hObject    handle to jamesBond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A = str2num(get(handles.dinero,'string'));
B = str2num(get(handles.retirada,'string'));

if(A >= B)
    errordlg('Introduzca un objetivo mayor que la cantidad Inicial');
    
else
    if(A < 200)
        %Para llevar a cabo esta operación es necesario al menos 200$
        errordlg('Introduzca al menos 200$ para jugar a este modo');
        
    else
        dineroF=0;
        dinero=[];
        dinero(1)=A;
        iter=2;
        gano=0;

        disp('James Bond Roulette Strategy.')
        apuesta = 1;
        %contador que nos dice la cantidad a apostar y que se dúplica cada vez
        %que perdemos, en este caso cada unidad en "apuesta" son 200$
        
        while(dinero >= 200*apuesta)
            %esta apuesta, tiene 3 partes, simultaneas: apuesta 140$ del 19
            %al 36, 50$ del 13 al 18 y 10$ al 0
            aleatorio = randi(37);
            
            if aleatorio >= 19 && aleatorio <= 36
                %Si entra aqui esque ha caido del 19 al 36 y ganaremos 80$ 
                %mantenniendo los 200$
                
                disp('de 19 a 36 -----apostamos 140$      multiplica por 2')
                dinero(iter) = dinero(iter-1) + (80 * apuesta);
                %sumamos el valor gando
                
                apuesta = 1;
                %reiniciamos la cantidad a apostar en la siguiente,
                %recordamos que una unidad en apuesta son 200$
                
            elseif aleatorio >= 13 && aleatorio <= 18
                %Si entra aqui esque ha caido del 13 al 18 y ganaremos 100$ 
                %mantenniendo los 200$
                
                disp('de 13 a 18 ------apostamos 50$       multiplica por 6')
                dinero(iter)=dinero(iter-1) + (100 * apuesta);
                
                apuesta = 1;
                %reiniciamos la cantidad a apostar en la siguiente 
                
            elseif aleatorio == 37
                %Si entra aqui esque ha caido en el 0 y ganaremos 160$ 
                %mantenniendo los 200$
                disp('si es 0 ----- apostamos 10$      multiplica por 36')
                dinero(iter)=dinero(iter-1) + (160 * apuesta);
                
                apuesta = 1;
                    
            else
                %Si entra aqui esque ha caido del 1 al 12 y perderemos los
                %200$
                
                dinero(iter)=dinero(iter-1) - (200 * apuesta);
                apuesta=apuesta*2;
                %Duplicamos la apuesta para el siguiente juego
                
            end
                
            if(dinero(iter) >= B)
                %salimos si llegamos a nuestro objetivo
                
                gano = 1;
                dineroF = dinero(iter);
                break 
                
            end
            
            iter = iter+1; 
                
        end

        if(gano == 0)
            %entra aqui si perdimos
            
            dineroF = dinero(iter-1);
            %si perdimos tomamos el dinero de la anterio iteracción
            
            set(handles.situacionFin,'string','PERDEDOR');
            %devuelve por pantalla si perdimos
        else
            set(handles.situacionFin,'string','GANADOR');
            %devuelve por pantalla si ganamos
        end 

        
        plot(dinero)

        set(handles.resultado,'string',num2str(iter));
        set(handles.dineroFinal,'string',num2str(dineroF));
    end
end





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



function situacionFin_Callback(hObject, eventdata, handles)
% hObject    handle to situacionFin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of situacionFin as text
%        str2double(get(hObject,'String')) returns contents of situacionFin as a double


% --- Executes during object creation, after setting all properties.
function situacionFin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to situacionFin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
