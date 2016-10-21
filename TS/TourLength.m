function l = TourLength(tore,D)

n=numel(tore);
tore=[tore tore(1)];
l=0;
for k=1 :n
    i=tore(k);
    j=tore(k+1);
    l=l+D(i,j);
end

end

