%% Algorítimos geómetricos

%%preparacao

% Z1 =  dlmread('z1.txt');
% Z2 =  dlmread('z2.txt');

Z1 = double(Z1);
Z2 = double(Z2);

Z1mod = Z1/max(max(Z1));
Z2mod = Z2/max(max(Z2));



[M,I1] = sort(Z1mod,2); 
[M,I2] = sort(Z2mod,2);

peso1 = 0;
soma1 = 0;
peso2 = 0;
soma2 = 0;
pontosa = 0;
pontosb = 0;

for c = 1:length(Z1)
    for i = 2:length(Z1(c,:))
%          peso1 = peso1 + i*(1-Z1mod(c,i));
%          soma1 = soma1 + (1-Z1mod(c,i));
%          peso2 = peso2 + i*(1-Z2mod(c,i));
%          soma2 = soma2 + (1-Z2mod(c,i));
         peso1 = peso1 + i*(Z1mod(c,i));
         soma1 = soma1 + (Z1mod(c,i));
         peso2 = peso2 + i*(Z2mod(c,i));
         soma2 = soma2 + (Z2mod(c,i));
    end
    
     i1a(c) = peso1/soma1;
     i2a(c) = peso2/soma2;
%     i1a(c) = pontosa/2;
%     i2a(c) = pontosb/2;
    
    peso1 = 0;
    soma1 = 0;
    peso2 = 0;
    soma2 = 0;

end


p1a = (i1a/128) - 1;
p2a = (i2a/128) - 1;


Doea = (p1a + p2a)*-D/2;
Adea = atan((p2a-p1a)*-D/L);

% Pv = Pv(1,2:end);
Do = 0.030*sin((2*pi/400)*Pv);
Ad = (pi/180)*40*cos((2*pi/400)*Pv);


%% Redes neurais

% C = [Z1 Z2];
% 
% C = (C/max(max(C))) - 0.5;
% 
% y = myNeuralNetworkFunction(C');
% 
% y2 = myNeuralNetworkFunction2(C');


%% Plots

figure(3)

subplot(1,2,1)
plot(Pv,Ad),grid
h = legend('Angulo de Desvio');
xlabel('Ponto de Validação')

hold all
scatter(Pv,Adea,6,'filled'),grid
str=get(h,'string');
new_leg='Angulo de Desvio (Estimado)';
h=legend([str new_leg]) 

hold off

subplot(1,2,2)
plot(Pv,Do),grid
w = legend('Devio Ortogonal');
xlabel('Ponto de Validação')

hold all
scatter(Pv,Doea,6,'filled'),grid
str=get(w,'string');
new_leg='Desvio Ortogonal (estimado)';
w=legend([str new_leg]) 
hold off
    
% subplot(2,2,4)
% plot(Pv,Do),grid
% h = legend('Desvio Ortogonal');
% xlabel('Ponto de Validação')
% 
% hold all
% scatter(Pv,y,6,'filled'),grid
% str=get(h,'string');
% new_leg='Desvio Ortogonal (Estimado)';
% h=legend([str new_leg]) 
% 
% hold off
% 
% subplot(2,2,3)
% plot(Pv,Ad),grid
% h = legend('Angulo de desvio');
% xlabel('Ponto de Validação')
% 
% hold all
% scatter(Pv,y2,6,'filled'),grid
% str=get(h,'string');
% new_leg='Angulo de Desvio (Estimado)';
% h=legend([str new_leg]) 
% 
% hold off