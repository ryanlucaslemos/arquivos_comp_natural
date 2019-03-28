clear vars; %limpa variaveis
close all; %fecha todas as figuras
clc; %limpa a tela
global progresso;
xmin = -5;
xmax = 5;
tamPOP = 20;
numVAR = 2;
numGER = 500;
X = xmin + rand(tamPOP, numVAR)*(xmax-xmin);
FX = calcularFX(X);
% XX = xmin:0.1:xmax;
% FXX = calcularFX(XX);

%plot(X,FX, 'ro');
for i = 1:numGER
    progresso = i / numGER;
    Xnovo = cruzamento(X,xmin,xmax);
    FXnovo = calcularFX(Xnovo);
    X = [X;Xnovo];
    FX = [FX; FXnovo];
    [X, FX] = roleta(X,FX,tamPOP);
%     if(mod(i,2)==0)
%         [X, FX] = torneio(X,FX,tamPOP);
%     else
%         [X, FX] = selecao(X,FX,tamPOP);
%     end
%     
%     clf;
%     hold on;
%     plot (XX, FXX, 'k-');
    plot(X(:,1),X(:,2), 'ro');
    axis([xmin xmax xmin xmax]);
    xlabel(num2str(min(FX)));
    grid on;
    drawnow();
end
X
min(FX)