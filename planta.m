clear;
clc;
close all;

h11 = tf([0.878], [75 1]);
h12 = tf([-0.864], [75 1]);
h21 = tf([1.082], [75 1]);
h22 = tf([-1.096], [75 1]);
H = [h11, h12; h21, h22];

L1 = 0.5;
c12 = 0;
c11 = c12 - L1/2;
c13 = c12 + L1/2;

flc1 = readfis('flc1.fis');
flc1.input.mf(1).params = [c11-L1/2, c11, c11+L1/2];
flc1.input.mf(2).params = [c12-L1/2, c12, c12+L1/2];
flc1.input.mf(3).params = [c13-L1/2, c13, c13+L1/2];

flc2 = readfis('flc2.fis');

sim('control_diagram_simple.slx')
