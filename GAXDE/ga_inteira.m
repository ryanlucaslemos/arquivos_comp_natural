function [X,FX] = ga_inteira(X,FX, xmax, xmin, numVAR, tamPOP)
   xnovo = variacaoBin(X);
   FXnovo  = calcularFX(converteBinReal(xnovo, xmax, xmin, numVAR));
   X = [X;xnovo];
   FX = [FX; FXnovo];
   [X, FX] = selecao(X,FX,tamPOP);
end