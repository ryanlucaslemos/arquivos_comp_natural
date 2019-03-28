function [POP,FX] = selecao(POP,FX,tamPOP)
    numPOP = size(FX,1);
    [~, ind] = sort(FX);
    ind = ind(1:round(0.1*tamPOP));
    r = randperm(numPOP);
    ind = [ind; r'];
    ind = ind(1:tamPOP);
    POP = POP(ind,:);
    FX = FX(ind,:);
end