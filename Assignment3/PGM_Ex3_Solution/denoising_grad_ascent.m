function T = denoising_grad_ascent(N, sigma, eta)
N = double(N);
T = N;
iter = 1000;
i=1;
%alpha=1;

while i<iter
    diff = denoising_grad_llh(T, N, sigma)+ mrf_grad_log_gaussian_prior(T, sigma);
    %diff = denoising_grad_llh(T, N, sigma)+mrf_grad_log_student_prior(T, sigma, alpha);
    T = T + diff*eta;
    i=i+1;
end
Min = min(min(T));
Max = max(max(T));
T = (T-Min)*(255/(Max-Min));
T = uint8(T);
end