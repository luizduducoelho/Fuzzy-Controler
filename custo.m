function soma_erro_absoluto = custo_coupled(vector_bases)
    
    %flc1 = readfis('flc1.fis');
    global flc1;
    
    base_saida    = vector_bases(1);
    base_entrada1 = vector_bases(2);
    base_entrada2 = vector_bases(3);
    
    L1 = base_entrada1;
    c12 = 0;
    c11 = c12 - L1/2;
    c13 = c12 + L1/2;
    flc1.input(1).mf(1).params = [c11-L1/2, c11, c11+L1/2];
    flc1.input(1).mf(2).params = [c12-L1/2, c12, c12+L1/2];
    flc1.input(1).mf(3).params = [c13-L1/2, c13, c13+L1/2];

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
    
    % Chama simulacao
    sim('siso1.slx');
    soma_erro_absoluto = trapz(yout{2}.Values.time, yout{2}.Values.Data);

end