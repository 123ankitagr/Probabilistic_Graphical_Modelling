%Submission for Ankit Agrawal(2581532) and Akshay Joshi(2581346).
%Task 2: Maximal Marginal States

function maxstates = sumproduct(pairwisePots, unaryPots)

%pairwisePots = learnPairwisePots(train);
maxstates = zeros(6,2);

%for torso
likelihood_torso = unaryPots{1,6};
feature_torso = cell(1, 6);
feature_torso{1,6} = likelihood_torso;
marginal1 = likelihood_torso;

for i=1:5
    img_mean = pairwisePots{6,1}(i,:);
    cov = pairwisePots{6,2}(i,:);
    img_cov = [sqrt(cov(1)) sqrt(cov(2))];
    
    % using convolution:
    x = floor(-6*img_cov(1)):ceil(6*img_cov(1));
    y = floor(-6*img_cov(2)):ceil(6*img_cov(2));
    gauss_x = 1/sqrt(2*pi*img_cov(1))*exp(-(x-0).^2/img_cov(1));
    gauss_y = 1/sqrt(2*pi*img_cov(2))*exp(-(y-0).^2/img_cov(2));
    simg = shiftimg(unaryPots{1,i}, -img_mean, 0);

    feature_torso{1,i} = conv2(gauss_x,gauss_y,simg,'same');
    marginal1 = feature_torso{1,i} .* marginal1;   
end

%all others likelihoods
    for i=1:5
        marginal2 = marginal1 ./feature_torso{1,i};
        img_mean = pairwisePots{i,1}(6,:);
        cov = pairwisePots{i,2}(6,:);
        img_cov = [sqrt(cov(1)) sqrt(cov(2))];
        
        % using convolution:
        x = floor(-6*img_cov(1)):ceil(6*img_cov(1));
        y = floor(-6*img_cov(2)):ceil(6*img_cov(2));
        gauss_x = 1/sqrt(2*pi*img_cov(1))*exp(-(x-0).^2/img_cov(1));
        gauss_y = 1/sqrt(2*pi*img_cov(2))*exp(-(y-0).^2/img_cov(2));
        simg = shiftimg(marginal2, -img_mean, 0);
        
        marginal2 = conv2(gauss_x,gauss_y,simg,'same') .* unaryPots{1,i};
        [maxstates(i,2),maxstates(i,1)] = find(marginal2==max(max(marginal2)));  
    end

%marginal for torso
[maxstates(6,2),maxstates(6,1)] = find(marginal1==max(max(marginal1)));



