function soma_erro_absoluto = custo(vector_bases)
    
    %flc1 = readfis('flc1.fis');
    global flc1;
    global flc2;
    global fli;
    global w1;
    global w2;
    
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
    base_saida_flc1 = vector_bases(11);
    base_entrada1_flc1 = vector_bases(12);
    base_entrada2_flc1 = vector_bases(13);
    base_saida_flc2 = vector_bases(14);
    base_entrada1_flc2 = vector_bases(15);
    base_entrada2_flc2 = vector_bases(16);

    
    %Parâmetros FLI
    
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

    
    %Parâmetros FLC1
    
    L1_flc1 = base_entrada1_flc1;
    L2_flc1 = base_entrada2_flc1;
    L3_flc1 = base_saida_flc1;
    
    centro11_flc1 = 0;
    centro12_flc1 = centro11_flc1 - L1_flc1/2;
    centro13_flc1 = centro11_flc1 + L1_flc1/2;
    
    flc1.input(1).mf(1).params = [centro11_flc1-L1_flc1/2, centro11_flc1, centro11_flc1+L1_flc1/2];
    flc1.input(1).mf(2).params = [centro12_flc1-L1_flc1/2, centro12_flc1, centro12_flc1+L1_flc1/2];
    flc1.input(1).mf(3).params = [centro13_flc1-L1_flc1/2, centro13_flc1, centro13_flc1+L1_flc1/2];
    
    centro21_flc1 = 0;
    centro22_flc1 = centro21_flc1 - L2_flc1/2;
    centro23_flc1 = centro21_flc1 + L2_flc1/2;
    
    flc1.input(2).mf(1).params = [centro21_flc1-L2_flc1/2, centro21_flc1, centro21_flc1+L2_flc1/2];
    flc1.input(2).mf(2).params = [centro22_flc1-L2_flc1/2, centro22_flc1, centro22_flc1+L2_flc1/2];
    flc1.input(2).mf(3).params = [centro23_flc1-L2_flc1/2, centro23_flc1, centro23_flc1+L2_flc1/2];
    
    co1_flc1 = -L3_flc1;
    co2_flc1 = -L3_flc1/2;
    co3_flc1 = 0;
    co4_flc1 = L3_flc1/2;
    co5_flc1 = L3_flc1;
    
    flc1.output.mf(1).params = [co1_flc1-L3_flc1/2, co1_flc1, co1_flc1+L3_flc1/2];
    flc1.output.mf(2).params = [co2_flc1-L3_flc1/2, co2_flc1, co2_flc1+L3_flc1/2];
    flc1.output.mf(3).params = [co3_flc1-L3_flc1/2, co3_flc1, co3_flc1+L3_flc1/2];
    flc1.output.mf(4).params = [co4_flc1-L3_flc1/2, co4_flc1, co4_flc1+L3_flc1/2];
    flc1.output.mf(5).params = [co5_flc1-L3_flc1/2, co5_flc1, co5_flc1+L3_flc1/2];
    
    
    %Parâmetros FLC2
    
    L1_flc2 = base_entrada1_flc2;
    L2_flc2 = base_entrada2_flc2;
    L3_flc2 = base_saida_flc2;
    
    centro11_flc2 = 0;
    centro12_flc2 = centro11_flc2 - L1_flc2/2;
    centro13_flc2 = centro11_flc2 + L1_flc2/2;
    
    flc2.input(1).mf(1).params = [centro11_flc2-L1_flc2/2, centro11_flc2, centro11_flc2+L1_flc2/2];
    flc2.input(1).mf(2).params = [centro12_flc2-L1_flc2/2, centro12_flc2, centro12_flc2+L1_flc2/2];
    flc2.input(1).mf(3).params = [centro13_flc2-L1_flc2/2, centro13_flc2, centro13_flc2+L1_flc2/2];
    
    centro21_flc2 = 0;
    centro22_flc2 = centro21_flc2 - L2_flc2/2;
    centro23_flc2 = centro21_flc2 + L2_flc2/2;
    
    flc2.input(2).mf(1).params = [centro21_flc2-L2_flc2/2, centro21_flc2, centro21_flc2+L2_flc2/2];
    flc2.input(2).mf(2).params = [centro22_flc2-L2_flc2/2, centro22_flc2, centro22_flc2+L2_flc2/2];
    flc2.input(2).mf(3).params = [centro23_flc2-L2_flc2/2, centro23_flc2, centro23_flc2+L2_flc2/2];
    
    co1_flc2 = -L3_flc2;
    co2_flc2 = -L3_flc2/2;
    co3_flc2 = 0;
    co4_flc2 = L3_flc2/2;
    co5_flc2 = L3_flc2;
    
    flc2.output.mf(1).params = [co1_flc2-L3_flc2/2, co1_flc2, co1_flc2+L3_flc2/2];
    flc2.output.mf(2).params = [co2_flc2-L3_flc2/2, co2_flc2, co2_flc2+L3_flc2/2];
    flc2.output.mf(3).params = [co3_flc2-L3_flc2/2, co3_flc2, co3_flc2+L3_flc2/2];
    flc2.output.mf(4).params = [co4_flc2-L3_flc2/2, co4_flc2, co4_flc2+L3_flc2/2];
    flc2.output.mf(5).params = [co5_flc2-L3_flc2/2, co5_flc2, co5_flc2+L3_flc2/2];
    
    % Chama simulacao
    sim('complete_diagram.slx');
    soma_erro_absoluto = trapz(yout{3}.Values.time, abs(yout{3}.Values.Data)) + trapz(yout{4}.Values.time, abs(yout{4}.Values.Data));
    plot(yout{1}.Values.time, abs(yout{1}.Values.Data));
    hold on
    plot(yout{2}.Values.time, abs(yout{2}.Values.Data));

end