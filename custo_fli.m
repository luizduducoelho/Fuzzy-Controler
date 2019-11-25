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
    soma_erro_absoluto = trapz(yout{3}.Values.time, abs(yout{3}.Values.Data)) + trapz(yout{4}.Values.time, abs(yout{4}.Values.Data));
    plot(yout{1}.Values.time, abs(yout{1}.Values.Data));
    hold on
    plot(yout{2}.Values.time, abs(yout{2}.Values.Data));

end