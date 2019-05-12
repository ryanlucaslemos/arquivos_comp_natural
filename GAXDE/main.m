clear vars; %limpa variaveis
close all; %fecha todas as figuras
clc; %limpa a tela
xmin = -5;
xmax = 5;
tamPOP = 200;
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
POPSO = X;
FXPSO = FX;
numFX = tamPOP;
count = 0;
minGA = zeros();
minGABIN = zeros();
minDE = zeros();
minPSO = zeros();

counters = zeros();


%%%% Ajustável


Vmax = 0.1 * (xmax - xmin);

V = (rand(tamPOP,numVAR) - 0.5) * (xmax - xmin);
V = max(-Vmax,V);
V = min(Vmax,V);

% Atualização do PBEST
POPp = POPSO;
FXp = FXPSO;

% Atualização do GBEST
[~,ind] = min(FXp);
POPg = POPp(ind,:);
FXg = FXp(ind);


while(numFX < maxFX)
    [XDE,FXDE, numFX] = de(XDE,FXDE, tamPOP, numFX, numVAR);
    [XGA, FXGA]= GA(XGA,FXGA, xmin, xmax, tamPOP);
    [XBIN, FXBIN]= ga_inteira(XBIN, FXBIN, xmax, xmin, numVAR, tamPOP);
    [POPp, FXp, POPg, FXg] =  pso(V, Vmax, POPSO, FXp, POPp, FXg, POPg, FXPSO, tamPOP);
    if(mod(count, 100) == 0)
        pos = count/100 +1;
        counters(pos, :) = count;
        minGA(pos, :) = min(FXGA);
        minGABIN(pos, :) = min(FXBIN);
        minDE(pos, :) = min(FXDE);
        minPSO(pos, :) = FXg;
        minPSO
        
        plot(counters(:,1), minGA(:,1), counters(:,1), minDE(:,1), counters(:,1), minGABIN(:,1),counters(:,1), minPSO(pos, :));
        legend('GA', 'DE', 'GA BIN', 'PSO');
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

disp('PSO ')
FXg