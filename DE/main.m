clear vars; %limpa variaveis
close all; %fecha todas as figuras
clc; %limpa a tela
xmin = -5;
xmax = 5;
tamPOP = 20;
numVAR = 2;
numGER = 500;
maxFX = 100000;
POP = xmin+rand(tamPOP, numVAR) * (xmax-xmin);
FX = calcularFX(POP);
numFX = tamPOP;

while(numFX < maxFX)
    for i=1:tamPOP
        R=randperm(tamPOP, 3);
        pNOVO = POP(R(1),:)+(POP(R(2),:)-POP(R(3),:));
        j = randperm(numVAR, 1);
        for d=1:numVAR
            if((rand<=0.5) && (d~=j))
                pNOVO(d) = POP(i,d);
            end
        end
        fxNOVO = calcularFX(pNOVO);
        numFX = numFX + 1;
        if(fxNOVO <= FX(i))
            POP(i,:) = pNOVO;
            FX(i) = fxNOVO;
        end
    end
end
min(FX)