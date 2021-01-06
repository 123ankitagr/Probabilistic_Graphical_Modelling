function g = mrf_grad_log_student_prior(T, sigma, alpha)
[n,m] = size(T);
FH1 = zeros(n,m);
FH2 = zeros(n,m);
FV1 = zeros(n,m);
FV2 = zeros(n,m);

difference1 = double(T(1:n-1,:)-T(2:n,:));
FH = double(1+(difference1.^2)/(2*sigma^2));
FH1(1:n-1,:) = -alpha/(sigma^2)*difference1.*FH.^(-1);
FH2(2:n,:) = alpha/(sigma^2)*difference1.*FH.^(-1);

difference2 = double(T(:,1:m-1)-T(:,2:m));
FV = double(1+(difference2.^2)/(2*sigma^2));
FV1(:,1:m-1) = -alpha/(sigma^2)*difference2.*FV.^(-1);
FV2(:,2:m) = alpha/(sigma^2)*difference2.*FV.^(-1);

g = FH1+FH2+FV1+FV2;
end