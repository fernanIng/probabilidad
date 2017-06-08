
function manoJ = pedirCartasJugador(manoJ,cartaD1)
        noMasCartas = 0;
        %cuando noMasCartas sea igual a 1 sabremos que no queremos más
        %cartas
        while noMasCartas == 0
            
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
                
                
                if manoJ(4).f>21
                    L = length(manoJ(2).f);
                    
                    for n = 1:L
                        if manoJ(2).f(n) == 11
                            
                            manoJ(2).f(n)=1;
                            manoJ(3).f(n)=0;
                            manoJ(4).f = manoJ(4).f-10;
                            break;
           
                        end
       
                    end
    
                end
                
            else
                noMasCartas = 1;
            end
            
        end
        
        
end
