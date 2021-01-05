%Submission for Ankit Agrawal(2581532) and Akshay Joshi(2581346).
%Task 4: Evaluation

clear all;
load('data.mat');

pairwisePots = learnPairwisePots(train);
true_sumproduct = 0;
true_minsum = 0;
true_likelihood = 0;

%we need to substract 80/2 i.e. 40 for the horizontal centering as the size
%of box is 80 horizontally
%similarly we need to substract 200/3 i.e. 66.67 for vertical offset as ration is 1:2
offset = [-40 -66.667];

for i=1:100
    unaryPots = likelihoods(i,:);
    
    %minsum
    maxstates_minsum = minsum(pairwisePots, unaryPots);
    torsoCenter = maxstates_minsum(6,:);
    detectbox = [torsoCenter + offset 80 200];
    true_minsum = true_minsum+(boxoverlap(detectbox, GT(i,:))>0.5);
    
    
    %sumproduct
    maxstates_sumproduct = sumproduct(pairwisePots, unaryPots);
    torsoCenter = maxstates_sumproduct(6,:);
    detectbox = [torsoCenter + offset 80 200];
    true_sumproduct = true_sumproduct+(boxoverlap(detectbox, GT(i,:))>0.5);
    
    
    %likelihood
    [l_y,l_x] = find(unaryPots{1,6}==max(max(unaryPots{1,6})));
    torsoCenter = [l_x l_y];
    detectbox = [torsoCenter + offset 80 200];
    true_likelihood = true_likelihood+(boxoverlap(detectbox, GT(i,:))>0.5);
end


accuracy_minsum = true_minsum/100;
accuracy_sumproduct = true_sumproduct/100;
accuracy_likelihood = true_likelihood/100;
fprintf('Submission for Ankit Agrawal, 2581532 and Akshay Joshi, 2581346: \n')
fprintf('\nMinsum accuracy: %f', accuracy_minsum);
fprintf('\nSumproduct accuracy: %f', accuracy_sumproduct);
fprintf('\nLikeligood accuracy: %f', accuracy_likelihood);





