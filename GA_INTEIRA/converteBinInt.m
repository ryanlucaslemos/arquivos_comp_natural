function inteiros = converteBinInt(valores)
    tamBin = size(valores, 1);
    inteiros = zeros(tamBin, 1);
   
    for i=1:tamBin
        %resultado da soma do numero para inteiro
        sum = 0;
        %transformando o n�mero em uma string
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
        inteiros(i) = sum;
    end
end