global DB_count_glob 
nvars = length(Final_thresholds);

% set up generic algorithm
Aeq = [];
beq = [];
LB = areas_of_final_thresholds( 1:2:(length(areas_of_final_thresholds)) );
UB = areas_of_final_thresholds( 2:2:(length(areas_of_final_thresholds)) );

Sum_of_starts = sum(areas_of_final_thresholds(1:2:length(areas_of_final_thresholds)));    %[1 3 5 7]));
Sum_of_ends = sum(areas_of_final_thresholds(2:2:length(areas_of_final_thresholds))) ;   %sum(areas_of_final_thresholds([2 4 6 8]));

A = [ones(1,length(Final_thresholds)); -ones(1,length(Final_thresholds))];
b = [Sum_of_ends; -Sum_of_starts];

rng default % For reproducibility

options = optimoptions('ga','ConstraintTolerance',1e-6,'PlotFcn', @gaplotbestf);

%options = optimoptions('ga','ConstraintTolerance',1e-6,'PlotFcn', @gaplotbestf,'PopulationSize',20,'CrossoverFraction',0.8);%'MutationFcn',{@mutationuniform,0.01});

% calculate and plot the best DB index, clculated with GA
[Final_thresholds_after_GA,fval,exitflag,output,population,scores] = ga(@calc_DB_for_GA,nvars,A,b,Aeq,beq,LB,UB,[],[],options);
xlim([0,25])
ylim([fval-0.001, fval+0.0055])
Final_thresholds_after_GA = round(Final_thresholds_after_GA);

DB_after_GA = fval;


% arrange the search areas in one cell array 
count =1;
for i = 1:2:length(areas_of_final_thresholds)-1
    
s1 = num2str(areas_of_final_thresholds(i));
s2 = '-';
s3 = num2str(areas_of_final_thresholds(i+1));
s{count}= strcat(s1,s2,s3);
count = count +1;
end

disp('Final seaech area for GA: ')
disp(s)
disp(['Final thresholds before GA= ', num2str(Final_thresholds_after_GA)])
disp(['Final DB after GA= ', num2str(DB_after_GA)])
