function POPnovo = cruzamento(POP, xmin, xmax)
  [tamPOP, numVAR] = size(POP);
  POPnovo = zeros(tamPOP, numVAR);
  global progresso;
  for i =1:tamPOP
      r = randperm(tamPOP);
    % cruzamento
      POPnovo(i,:) = POP(r(1),:) + (2 * rand - 0.5) *(POP(r(2),:)-POP(r(1),:));
    % mutação
      if(rand<0.2+0.3*progresso)
        POPnovo(i,:) = POPnovo(i, :) + 0.2 *(1-progresso) * (rand(1,numVAR)-0.5)*(xmax-xmin); 
      end
  end
  
      POPnovo = max(POPnovo, xmin);
      POPnovo = min(POPnovo, xmax);
end