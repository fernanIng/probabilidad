function manoD = pedirCartasDealer(manoD)
        noMasCartas = 0;
        %cuando noMasCartas sea igual a 1 sabremos que no queremos más
        %cartas
        while noMasCartas == 0
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
                
                
                
                if manoD(4).f>21
                    L = length(manoD(2).f);
                    
                    for n = 1:L
                        if manoD(2).f(n) == 11
                            
                            manoD(2).f(n)=1;
                            manoD(3).f(n)=0;
                            manoD(4).f = manoD(4).f-10;
                            break;
           
                        end
       
                    end
    
                end
                
                
            else
                noMasCartas = 1;
            end
        end
end
