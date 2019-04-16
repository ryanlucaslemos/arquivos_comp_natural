function POPreais = converteBinReal(valores, xmax, xmin, numVAR)
   [tamBin, numBits] = size(valores); % o tamanho total do indivíduo (número de colunas total)
    numBits = numBits / numVAR; % o tamanho em bits de cada variável
    delta = xmax - xmin;
    
    POPreais = zeros(tamBin, numVAR);
    fator = (2^numBits)-1;
    for i=1:tamBin
        for d = 1:numVAR
            inicio = numVAR * (d - 1);
            %resultado da soma do numero para inteiro
            sum = 0;
            %for que percorre as posições da string começando pela ultima
            for j = 1:numBits
                %somando o valor anterior acrescido ao atual multiplicado pelo
                %valor em binário
                sum = sum + (valores(i,inicio+j)* 2^(numBits-j));
            end
        end
        POPreais(i, d) = xmin + sum * (delta / fator);
    end
end