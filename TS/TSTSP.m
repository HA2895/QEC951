clc;clear all;close all;

%----load data--------
load('../mat.mat');
costFunc=@ (tore)TourLength(tore,D);
nVar=size(D,1);
varSize=[1 round(nVar)];

%----- parameters------
maxIt=300;
Actions=TSCreateTSPAction( nVar );
nActions=numel(Actions );
T0=round(0.5*nActions);
Tl=zeros(size(Actions));
Sol.Pos=randperm(nVar);
Sol.Cost=costFunc(Sol.Pos);
BestSol=Sol;
%----initilalzion ------


BestCost=zeros(maxIt,1);


%----- Main loop ------


for it=1:maxIt
    
    BestNewSol.Pos=[];
    BestNewSol.Cost=inf;
    BestAction=0;
    for k= 1:nActions
        NewSol.Pos=TsApllayAction(Sol.Pos,Actions(k));
        NewSol.Cost=costFunc(NewSol.Pos);
        
        %aspition
        if Tl(k)>0 && NewSol.Cost<BestSol.Cost
            Tl(k)=0;
        end
        if Tl(k)==0
            if NewSol.Cost< BestNewSol.Cost
                BestNewSol=NewSol;
                BestAction=k;
            end
        end
    end;
    Tl(k)=Max(Tl(k)-1,0);
    Tl(BestAction)=T0;
    Sol=BestNewSol;
    if Sol.Cost <BestSol.Cost
        BestSo=Sol;
    end;
    BestCost(It)=BestSol.Cost;
    
    
    disp([ 'itertion: ' num2str(it) ' Best Cost: ' num2str(BestCost(it))]);
    
end
figure;
plot(BestCost);
xlabel('itretions: ');
ylabel('Cost');
disp([  ' Best Cost: ' num2str(BestSol.Cost)  ' Best Solution: ' num2str(BestSol.Pos)  ]);

