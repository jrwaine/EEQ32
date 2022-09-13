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

%% uso: senoide(vp, vn, f, fa, t)
%%
%% Plota uma onda senoidal de freqüência 'f' (Hz) , valor de pico
%%positivo 'vp' (V), valor de pico negativo 'vn' (V), intervalo de
%%tempo 't' (s) e freqüência de amostragem 'fa' (Hz).

function [Y]=senoide(vp, vn, f, fa, t)

	amostras=1:(t*fa); %vetor de amostragem

	amplitude=(vp-vn)/2; %calcula a amplitude do sinal

	Y0=(vp+vn)/2; %calcula o deslocamento do sinal em Y

 	Y=Y0+(amplitude*sin((2*pi*f*amostras)/fa)); %calcula onda senoidal

 	%plota gráfico da senóide
	title('onda senoidal');xlabel('número da amostra');ylabel('amplitude(V)');plot(amostras,Y);grid;

end

