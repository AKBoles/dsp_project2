clear all
close all

%load file
filename = 'no_type.wav';

%audioread to get wave and sample rate
[y,Fs] = audioread(filename); % y->actual data ; Fs->sample rate in Hz
B = 6; %number of bits to quantize by
quant = quantize(y, B); %simple quantize function
samples = [1,20*Fs]
size(y)
%compare the first 5 sec of the song vs quant
[y1,Fs1] = audioread(filename,samples);
quant1 = quantize(y1,B);
size(quant1)
size_dif = size(y) / size(quant1)
%now find different sections of song: 1 sec, 5 sec, 10 sec
seg1 = y(Fs*20 : Fs*21); %one second
seg2 = y(Fs*20 : Fs*30); %ten seconds
seg3 = y(Fs*20 : Fs*120); %60 seconds
quant_seg1 = quantize(seg1, B);
quant_seg2 = quantize(seg2, B);
quant_seg3 = quantize(seg3, B);

%plotting
%figure()
%plot(abs(y)); % plot of the freq domain coefficients WITHOUT
                % any relation to the sample rate
                % uncomment to see a pointless graph
                
%plot original wav file
plotfft(y,Fs,length(y));
%now plot quant
plotfft(quant,Fs,length(quant));
%now plot quant1
plotfft(quant1,Fs1,length(quant1));
%plot segments to compare
plotfft(seg1,Fs,length(seg1));
plotfft(quant_seg1,Fs,length(quant_seg1));
plotfft(seg2,Fs,length(seg3));
plotfft(quant_seg2,Fs,length(quant_seg2));
plotfft(seg3,Fs,length(seg3));
plotfft(quant_seg3,Fs,length(quant_seg3));


%plot the number of sample signals in each interval -> from sos
% [x,fs]=audioread(filename);
% L=length(x);
% x1=x/max(abs(x)); %normalize the signal
% n=zeros(1,16);
% for i=1:L
%  if-1<=x1(i)&&x1(i)<-1/2
%  n(1,1)= n(1,1)+1;
%  elseif-1/2<=x1(i)&&x1(i)<-1/4
%  n(1,2)=n(1,2)+1;
%  elseif-1/4<=x1(i)&&x1(i)<-1/8
%  n(1,3)=n(1,3)+1;
%  elseif-1/8<=x1(i)&&x1(i)<-1/16
%  n(1,4)=n(1,4)+1;
%  elseif-1/16<=x1(i)&&x1(i)<-1/32
%  n(1,5)=n(1,5)+1;
%  elseif-1/32<=x1(i)&&x1(i)<-1/64
%  n(1,6)= n(1,6)+1;
%  elseif-1/64<=x1(i)&&x1(i)<-1/128
%  n(1,7)=n(1,7)+1;
%  elseif-1/128<=x1(i)&&x1(i)<0
%  n(1,8)=n(1,8)+1;
%  elseif 0<=x1(i)&&x1(i)<1/128
%  n(1,9)=n(1,9)+1;
%  elseif 1/128<=x1(i)&&x1(i)<1/64
%  n(1,10)=n(1,10)+1;
%  elseif 1/64<=x1(i)&&x1(i)<1/32
%  n(1,11)=n(1,11)+1;
%  elseif 1/32<=x1(i)&&x1(i)<1/16
%  n(1,12)=n(1,12)+1;
%  elseif 1/16<=x1(i)&&x1(i)<1/8
%  n(1,13)=n(1,13)+1;
%  elseif 1/8<=x1(i)&&x1(i)<1/4
%  n(1,14)=n(1,14)+1;
%  elseif 1/4<=x1(i)&&x1(i)<1/2
%  n(1,15)=n(1,15)+1;
%  elseif 1/2<=x1(i)&&x1(i)<1
%  n(1,16)=n(1,16)+1;
%  end
%figure(3)
%plot(n)
%end