function [POP, FX] = torneio(POP, FX, tamPOP)
    ind = zeros(tamPOP, 1);
    for i=1:tamPOP - 3
        R = randperm(size(POP, 1));
        if(FX(R(1)) <= FX(R(2)))
            ind(i) = R(1);
        else
            ind(i) = R(2);
        end
    end
    [~, R] = sort(FX);
    ind(end-2:end) = R(1:3);
    POP = POP(ind,:);
    FX = FX(ind);
end