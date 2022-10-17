% frequencia de corte (Hz)
fc = 8;
% taxa de amostragem (Hz)
ta = 64;

% Sinal amostrado com taxa ta
t = 0:1/ta:1;
xn = 3*sin(2*pi*5*t) + 5*sin(2*pi*12*t) + 2*sin(2*pi*14*t);

% frequencia de corte normalizada (rad)
wc = (fc/ta)*2*pi;

M = 15;
% Vetor auxiliar de amostragem
aux = [0:(M-1)];
% Frequencia normalizada dos pontos
w = (aux/M)*2*pi;

% Calculo de módulo e fase do filtro
moduloH = (w <= wc | w >= (2*pi-wc));
faseH = (M-1)/2*w;
% Combinar módulo e filtro
H = moduloH.*exp(-1j*faseH);
% Calcular a IDFT do filtro H
h = real(ifft(H));

% Plot resposta ao impulso
stem(h);

yn = conv(xn, h);

% Plot y[n] = x[n] * h[n]
stem(yn);

% FFT do filtro H
fft_h = fft(yn);
m = abs(fft_h);
fft_h(m<1e-6) = 0;
p = unwrap(angle(fft_h));

f = (0:(length(fft_h)-1))*ta/length(fft_h);        % Frequency vector

% Plot frequency gain and phase
subplot(2,1,1)
plot(f,m)
title('Magnitude')

subplot(2,1,2)
plot(f,p*180/pi)
title('Phase')

% 8. Qual o ganho teórico para a componente de 12Hz depois do filtro ?
% O ganho teórico é de 0 para componente de 12Hz após o filtro.
% O ganho é de 5.55e-17 (0)
m_12gain = m(12);

% 9. Qual o valor obtido da componente de 12Hz?
% O valor obtido é de 0.3074 para componente 12Hz em y[n], sem normalização

% 10. Como você faria para obter o filtro passa altas do mesmo sistema, 
% ou seja, paraobter um sistema que eliminasse a componente de 5Hz de x[n]?

% Para obter um filtro passa alta, basta "inverter" as condições do filtro,
% ou seja, onde ele é 1 colocar 0 e onde é 0 colocar 1.

