function soma_erro_absoluto = custo_coupled(vector_bases)
    
    global flc1;
    global flc2;
    
    base_saida    = vector_bases(1);
    base_entrada1 = vector_bases(2);
    base_entrada2 = vector_bases(3);
    
    base2_saida    = vector_bases(4);
    base2_entrada1 = vector_bases(5);
    base2_entrada2 = vector_bases(6);
    
    % FLC 1
    L1 = base_entrada1;
    MIN_LIM = -300;
    MAX_LIM = 300;
    c12 = 0;
    c11 = c12 - L1/2;
    c13 = c12 + L1/2;
    flc1.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
    flc1.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
    flc1.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];
    flc1.input(1).mf(4).params = [MIN_LIM, MIN_LIM, c11-L1/2, c11-L1/2];
    flc1.input(1).mf(5).params = [c11+L1/2, c11+L1/2, MAX_LIM, MAX_LIM];

    L2 = base_entrada2;
    c22 = 0;
    c21 = c22 - L2/2;
    c23 = c22 + L2/2;
    flc1.input(2).mf(1).params = [c21-L2/2, c21, c21+L2/2];
    flc1.input(2).mf(2).params = [c22-L2/2, c22, c22+L2/2];
    flc1.input(2).mf(3).params = [c23-L2/2, c23, c23+L2/2];

    LO = base_saida;
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
    
    % FLC 2
    L1 = base2_entrada1;
    MIN_LIM = -300;
    MAX_LIM = 300;
    c12 = 0;
    c11 = c12 - L1/2;
    c13 = c12 + L1/2;
    flc2.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
    flc2.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
    flc2.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];
    flc2.input(1).mf(4).params = [MIN_LIM, MIN_LIM, c11-L1/2, c11-L1/2];
    flc2.input(1).mf(5).params = [c11+L1/2, c11+L1/2, MAX_LIM, MAX_LIM];

    L2 = base2_entrada2;
    c22 = 0;
    c21 = c22 - L2/2;
    c23 = c22 + L2/2;
    flc2.input(2).mf(1).params = [c21-L2/2, c21, c21+L2/2];
    flc2.input(2).mf(2).params = [c22-L2/2, c22, c22+L2/2];
    flc2.input(2).mf(3).params = [c23-L2/2, c23, c23+L2/2];

    LO = base2_saida;
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
    
    % Chama simulacao
    sim('complete_diagram_coupled.slx');
    soma_erro_absoluto = trapz(yout{3}.Values.time, yout{3}.Values.Data.^2) + trapz(yout{4}.Values.time, yout{4}.Values.Data.^2);
    
end