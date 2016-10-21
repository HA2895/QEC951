function x2= SACreateNeighber( x )

n=15;%numel(x);
method=1;%randi([1 3],3,1);
ii=randperm(n);
switch method
    case 1 %swap
        i1=ii(1);
        i2=ii(2);
        x2=x;
        x2([i1 i2])=x2([i2 i1]);
    case 2          % reversion
        i1=min(ii(1) ,ii(2));
        i2=max(ii(1) ,ii(2));
        x2=x;
        x2(i1 :i2)=x2(i2:-1:i1);
    case 3 % insertion
        i1=ii(1);
        i2=ii(2);
        if i1 < i2
            x2=[x(1:i1) x(i2)  x(i1+1:i2-1) x(i2+1 :end)];
        else
            
            x2=[x(1:i2-1)   x(i2+1:i1) x(i2) x(i1+1 :end)];
        end
end

        


end

