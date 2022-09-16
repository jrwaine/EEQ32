%% Copyright (C) 2001 Alceo Carta Neto
%%
%% This file is part of Octave.
%%
%% Octave is free software; you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2, or (at your option)
%% any later version.
%%
%% Octave is distributed in the hope that it will be useful, but
%% WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with Octave; see the file COPYING.  If not, write to the Free
%% Software Foundation, 59 Temple Place - Suite 330, Boston, MA
%% 02111-1307, USA.

freq = 64;
ta = 10;
componente1 = senoide_get(1, -1, 1, freq, ta);
componente2 = senoide_get(0.2, -0.2, 5, freq, ta);
componente3 = senoide_get(2, -2, 12, freq, ta);
componente4 = senoide_get(1, -1, 14, freq, ta);

sum_components = componente1 + componente2 + componente3 + componente4;
low_band = componente1 + componente2;
high_band = componente3 + componente4;

% plot(times, componente1);
% plot(times, componente2);
% plot(times, componente3);
% plot(times, componente4);
% plot(times, sum_componentes);

% filtro sinc (janela retangular) passa baixa de 0.4pi.rad/s
% b = 0.4*sinc(0.4*(-25:25));

low_sinc_filter = sinc(2*8.5/64*(-1000:1000));
L = 10;
low_rect_filter = fir1(30, [8.5/64 ], "low", rectwin(31), "noscale");
high_pass_filter = fir1(30, [8.5/64 ], "high", rectwin(31), "noscale");

conv_res = conv(sum_components, low_rect_filter);
% plot(high_pass_filter, "o");

range_plot = 64;
plot(conv_res(1:range_plot));
hold;
plot(sum_components(1:range_plot));
plot(low_band(1:range_plot));
hold off;

legend('Convolution','low signal', 'low pass sum');

% fvtool(low_filter, 1)
% fvtool(conv_res, 1);

% title('Resultado filtro');
% xlabel('Amostras');
% ylabel('Amplitude (V)');
% grid;


%% uso: senoide(vp, vn, f, fa, t)
%% Plota uma onda senoidal de freq��ncia 'f' (Hz) , valor de pico
%%positivo 'vp' (V), valor de pico negativo 'vn' (V), intervalo de
%%tempo 't' (s) e freq��ncia de amostragem 'fa' (Hz).
function [Y] = senoide_get(vp, vn, f, fa, t)
    amostras = 0:(t*fa); %vetor de amostragem
    amplitude = (vp-vn)/2; %calcula a amplitude do sinal
    Y0 = (vp+vn)/2; %calcula o deslocamento do sinal em Y
    Y = Y0+(amplitude*sin((2*pi*f*amostras)/fa)); %calcula onda senoidal
%   plota gráfica da senoide
%   title('onda senoidal');xlabel('n�mero da amostra');ylabel('amplitude(V)');plot(amostras,Y);grid;
end

