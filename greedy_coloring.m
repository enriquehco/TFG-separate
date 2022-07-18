function devuelve = greedy_coloring(matriz, nodos, tb, aux_g, neigh )
    limit = size(matriz);
    threshold = 0.5;
    valores = [];
    iteraciones = [1:1:limit(1)];
    matriz(matriz>=threshold)=1;matriz(matriz<threshold)=0;
    if nargin == 2
        onetime=false;
    else
        if ~exist('neigh','var')
            onetime = true;
            [G_b,neighbors] = auxiliary_graph(matriz,tb);
        else
            onetime=true;
            G_b = aux_g;
            neighbors = neigh;
        end
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
            devuelve = colors;
            break
        end
    end
end