clear;
clc;
close all;

h11 = tf([0.878], [75 1]);
h12 = tf([-0.864], [75 1]);
h21 = tf([1.082], [75 1]);
h22 = tf([-1.096], [75 1]);
H = [h11, h12; h21, h22];

flc1 = readfis('flc1.fis');


LO = 25;
co1 = -LO;
co2 = -LO/2;
co3 = 0;
co4 = LO/2;
co5 = LO;
flc2.output.mf(1).params = [co1-LO/2, co1, co1+LO/2];
flc2.output.mf(2).params = [co2-LO/2, co2, co2+LO/2];
flc2.output.mf(3).params = [co3-LO/2, co3, co3+LO/2];
flc2.output.mf(4).params = [co4-LO/2, co4, co4+LO/2];
flc2.output.mf(5).params = [co5-LO/2, co5, co5+LO/2];

L1 = 1.1275;
c12 = 0;
c11 = c12 - L1/2;
c13 = c12 + L1/2;
flc2.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
flc2.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
flc2.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];

L2 = 1.2;
c22 = 0;
c21 = c22 - L2/2;
c23 = c22 + L2/2;
flc2.input(2).mf(1).params = [c21-L2/2, c21, c21+L2/2];
flc2.input(2).mf(2).params = [c22-L2/2, c22, c22+L2/2];
flc2.input(2).mf(3).params = [c23-L2/2, c23, c23+L2/2];
%}

sim('siso1.slx')

% plota
figure()
subplot(4,1,1);
plot(yout{1}.Values.time, yout{1}.Values.data)
title("Saída")
subplot(4,1,2);
plot(yout{2}.Values.time, yout{2}.Values.data)
title("Erro")
subplot(4,1,3);
plot(yout{3}.Values.time, yout{3}.Values.data)
title("Sinal de controle")
subplot(4,1,4);
plot(yout{4}.Values.time, yout{4}.Values.data)
title("Derivada do erro")
%}