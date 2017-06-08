function [valores,as,suma] = mano
    
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