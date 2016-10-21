function ActionList = TSCreateTSPAction( n )
nSwap=n*(n-1)/2;
nRev=n*(n-1)/2;
nIns=n*(n-1);
nAction=nSwap+nRev+nIns;
ActionList=cell(nAction,1);
c=0;
for i=1:n-1
    for j=i+1:n
        c=c+1;
        ActionList{c}=[i j 1];
    end
end
for i=1:n-1
    for j=i+1:n
        if abs(i-j)>2
        c=c+1;
        ActionList{c}=[i j 2];
        end
    end
end
for i=1:n-1
    for j=i+1:n
        if all(j~=[i-1 i+1 i+2])
        c=c+1;
        ActionList{c}=[i j 3];
        end
    end
end
ActionList=ActionList(1:c);
end

