function T = toy_checkerboard(n, m, cSize)
T = zeros(n,m);
maxx = 255;
line = zeros(1,m);

for i=1:m
    line(1,i) = maxx;
    if mod(i,cSize)==0
        maxx = -maxx;
    end
end

for i=1:n
    T(i,:) = max(line,0);
    if mod(i,cSize)==0
        line = -line;
    end
end
%T = uint8(T);