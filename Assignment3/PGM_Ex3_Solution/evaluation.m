%Submission for Ankit Agrawal(2581532) and Akshay Joshi(2581346).
%Evaluation

clear all;
close all;

%% median filtering
T1 = toy_stripes(250,250,25);
T2 = toy_checkerboard(250,250,25);
GN1 = add_noise(T1,25);
GN2 = add_noise(T2,25);
SNPN1 = add_sp_noise(T1,0.1);
SNPN2 = add_sp_noise(T2,0.1);
figure(1),imshow(T1);
figure(2),imshow(GN1);
figure(3),imshow(SNPN1);
figure(4),imshow(T2);
figure(5),imshow(GN2);
figure(6),imshow(SNPN2);
%psnr_T1_GN1 = calc_psnr(T1, GN1);
%psnr_T1_SNPN1 = calc_psnr(T1, SNPN1);
%psnr_T2_GN2 = calc_psnr(T2, GN2);
%psnr_T2_SNPN2 = calc_psnr(T2, SNPN2);

nsize = 7;
M1 = median_filter(SNPN1, nsize);
M2 = median_filter(SNPN2, nsize);
figure(7),imshow(M1);
figure(8),imshow(M2);

Tla = imread('la.png');
sigma = 25;
Nla = add_noise(Tla,sigma);
Mla = median_filter(Nla, nsize);

figure(9),imshow(Tla);
figure(10),imshow(Nla);
figure(11),imshow(Mla);

psnr_T1_SNPN1 = calc_psnr(T1, SNPN1);
psnr_T1_M1 = calc_psnr(T1, double(M1));

psnr_T2_SNPN2 = calc_psnr(T2, SNPN2);
psnr_T2_M2 = calc_psnr(T2, double(M2));

psnr_Tla_Nla = calc_psnr(double(Tla), double(Nla));
psnr_Tla_Mla = calc_psnr(double(Tla), double(Mla));


%% MRF with Gradient ascent
sigma = 25; eta = 1;
MRF1 = denoising_grad_ascent(SNPN1, sigma, eta);
psnr_T1_MRF1 = calc_psnr(T1, double(MRF1));
MRF2 = denoising_grad_ascent(SNPN2, sigma, eta);
psnr_T2_MRF2 = calc_psnr(T2, double(MRF2));
figure(12),imshow(MRF1);
figure(13),imshow(MRF2);

MRFla = denoising_grad_ascent(Nla, sigma, eta);
psnr_Tla_MRFla = calc_psnr(double(Tla), double(MRFla));
figure(14),imshow(MRFla);

%% MRF with student prior

sigma = 25; eta = 1;
MRF1_1 = denoising_grad_ascent(SNPN1, sigma, eta);
psnr_T1_MRF1_1 = calc_psnr(T1, double(MRF1_1));
MRF2_1 = denoising_grad_ascent(SNPN2, sigma, eta);
psnr_T2_MRF2_1 = calc_psnr(T2, double(MRF2_1));
figure(15),imshow(MRF1_1);
figure(16),imshow(MRF2_1);

MRFla_1 = denoising_grad_ascent(Nla, sigma, eta);
psnr_Tla_MRFla_1 = calc_psnr(double(Tla), double(MRFla_1));
figure(17),imshow(MRFla_1);


