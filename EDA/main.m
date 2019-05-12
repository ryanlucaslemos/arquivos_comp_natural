 %Gaussian UMDA for  the off-lattice HP Model continuous function 
 %For reference on the off-lattice HP model see (Hsu_and_Mehra_2003) 
 
 Fibbonacci_n = 7; % Fibbonacci_n: Value n for the construction of the Fibbonacci sequence. NumbVar = F(n)
 global InitConf;
 InitConf = CreateFibbInitConf(Fibbonacci_n); % HP Fibbonacci configuration 
 NumbVar = size(InitConf,2);
 PopSize = 1000; 
 F = 'EvaluateOffHPProtein';
 cache  = [0,0,0,0,0]; Card = [zeros(1,NumbVar);2*pi*ones(1,NumbVar)];
 edaparams{1} = {'learning_method','LearnGaussianUnivModel',{}};
 edaparams{2} = {'sampling_method','SampleGaussianUnivModel',{PopSize,3}};
 edaparams{3} = {'replacement_method','elitism',{1,'fitness_ordering'}};
 edaparams{4} = {'selection_method','prop_selection',{2}};
 edaparams{5} = {'repairing_method','SetInBounds_repairing',{}};
 [AllStat,Cache]=RunEDA(PopSize,NumbVar,F,Card,cache,edaparams) 
 % To draw the resulting solution use function OffPrintProtein(vector),
 % where vector is the best solution found.
 [AllStat,Cache]=RunEDA(PopSize,NumbVar,F,Card,cache,edaparams) 