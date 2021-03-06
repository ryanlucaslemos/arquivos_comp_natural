clear vars; %limpa variaveis
close all; %fecha todas as figuras
clc; %limpa a tela
%global progresso;
xmin = -5;
xmax = 5;
tamPOP = 20;
numVAR = 1;
numGER = 500;
numBits = 10;
POP = round(rand(tamPOP, numVAR*numBits));
%inteiros = converteBinInt(POP);
FX = calcularFX(converteBinReal(POP, xmax, xmin, numVAR));
for i = 1:numGER
    %progresso = i / numGER;
    POPnovo = variacaoBin(POP);
    FXnovo  = calcularFX(converteBinReal(POPnovo, xmax, xmin, numVAR));
    POP = [POP;POPnovo];
    FX = [FX; FXnovo];
    [POP, FX] = selecao(POP,FX,tamPOP);
end

min(FX)