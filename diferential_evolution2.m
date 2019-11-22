clear;
clc;
close all;

%% Initialize population with random candidate solutions
N = 10;  % tamanho da populacao
C = 0.8;  % probabilidade de cruzamento
F = 0.8;  % fator de escala
n = 3;    % quantidade de variáveis do problema
global flc2;
flc2 = readfis('flc2.fis');

% Limites
fobj = @custo2;
lb = [0, 0, 0];
ub = [25, 1.2, 1.2];

%% Main Loop 
%termination_condition = run max_iterations
max_iterations = 8;
iteration = 0;
new_population = [];
fitness = [];
best = 0;
best_individual = ones(n,1);
m = 1;
while(m<2)
    for i = 1:n
        population_matrix(i, :) = lb(i) + (ub(i)-lb(i))*rand(1, N);
    end
    
    for i = 1:N
        fitness(i) = fobj(population_matrix(:, i));
    end

    while(iteration < max_iterations)
        iteration = iteration + 1;
        for i= 1:N
            r1 = population_matrix(:, randi([1, N]));
            r2 = population_matrix(:, randi([1, N]));
            r3 = population_matrix(:, randi([1, N]));
            delta = randi([1, n]);
            for j= 1:n
                if (rand() < C) || (n == delta) 
                    % Ocorre cruzamento
                    u(j) = r1(j) + F*(r2(j) - r3(j));
                else
                    u(j) = population_matrix(j, i);
                end
                % Clip values
                u(j) = max(u(j), lb(j));
                u(j) = min(u(j), ub(j));
            end
            % Test if new son is better than parent
            new_value = fobj(u);
            old_value = fitness(i);
            if new_value < old_value
                new_population(:, i) = u;
                fitness(i) = new_value;
            else
                new_population(:, i) = population_matrix(:, i);
                fitness(i) = old_value;
            end
            if fitness(i) < best
                best = fitness(i);
                best_individual = new_population(:, i);
            end
        end
        media(iteration) = mean(fitness);
        otimo(iteration) = min(fitness);
        population_matrix = new_population;
        new_population = [];
        %plotar(fobj,lb,ub,iteration,population_matrix,fitness)
    end
    iterations_vector(m) = iteration;
    m = m+1;
    iteration = 0;
    best = 0;
end

media_iterations = mean(iterations_vector);
figure
subplot(2,1,1)
plot(otimo)
title('Evolucao do individuo otimo')
xlabel('#Iteracao')
ylabel('Fitness')
subplot(2,1,2)
plot(media)
title('Evolucao do individuo medio')
xlabel('#Iteracao')
ylabel('Fitness')