%% Figures et simulation du biais de Berkson
% Leo Varnet - 2020

%% generation données aléatoires

N = 200;
A = 10*randn(1,N)+50;
B = 5*randn(1,N)+30;

figure;
plot(A,B,'ob')
xlabel('variable A'); ylabel('variable B'); 

%% selection

idx = A+B+randn(1,N)*2>90; % condition de sélection combinée sur les deux variables
%idx = A>62 | B>37; % condition de sélection séparée

figure;
plot(A,B,'og');hold on
plot(A(idx),B(idx),'or')
xlabel('variable A'); ylabel('variable B'); 

%% correlation

LM=fitlm(A(idx),B(idx));
Apred = [min(A(idx))-10 max(A(idx))+10]';
Bpred = predict(LM,Apred);
figure;
plot(Apred,Bpred,'-k');hold on
plot(A(idx),B(idx),'or')
xlabel('variable A'); ylabel('variable B'); 

