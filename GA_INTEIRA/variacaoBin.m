function POPn = variacaoBin(POP)
    [numPOP, tamBits] = size(POP);
    POPn = zeros(numPOP, tamBits);
    for i = 1:numPOP
        pcorte = randperm(tamBits, 1);
        p = randperm(numPOP, 2);
        POPn(i,:) = [POP(p(1), 1:pcorte) POP(p(2), pcorte+1:end)];
        %mutação
        r = randperm(tamBits, 1);
        POPn(i, r) = 1-POPn(i,r);
    end
end