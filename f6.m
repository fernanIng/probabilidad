dinero=[];
dinero(1)=100;
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


