z = [-1i ; 1i];
p = [0 ; -0.5];

tf = zpk(z, p, 1);
display(tf);
zplane(z, p);
[num, den] = tfdata(tf);
display(num{1});
display(den{1});
freqz(num{1}, den{1}, 'whole', 2001);
