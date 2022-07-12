function devuelve = greedy_coloring(matriz, nodos, aux_g, neigh, tb, ordering)
    limit = size(matriz);
    threshold = 0.5;
    valores = [];
    iteraciones = [1:1:limit(1)];
    matriz(matriz>=threshold)=1;matriz(matriz<threshold)=0;
    if ismember(nargin,[2 3])
        onetime=false;
    else
        onetime=true;
        G_b = aux_g;
        neighbors = neigh;
    end
    for k=1:limit(1)
        if ~onetime
            [G_b,neighbors] = auxiliary_graph(matriz,k);
        else
            k = tb;
        end
        boxes = {};
        cont = 1;
        colors = zeros(1,limit(1));
        for i=1:limit(1)
            curr_neigh = neighbors{i};
            for j=1:limit(1)
                if ~ismember(j,colors(curr_neigh))
                    colors(i) = j;
                    break
                end
            end
        end
        max_col = max(colors);
        valores(k) = max_col;
        if onetime
            devuelve = max_col;
            break
        end
    end
end