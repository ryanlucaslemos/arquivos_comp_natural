function FIT = calculaFitness(FX)
    TAMFX = size(FX, 1);
   
    fxMAX = max(FX);
    fxMIN = min(FX);
    fator = 100;
    FIT = zeros(TAMFX, 1);
    deltaFX = fxMAX-fxMIN;
    for i=1:TAMFX
       FIT(i)= fator - ((FX(i) - fxMIN)/deltaFX);
    end
end