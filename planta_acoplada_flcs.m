clear;
clc;
close all;

flc1 = readfis('flc1.fis');
flc2 = readfis('flc2.fis');

LO = 89.3959;
co1 = -LO;
co2 = -LO/2;
co3 = 0;
co4 = LO/2;
co5 = LO;
flc1.output.mf(1).params = [co1-LO/2, co1, co1+LO/2];
flc1.output.mf(2).params = [co2-LO/2, co2, co2+LO/2];
flc1.output.mf(3).params = [co3-LO/2, co3, co3+LO/2];
flc1.output.mf(4).params = [co4-LO/2, co4, co4+LO/2];
flc1.output.mf(5).params = [co5-LO/2, co5, co5+LO/2];

L1 =  1.8517;
MIN_LIM = -300;
MAX_LIM = 300;
c12 = 0;
c11 = c12 - L1/2;
c13 = c12 + L1/2;
flc1.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
flc1.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
flc1.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];
flc1.input(1).mf(4).params = [MIN_LIM, MIN_LIM, c11-L1/2, c11-L1/2];
flc1.input(1).mf(5).params = [c13+L1/2, c13+L1/2, MAX_LIM, MAX_LIM];

L2 = 3.8112 ;
c22 = 0;
c21 = c22 - L2/2;
c23 = c22 + L2/2;
flc1.input(2).mf(1).params = [c21-L2/2, c21, c21+L2/2];
flc1.input(2).mf(2).params = [c22-L2/2, c22, c22+L2/2];
flc1.input(2).mf(3).params = [c23-L2/2, c23, c23+L2/2];


% FLC 2% FLC 2
L1 = 0.5233 ;
MIN_LIM = -300;
MAX_LIM = 300;
c12 = 0;
c11 = c12 - L1/2;
c13 = c12 + L1/2;
flc2.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
flc2.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
flc2.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];
flc2.input(1).mf(4).params = [MIN_LIM, MIN_LIM, c11-L1/2, c11-L1/2];
flc2.input(1).mf(5).params = [c13+L1/2, c13+L1/2, MAX_LIM, MAX_LIM];

L2 =  4.6934;
c22 = 0;
c21 = c22 - L2/2;
c23 = c22 + L2/2;
flc2.input(2).mf(1).params = [c21-L2/2, c21, c21+L2/2];
flc2.input(2).mf(2).params = [c22-L2/2, c22, c22+L2/2];
flc2.input(2).mf(3).params = [c23-L2/2, c23, c23+L2/2];

LO =  49.0532;
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

sim('complete_diagram_coupled.slx')


% plota
figure()
subplot(6,1,1);
plot(yout{1}.Values.time, yout{1}.Values.data)
title("Saída 1")
subplot(6,1,2);
plot(yout{2}.Values.time, yout{2}.Values.data)
title("Saida 2")
subplot(6,1,3);
plot(yout{3}.Values.time, yout{3}.Values.data)
title("Erro 1")
subplot(6,1,4);
plot(yout{4}.Values.time, yout{4}.Values.data)
title("Erro 2")
subplot(6,1,5);
plot(yout{5}.Values.time, yout{5}.Values.data)
title("Controle 1")
subplot(6,1,6);
plot(yout{6}.Values.time, yout{6}.Values.data)
title("Controle 2")
