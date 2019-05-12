clear vars;
close all;
clc;

xmin = -5;
xmax = 5;
numPOP = 100; % FIXO
numVAR = 2;
maxGER = 100;      %%%%%%%%%%%% Ajustável
alpha = 1;          %%%%%%%%%%%% Ajustável
betha = [0.3 0.1];  %%%%%%%%%%%% Ajustável

Vmax = 0.1 * (xmax - xmin);

POP = xmin + rand(numPOP,numVAR) * (xmax - xmin);
FX = rastrigin(POP);

V = (rand(numPOP,numVAR) - 0.5) * (xmax - xmin);
V = max(-Vmax,V);
V = min(Vmax,V);

% Atualização do PBEST
POPp = POP;
FXp = FX;

% Atualização do GBEST
[~,ind] = min(FXp);
POPg = POPp(ind,:);
FXg = FXp(ind);

for g = 1:maxGER
    progresso = g / maxGER;
    betha = [0.5 0.5] * progresso;
    alpha = max(progresso , 1 - progresso);
    for i = 1:numPOP
        V(i,:) = alpha * V(i,:) + betha(1) * (POPp(i,:) - POP(i,:)) + ...
                                  betha(2) * (POPg - POP(i,:));
        V(i,:) = max(-Vmax,V(i,:));
        V(i,:) = min(Vmax,V(i,:));
                              
        POP(i,:) = POP(i,:) + V(i,:);
        POP(i,:) = max(POP(i,:),xmin);
        POP(i,:) = min(POP(i,:),xmax);
        FX(i,:) = rastrigin(POP(i,:));
        
        if (FX(i,:) < FXp(i,:)) % Se é melhor que o PBEST
            FXp(i,:) = FX(i,:);
            POPp(i,:) = POP(i,:);
            
            if (FX(i,:) < FXg) % Se é melhor que o GBEST
                FXg = FX(i,:);
                POPg = POP(i,:);
            end
        end
    end
    
    clf;
    hold on;
    plot(POP(:,1),POP(:,2),'bo');
    plot(POPg(:,1),POPg(:,2),'rx');
    plot(POPp(:,1),POPp(:,2),'gv');
    axis([-5 5 -5 5]);
    xlabel([num2str(FXg) ' - ' num2str(g)]);
    grid on;
    drawnow;
    pause(0.1);
end