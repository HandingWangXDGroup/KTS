function Score = IGD_plus(PopObj ,PF)
% <min>
% Inverted generational distance

%------------------------------- Reference --------------------------------
% C. A. Coello Coello and N. C. Cortes, Solving multiobjective optimization
% problems using an artificial immune system, Genetic Programming and
% Evolvable Machines, 2005, 6(2): 163-190.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

%     Distance = min(pdist2(PF,PopObj),[],2);
%     Score    = mean(Distance);
%     filepath3 = strcat('C:\Users\zssong\Desktop\KTA2全部文档\zssong\Data\Data\KRVEA\');
%     di3 = dir([filepath3,'\*.mat']);
%     di3(((7-1)*30)+1).name;
%     load(strcat(filepath3,'\',di3(((7-1)*30)+1).name));
%     Feasible     = find(all(Population.cons<=0,2));
%     NonDominated = NDSort(Population(Feasible).objs,1) == 1;
%     Population   = Population(Feasible(NonDominated));

%     PopObj =  Population.objs;
    
% PF = real;
PopObj = PopObj.best.objs;
if  size(PopObj,2) ~= size(PF,2)
    Score = nan;
else

    Distance = min(pdist2(PF,PopObj),[],2);
    Score1    = mean(Distance);
    [x, z]= size(PopObj);
    y = size(PF,1);
    va = zeros(x,z);
    distance = zeros(1,y);
 for i = 1:y  
    obj = repmat(PF(i,:),x,1); 
    a = max((PopObj-obj),va);
    b = a.^2;
    c = sum(b,2);
    distance(i)  = min(sqrt(sum((max((PopObj-obj),va)).^2,2)));
 end  
    Score    = mean(distance);  
end

 end