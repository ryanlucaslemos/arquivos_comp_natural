function [X, FX]= GA(X,FX, xmin, xmax, tamPOP)
    Xnovo = cruzamento(X,xmin,xmax);
    FXnovo = calcularFX(Xnovo);
    X = [X;Xnovo];
    FX = [FX; FXnovo];
    [X, FX] = selecao(X,FX,tamPOP);
end