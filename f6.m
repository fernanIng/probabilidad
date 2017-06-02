function y = f9 (x,y)
    % x = dinero
    switch y
        case 0
            disp('Apostando a las docenas')
            dinero=[];
            dinero(1)=x;
            iter=2;
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
            dinero=[];
            dinero(1)=x;
            iter=2;
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
            
    end
end


