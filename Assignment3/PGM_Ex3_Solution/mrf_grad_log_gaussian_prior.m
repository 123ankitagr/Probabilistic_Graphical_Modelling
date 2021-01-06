function g = mrf_grad_log_gaussian_prior(T, sigma)
[n,m] = size(T);
T = double(T);
FH1 = zeros(n,m);
FH2 = zeros(n,m);
FV1 = zeros(n,m);
FV2 = zeros(n,m);

FH1(1:n-1,:) = -(T(1:n-1,:)-T(2:n,:))/(sigma^2);
FH2(2:n,:) = (T(1:n-1,:)-T(2:n,:))/(sigma^2);
FV1(:,1:m-1) = -(T(:,1:m-1)-T(:,2:m))/(sigma^2);
FV2(:,2:m) = (T(:,1:m-1)-T(:,2:m))/(sigma^2);

g = FH1+FH2+FV1+FV2;
end