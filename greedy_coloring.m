function max_col = greedy_coloring(matriz, nodos, aux_g, neigh)
    k = 1;
    limit = size(matriz);
    if nargin == 2
        auxiliary = false;
        [G_b,neighbors] = auxiliary_graph(matriz,nodos,k);
    else
        auxiliary = true;
        G_b = aux_g;
        neighbors = neigh;
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
end

