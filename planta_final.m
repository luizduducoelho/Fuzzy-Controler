clear;
clc;
close all;

flc1 = readfis('flc1.fis');
flc2 = readfis('flc2.fis');
fli = readfis('fli.fis');

vector_bases = [100
0
5
-5
-5
-5
-5
1.4213
1.7847
1.4386];

base_entrada1 = vector_bases(1);
base_entrada2 = vector_bases(2);
p11 = vector_bases(3);
p12 = vector_bases(4);
p13 = vector_bases(5);
p21 = vector_bases(6);
p22 = vector_bases(7);
p23 = vector_bases(8);
w1 = vector_bases(9);
w2 = vector_bases(10);
    
L1 = base_entrada1;
c12 = 0;
c11 = c12 - L1/2;
c13 = c12 + L1/2;
fli.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
fli.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
fli.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];

L2 = base_entrada2;
c22 = 0;
c21 = c22 - L2/2;
c23 = c22 + L2/2;
fli.input(2).mf(1).params = [c21-L2/2, c21, c21+L2/2];
fli.input(2).mf(2).params = [c22-L2/2, c22, c22+L2/2];
fli.input(2).mf(3).params = [c23-L2/2, c23, c23+L2/2];


fli.output(1).mf(1).params = p11;
fli.output(1).mf(2).params = p12;
fli.output(1).mf(3).params = p13;
fli.output(2).mf(1).params = p21;
fli.output(2).mf(2).params = p22;
fli.output(2).mf(3).params = p23;


% Chama simulacao
sim('complete_diagram_previous.slx');

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
