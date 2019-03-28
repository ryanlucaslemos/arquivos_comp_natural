function POPreais = converteBinReal(valores, xmax, xmin, numBits)
    tamBin = size(valores, 1);
    delta = xmax - xmin;
    
    POPreais = zeros(tamBin, 1);
    fator = (2^numBits)-1;
    for i=1:tamBin
        %resultado da soma do numero para inteiro
        sum = 0;
        %inicializa��o do valor que o 2 ser� elevado
        elevate = 0;
        %for que percorre as posi��es da string come�ando pela ultima
        for j = size(valores(i,:),2):-1:1
            %somando o valor anterior acrescido ao atual multiplicado pelo
            %valor em bin�rio
            sum = sum + (valores(i,j)*(2^elevate));
            %aumenta a variavel que eleva o 2
            elevate = elevate +1;
        end
        POPreais(i) = (xmin + sum * delta) / fator;
    end
end