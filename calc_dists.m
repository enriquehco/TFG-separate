function mindists = calc_dists(nodos,C,distancias,k)
    tn = size(nodos);
    tc = size(C);
    mindists = [nodos;zeros(1,tn(2));zeros(1,tn(2))+k];
    for i=1:tn(2)
        for j=1:tc(2)
            if distancias(nodos(i),C(j)) <= mindists(3,i)
                mindists(3,i) = distancias(nodos(i),C(j));
                mindists(2,i) = C(j);
            end
        end
    end
    mindists = sortrows(mindists',3)';
end

