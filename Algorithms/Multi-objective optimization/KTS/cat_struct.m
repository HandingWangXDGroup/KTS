function C = cat_struct(A, B)
if isempty(A)
    
     C = B;
else

C = struct();
for f = fieldnames(A)'
   C.(f{1}) = [A.(f{1}); B.(f{1})];
end

end
end