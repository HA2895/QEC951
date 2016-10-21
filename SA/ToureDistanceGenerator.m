clc;clear all;close all;
D=randi(105,15);
D=D-diag(diag(D));
D=round(D+D');

save('mat.mat','D');