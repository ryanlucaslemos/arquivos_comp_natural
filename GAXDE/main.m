clear vars; %limpa variaveis
close all; %fecha todas as figuras
clc; %limpa a tela
xmin = -5;
xmax = 5;
tamPOP = 20;
numVAR = 2;
numGER = 500;
numBits = 10;
maxFX = numGER*tamPOP;
X = xmin+rand(tamPOP, numVAR) * (xmax-xmin);
FX = calcularFX(X);
XDE = X;
FXDE = FX;
XGA = X;
FXGA = FX;
XBIN = round(rand(tamPOP, numVAR*numBits));
FXBIN = calcularFX(converteBinReal(XBIN, xmax, xmin, numVAR));
numFX = tamPOP;
count = 0;
minGA = zeros();
minGABIN = zeros();
minDE = zeros();

counters = zeros();


while(numFX < maxFX)
    [XDE,FXDE, numFX] = de(XDE,FXDE, tamPOP, numFX, numVAR);
    [XGA, FXGA]= GA(XGA,FXGA, xmin, xmax, tamPOP);
    [XBIN, FXBIN]= ga_inteira(XBIN, FXBIN, xmax, xmin, numVAR, tamPOP);
    if(mod(count, 100) == 0)
        pos = count/100 +1;
        counters(pos, :) = count;
        minGA(pos, :) = min(FXGA);
        minGABIN(pos, :) = min(FXBIN);
        minDE(pos, :) = min(FXDE);
        
        plot(counters(:,1), minGA(:,1), counters(:,1), minDE(:,1), counters(:,1), minGABIN(:,1));
        legend('GA', 'DE', 'GA BIN');
        drawnow();
    end
    count = count +1;
end
disp('DE ')
min(FXDE)
disp('GA ')
min(FXGA)
disp('GA Binária ')
min(FXBIN)
