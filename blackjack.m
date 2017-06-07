
function y = f9 (x)


disp('Blackjack')
%jugamos con 4 barajas 208 cartas
%aleatorio=randi(208);
%b = mod(aleatorio,52);
%a=ayuda(b);
 
mano;
field = 'f';
value = {'Jugador1';
         valores;as;suma};
manoJ = struct(field,value);
manoJ(1)
manoJ(2).f;
manoJ(3);
manoJ(4)


pedirCartasJugador

manoJ(1)
manoJ(2).f;
manoJ(3);
manoJ(4)





mano;
field = 'f';
value = {'Dealer';
         valores;as;suma};
manoD = struct(field,value);
manoD(1)
manoD(2);
manoD(3);
manoD(4)
pedirCartasDealer
%pedirCartas
manoD(1)
manoD(2);
manoD(3);
manoD(4)

    function mano
        suma=0;
        for n = 1:2
            aleatorio=randi(208);
            b = mod(aleatorio,52);
            valores(n)= ayuda(b);
            if(valores(n)==11)
                as(n)=1;
            else
                as(n)=0;
            end
            suma=suma+valores(n);

        end
    end

    function pedirCartasJugador
        if(manoJ(4).f < 15)
            
            aleatorio=randi(208);
            b = mod(aleatorio,52);
            %calculamos alaetorio y lo pasamos por el mod de una baraja
            
            L = length(manoJ(2).f);
            valores(L+1)= ayuda(b);
            
            for n = 1:L
                valores(n)=manoJ(2).f(n);
                as(n)=manoJ(3).f(n);
            end
            
            if(valores(L+1)==11)
                as(L+1)=1;
            else
                as(L+1)=0;
            end
              
            suma=manoJ(4).f+valores(L+1);
            
            field = 'f';
            value = {'Jugador1';valores;as;suma};
            manoJ = struct(field,value);
            
        end
    end

    function pedirCartasDealer
        if(manoD(4).f < 16)
            
            aleatorio=randi(208);
            b = mod(aleatorio,52);
            %calculamos alaetorio y lo pasamos por el mod de una baraja
            
            L = length(manoD(2).f);
            valores(L+1)= ayuda(b);
            
            for n = 1:L
                valores(n)=manoD(2).f(n);
                as(n)=manoD(3).f(n);
            end
            
            if(valores(L+1)==11)
                as(L+1)=1;
            else
                as(L+1)=0;
            end
              
            suma=manoD(4).f+valores(L+1);
            
            field = 'f';
            value = {'Dealer';valores;as;suma};
            manoD = struct(field,value);
            
        end
    end
end
