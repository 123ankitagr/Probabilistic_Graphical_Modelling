%Submission for Ankit Agrawal(2581532) and Akshay Joshi(2581346).
%Task 1: Learning Kinematic Priors

function pairwisePots = learnPairwisePots(train)

pairwisePots = cell(6,2);
    for i=1:6
        Lo = train{1,i};
        for j=1:6
            Li = train{1,j};
            diff_x = Li(:,1)-Lo(:,1);
            diff_y = Li(:,2)-Lo(:,2);
            img_mean(1,1) = mean(diff_x);
            img_mean(1,2) = mean(diff_y);
            img_cov(1,1) = cov(diff_x);
            img_cov(1,2) = cov(diff_y);
            pairwisePots{i,1}(j,:) = img_mean(1,:);
            pairwisePots{i,2}(j,:) = img_cov(1,:);
        end
    end

end

