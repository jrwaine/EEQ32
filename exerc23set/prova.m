% denominator
a=[1];
% numerator
b=zeros(1, 24);
b(1) = 0.5;
b(24) = 0.5;

[h, w] = freqz(b, a);

magresp = 20*log10(abs(h));
maxresp = max(magresp);

plot(w/pi, 20*log10(abs(h)));
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')


[hh, ff] = freqz(b, a, 23, 2760);

plot(ff, abs(hh))