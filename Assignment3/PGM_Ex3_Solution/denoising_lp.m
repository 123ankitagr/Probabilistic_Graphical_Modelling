function lp = denoising_lp(T, N, sigma)
[n,m] = size(T);
log_likelihood = -(norm(N-T)^2)/(2*sigma^2);

%prior
FH = T(1:n-1,:) - T(2:n,:);
FV = T(:,1:m-1) - T(:,2:m);
log_prior = -(norm(FH)^2+norm(FV)^2)/(2*sigma^2);

%posterior
lp = log_likelihood + log_prior;
end

