%% Algorítimos geómetricos

%%preparacao

Z1c =  dlmread('z1.txt');
Z2c =  dlmread('z2.txt');


Z1mod = Z1c/max(max(Z1c));
Z2mod = Z2c/max(max(Z2c));

% [M,I1] = sort(Z1mod,2);
% [M,I2] = sort(Z2mod,2);

[M,I1] = sort(Z1mod,2,'descend');
[M,I2] = sort(Z2mod,2,'descend');

I2 = I2 + 13;

for c = 1:length(Z1)
%      i1(c) = (I1(c,1)*(1-Z1mod(c,I1(c,1)))+I1(c,2)*(1-Z1mod(c,I1(c,2)))+I1(c,3)*(1-Z1mod(c,I1(c,3)))+I1(c,4)*(1-Z1mod(c,I1(c,4))) + I1(c,5)*(1-Z1mod(c,I1(c,5))))/((1-Z1mod(c,I1(c,1)) + (1-Z1mod(c,I1(c,2)))) + (1-Z1mod(c,I1(c,3))) + (1-Z1mod(c,I1(c,4))) + (1-Z1mod(c,I1(c,5))));
%      i2(c) = (I2(c,1)*(1-Z2mod(c,(I2(c,1)-13)))+I2(c,2)*(1-Z2mod(c,(I2(c,2)-13))) + I2(c,3)*(1-Z2mod(c,(I2(c,3)-13))) + I2(c,4)*(1-Z2mod(c,(I2(c,4)-13))) + I2(c,5)*(1-Z2mod(c,(I2(c,5)-13))))/((1-Z2mod(c,(I2(c,1)-13)) + (1-Z2mod(c,(I2(c,2)-13)))+ (1-Z2mod(c,(I2(c,3)-13)))) + (1-Z2mod(c,(I2(c,4)-13)))+ (1-Z2mod(c,(I2(c,5)-13))));
     i1(c) = (I1(c,1)*(Z1mod(c,I1(c,1)))+I1(c,2)*(Z1mod(c,I1(c,2)))+I1(c,3)*(Z1mod(c,I1(c,3)))+I1(c,4)*(Z1mod(c,I1(c,4))) + I1(c,5)*(Z1mod(c,I1(c,5))))/((Z1mod(c,I1(c,1)) + (Z1mod(c,I1(c,2)))) + (Z1mod(c,I1(c,3))) + (Z1mod(c,I1(c,4))) + (Z1mod(c,I1(c,5))));
     i2(c) = (I2(c,1)*(Z2mod(c,(I2(c,1)-13)))+I2(c,2)*(Z2mod(c,(I2(c,2)-13))) + I2(c,3)*(Z2mod(c,(I2(c,3)-13))) + I2(c,4)*(Z2mod(c,(I2(c,4)-13))) + I2(c,5)*(Z2mod(c,(I2(c,5)-13))))/((Z2mod(c,(I2(c,1)-13)) + (Z2mod(c,(I2(c,2)-13)))+ (Z2mod(c,(I2(c,3)-13)))) + (Z2mod(c,(I2(c,4)-13)))+ (Z2mod(c,(I2(c,5)-13))));
    i1a(c) = I1(c,1);
    i2a(c) = I2(c,1);
end


p1 = (i1 - 7)/6;
p2 = (i2 - 20)/6;
p1a = (i1a - 7)/6;
p2a = (i2a - 20)/6;

clc

Doe = (p1 + p2)*-D/2;
Ade = atan((p2-p1)*-D/L);

Doea = (p1a + p2a)*-D/2;
Adea = atan((p2a-p1a)*-D/L);

Do = 0.030*sin((2*pi/800)*(Pv));
Ad = (pi/180)*40*cos((2*pi/800)*(Pv));


%% Redes neurais
% 
% C = [Z1c Z2c];
% 
% C = (C/max(max(C))) - 0.5;
% 
% y = myNeuralNetworkFunction(C');
%  
% y2 = myNeuralNetworkFunction2(C');


%% Plots

figure(1)
subplot(1,2,1)
plot(Pv,Ad),grid
h = legend('Angulo de Desvio');
xlabel('Ponto de Validação')

hold all
scatter(Pv,Ade,6,'filled'),grid
str=get(h,'string');
new_leg='Angulo de Desvio (Estimado)';
h=legend([str new_leg]) 

hold off

subplot(1,2,2)
plot(Pv,Do),grid
w = legend('Devio Ortogonal');
xlabel('Ponto de Validação')

hold all
scatter(Pv,Doe,6,'filled'),grid
str=get(w,'string');
new_leg='Desvio Ortogonal (estimado)';
w=legend([str new_leg]) 
hold off
% 
% subplot(1,2,1)
% plot(Pv,Ad),grid
% h = legend('Angulo de Desvio');
% xlabel('Ponto de Validação')
% 
% hold all
% scatter(Pv,Adea,6,'filled'),grid
% str=get(h,'string');
% new_leg='Angulo de Desvio (Estimado)';
% h=legend([str new_leg]) 
% 
% hold off
% 
% subplot(1,2,2)
% plot(Pv,Do),grid
% w = legend('Devio Ortogonal');
% xlabel('Ponto de Validação')
% 
% hold all
% scatter(Pv,Doea,6,'filled'),grid
% str=get(w,'string');
% new_leg='Desvio Ortogonal (estimado)';
% w=legend([str new_leg]) 
% hold off
% %     
% subplot(3,2,6)
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
% subplot(3,2,5)
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
