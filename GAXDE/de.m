function [POP,FX, numFX] = de(POP,FX, tamPOP, numFX, numVAR)
    for i=1:tamPOP
        R=randperm(tamPOP, 3);
        pNOVO = POP(R(1),:)+rand*(POP(R(2),:)-POP(R(3),:));
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