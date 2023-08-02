function Population = givevalue(Population, N)

 for f = fieldnames(Population)'
    Population.(f{1}) = Population.(f{1})(N,:); 
 end


end
