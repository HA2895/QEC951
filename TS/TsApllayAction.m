function x2= TsApllayAction( x ,Action)


i=cell2mat(Action);

method=i(3);
switch method
    case 1 %swap
        i1=i(1);
        i2=i(2);
        x2=x;
        x2([i1 i2])=x2([i2 i1]);
    case 2          % reversion
        i1=min(i(1) ,i(2));
        i2=max(i(1) ,i(2));
        x2=x;
        x2(i1 :i2)=x2(i2:-1:i1);
    case 3 % insertion
        i1=i(1);
        i2=i(2);
        if i1 < i2
            x2=[x(1:i1) x(i2)  x(i1+1:i2-1) x(i2+1 :end)];
        else
            
            x2=[x(1:i2-1)   x(i2+1:i1) x(i2) x(i1+1 :end)];
        end
end

        


end

