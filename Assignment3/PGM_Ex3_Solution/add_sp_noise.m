function N = add_sp_noise(T, p)
[n,m] = size(T);
N = T;
for x=1:n
    for y=1:m
        noise = random('bino',1,p);
        if noise==1
            color = random('bino',1,0.5);
        else
            color = -1;
        end
        
        if color==0
            N(x,y) = 255;
        elseif color==1
            N(x,y) = 0;
        end
        
    end
end
%N = uint8(N);
end