function [POP,FX] = roleta(POP,FX,tamPOP)
    numPOP = size(FX,1);
    FIT = calculaFitness(FX);
    FIT = FIT/sum(FIT);
    numElite = 5;
    [~, elite] = sort(FIT, 'descend');
    ind(1:numElite) = elite(1:numElite);
    
    for i=numElite+1:tamPOP
        soma = 0;
        r = rand;
        for j=1:numPOP
            soma = soma+FIT(j);
            if(soma>=r)
                ind(i) = j;
                break;
            end
        end
    end
    POP = POP(ind,:);
    FX = FX(ind,:);
end