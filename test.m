clear all
close all

%load file
%filename = 'no_type.wav';
filename = 'record1.wav';

%audioread to get wave and sample rate
[y,Fs] = audioread(filename); % y->actual data ; Fs->sample rate in Hz
B = 10; %number of bits to quantize by
quant = quantize(y, B); %uniform quantize function
%mu-law quantization
quant_mu = quantmu(y, B, 1);
quant_mu1 = quantmu(y, B, 8);
quant_mu2 = quantmu(y, B, 100);
quant_mu3 = quantmu(y, B, 255);

%plot the different mu-law quantizations
figure()
plot(y, quant_mu, y, quant_mu1, y,quant_mu2, y, quant_mu3)
title('Varying mu-law Quantizations')
xlabel('y(n)')
ylabel('Quantized signal(n)')
legend('mu=1','mu=8','mu=100','mu=255','Location','southeast')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %compare the first 5 sec of the song vs quant
% [y1,Fs1] = audioread(filename,samples);
% quant1 = quantize(y1,B);
% fmax_samples = Fs1 / 2
% size_dif = size(y) / size(quant)
% %now find different sections of song: 1 sec, 5 sec, 10 sec
% seg1 = y(Fs*20 : Fs*21); %one second
% seg2 = y(Fs*20 : Fs*30); %ten seconds
% seg3 = y(Fs*20 : Fs*120); %60 seconds
% quant_seg1 = quantize(seg1, B);
% quant_seg2 = quantize(seg2, B);
% quant_seg3 = quantize(seg3, B);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
