clc;clear all;close all;

%----load data--------
load('../mat.mat');
costFunc=@ (tore)TourLength(tore,D);
nVar=size(D,1);
varSize=[1 round(nVar)];

%----- parameters------
maxIt=500;
maxPreTemp=100;
T0=1000;
alpha=0.95;

%----initilalzion ------
Idv.Pos=[];
Idv.Cost=[];
Pop=Idv;
Pop(1).Pos=randperm(nVar);
Pop(1).Cost=costFunc(Pop(1).Pos);
BestSol=Pop(1);
BestCost=zeros(maxIt,1);
T=T0;

%----- Main loop ------


for it=1:maxIt
    for i=1: maxPreTemp
        NewSol.Pos=SACreateNeighber(Pop(1).Pos);
        NewSol.Cost=costFunc(NewSol.Pos);
        delta=NewSol.Cost-Pop(1).Cost;
        if delta < 0
            Pop(1)=NewSol;
        else
            p=exp(-delta/T);
            if rand < p
                Pop(1)=NewSol;
            end
        end
            if    Pop(1).Cost < BestSol.Cost
                BestSol=Pop(1);
            end
    end;
    BestCost(it)=BestSol.Cost;
%    disp([ 'itertion: ' num2str(it) ' Best Cost: ' num2str(BestCost(it))]);
    T=alpha*T;
end

disp([  ' Best Cost: ' num2str(BestSol.Cost)  ' Best Solution: ' num2str(BestSol.Pos)  ]);

figure;
plot(BestCost);
xlabel('itretions: ');
ylabel('Cost');
disp([  ' Best Cost: ' num2str(BestSol.Cost)  ' Best Solution: ' num2str(BestSol.Pos)  ]);


                