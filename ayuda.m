function y = ayuda(aleatorio)
hayAs=0;
if(aleatorio <= 4)
     %AS
     hayAs=1;
     aleatorio = 11;
 elseif(aleatorio >= 5 && aleatorio <= 8)
     %2
     aleatorio = 2;
     
 elseif(aleatorio >= 9 && aleatorio <= 12)
     %3
     aleatorio = 3;
     
 elseif(aleatorio >= 13 && aleatorio <= 16)
     %4
     aleatorio = 4;
     
 elseif(aleatorio >= 17 && aleatorio <= 20)
     %5
     aleatorio = 5;
     
 elseif(aleatorio >= 21 && aleatorio <= 24)
     %6
     aleatorio = 6;
     
 elseif(aleatorio >= 25 && aleatorio <= 28)
     %7
     aleatorio = 7;
     
 elseif(aleatorio >= 29 && aleatorio <= 32)
     %8
     aleatorio = 8;
     
 elseif(aleatorio >= 33 && aleatorio <= 36)
     %9
     aleatorio = 9;
     
 elseif(aleatorio >= 37 && aleatorio <= 52)
     %figura o 10
     aleatorio = 10;  
end
y =aleatorio;
%resultado(1) = aleatorio;
%resultado(2) =hayAs;
%resultado

