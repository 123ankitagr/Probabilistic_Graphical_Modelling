%Submission for Ankit Agrawal(2581532) and Akshay Joshi(2581346).
%Task 3: Modes

function maxstates = minsum(pairwisePots, unaryPots)

DTval1 = cell(6,1);
shift1 = cell(6,1);
sum = zeros(size(unaryPots{1}));

%for torso
    for i=1:5
        shift1{i} = -log(shiftimg(unaryPots{1,i}, pairwisePots{i, 1}(6,:), eps));
        DTval1{i} = DT(shift1{i}, [pairwisePots{i,2}(6,1) 0;0 pairwisePots{i,2}(6,2)]);
        sum = sum + DTval1{i}; %as log
    end


marginal1 = sum - log(unaryPots{1,6});
%all others likelihoods
    for i=1:5
        shift2 = shiftimg(marginal1-DTval1{i},pairwisePots{6,1}(i,:), 1/eps);
        DTval2 = DT(shift2,[pairwisePots{i,2}(6,1) 0;0 pairwisePots{i,2}(6,2)]);
        
        marginal2 = DTval2 - log(unaryPots{1,i});
        
        [maxstates(i,2),maxstates(i,1)] = find(marginal2==min(min(marginal2)));  
    end

[maxstates(6,2),maxstates(6,1)] = find(marginal1==min(min(marginal1)));
end

