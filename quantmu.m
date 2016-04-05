function quant = quantmu(x, B, mu)
% this is mu law quantization
%xmax = max(abs(x));
denom = log(1+mu);
sign_in = sign(x);
L = length(x);
quant = zeros(size(x), 'double');
for i=1:L
    %quant(i) = xmax(1)*((log(1+(mu*abs(x(i)))/xmax(1)))/denom)*sign(x(i));
    quant(i) = sign_in(i)*(log(1+(mu*abs(x(i))))/denom);
end
end
