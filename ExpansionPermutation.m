function EF = ExpansionPermutation(halfMessage)
%Expansion permutation
EF = [halfMessage([32,4:4:28])',(reshape(halfMessage,4,8))',halfMessage([5:4:29,1])'];
EF = reshape(EF',1,48);
end






