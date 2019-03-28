function POPreais = converteIntReal(xmax, xmin, POPint, numBits)
    tamPOP = size(POPint,1);
    delta = xmax - xmin;
    POPreais = zeros(tamPOP, 1);
    fator = (2^numBits)-1;
    for i=1:tamPOP
        POPreais(i) = (xmin + POPint(i) * delta) / fator;
    end
end