function y = f9 (x,y)
    % x = dinero
    dinero=[];
    dinero(1)=x;
    iter=2;
    switch y
        case 0
            disp('Apostando a las docenas')
            %docenas
            while(dinero>0)
                %plot(dinero)

                aleatorio=randi(37);
                if aleatorio <= 12
                    dinero(iter)=dinero(iter-1)+2;
                else
                    dinero(iter)=dinero(iter-1)-1;
                end
                if(dinero(iter)>=1050)
                    break
                end
                iter = iter+1;

            end
            iter
            plot(dinero)
        case 1
            disp('Apostando a Rojo/Negro Par/Impar')
            while(dinero>0)
                %plot(dinero)
    
                dinero(iter)=dinero(iter-1)-1;
                aleatorio=randi(37);
                if aleatorio <= 18
                    dinero(iter)=dinero(iter)+2;
                end
                iter = iter+1;
   
            end
            iter
            plot(dinero)
        case 2
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
                
                if(dinero(iter)>=120)
                    %objetivo ganr 20$
                    break
                end
                iter = iter+1;

            end
            iter
            plot(dinero)
        case 3
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
                
                if(dinero(iter)>=120)
                    break
                end
                iter = iter+1;

            end
            iter
            plot(dinero)
            
       case 4
            
            disp('James Bond Roulette Strategy.')
            %requiere un minimo de 200$ por apuesta
            while(dinero>=200)
                aleatorio=randi(37);
                if aleatorio >= 19 && aleatorio <= 36
                    disp('de 19 a 36 -----apostamos 140$      multiplica por 2')
                    dinero(iter)=dinero(iter-1) + 80 ;
                elseif aleatorio >= 13 && aleatorio <= 18
                    disp('de 13 a 18 ------apostamos 50$       multiplica por 6')
                    dinero(iter)=dinero(iter-1) + 100 ;
                elseif aleatorio == 37 
                    disp('si es 0 ----- apostamos 10$      multiplica por 36')
                    dinero(iter)=dinero(iter-1) + 160 ;
                else
                    dinero(iter)=dinero(iter-1) - 200 ;
                end
                
                if(dinero(iter)>=600)
                    break
                end
                iter = iter+1; 
                
            end
            
            iter
            plot(dinero)
    end
end