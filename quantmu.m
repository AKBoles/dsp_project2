function quant = quantmu(x, B, mu)
% this is mu law quantization
xmax = max(abs(x));
denom = log(1+mu);
L = length(x);
quant = zeros(size(x), 'double');
for i=1:L
    quant(i) = xmax*((log(1+(mu*abs(x(i)))/xmax))/denom)*sign(x(i));
end



end
