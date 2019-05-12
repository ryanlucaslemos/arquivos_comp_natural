function[POPp, FXp, POPg, FXg] =  pso(V, Vmax, POP, FXp, POPp, FXg, POPg, FX,  numPOP)
    alpha = 1;          %%%%%%%%%%%% Ajustável
    betha = [0.3 0.1];  %%%%%%%%%%%% Ajustável 
    xmin = -5;
    xmax = 5;
    for i = 1:numPOP
        V(i,:) = alpha * V(i,:) + betha(1) * (POPp(i,:) - POP(i,:)) + ...
                                  betha(2) * (POPg - POP(i,:));
        V(i,:) = max(-Vmax,V(i,:));
        V(i,:) = min(Vmax,V(i,:));
                              
        POP(i,:) = POP(i,:) + V(i,:);
        POP(i,:) = max(POP(i,:),xmin);
        POP(i,:) = min(POP(i,:),xmax);
        FX(i,:) = calcularFX(POP(i,:));
        
        if (FX(i,:) < FXp(i,:)) % Se é melhor que o PBEST
            FXp(i,:) = FX(i,:);
            POPp(i,:) = POP(i,:);
            
            if (FX(i,:) < FXg) % Se é melhor que o GBEST
                FXg = FX(i,:);
                POPg = POP(i,:);
            end
        end
    end
end