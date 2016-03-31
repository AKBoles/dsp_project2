function p_out = plotfft(p_in, Fs, N)
% plot input fft
f = Fs/N.*(0:N-1); %x-axis of plot
Y = fft(p_in,N); 
Y = abs(Y(1:N))./(N/2); % compute absolute values for plot and normalize to N
Y(Y==0) = eps; % avoid log(0) for eps (floating-point relative accuracy)
Y = 20.*log10(Y); % make into log spectrum
figure()
p_out = plot(f,Y);
grid on;
end