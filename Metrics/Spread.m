function score = Spread(Population,optimum)
% <min>
% Spread

%------------------------------- Reference --------------------------------
% Y. Wang, L. Wu, and X. Yuan, Multi-objective self-adaptive differential
% evolution with elitist archive and crowding entropy-based diversity
% measure, Soft Computing, 2010, 14(3): 193-209.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2022 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

     PopObj = Population.best.objs;
    if size(PopObj,2) ~= size(optimum,2)
        score = nan;
    else
       
        Distance = pdist2(optimum,PopObj,'minkowski',1);
        score    = max(mean(min(Distance,[],1)),mean(min(Distance,[],2)));
    end
end