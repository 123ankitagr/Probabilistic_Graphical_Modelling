function T = toy_stripes(n, m, sSize)
maxx = 255;
T = zeros(n,m);
for i=1:m
    T(:,i) = max(0,maxx);
    if mod(i,sSize)==0
        maxx = -maxx;
    end
end
%T = uint8(T);