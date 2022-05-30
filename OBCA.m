function boxes = OBCA(matriz,nodos)
    boxes = {};
    n_nodes = size(nodos);
    G = graph(matriz);
    distancias = distances(G);
    k = 1;
    f = zeros(1,n_nodes(2));
    nd = get_degree(matriz);
    aux_m = [nodos;f;nd];
    [temp,idx] = sort(aux_m(3,:));
    full_m = aux_m(:,idx);
    
    for n=1:n_nodes(2)
        if full_m(2,n) > 0 
            continue;
        end
        %node has relative frequency = 0, so it's a center node for a
        %candidate box, build said box around the node with distance k
        box = build_c_box(n,k,full_m,distancias);
        [temp2,idx2] = sort(box(2,:));
        C_box = box(:,idx2) %sort by f (2nd row)
        tam_cb = size(C_box);
        for i=1:tam_cb(2)
            if ~ismember(C_box(1,i),box(1)) 
                continue;
            end
            for j=i+1:tam_cb(2)
                if distancias(C_box(1,i),C_box(1,j)) > k
                    if C_box(1,j) == full_m(1,n)
                        box = box(:,box(1,:)~=C_box(1,i));
                        break
                    else
                        box = box(:,box(1,:)~=C_box(1,j));
                    end
                end
            end
        end
        for p=i:tam_cb(2)
            fidx = find(full_m(1,:) == box(1,p));
            full_m(2,fidx) = full_m(2,fidx) + 1;
        end
        boxes{end+1} = double(box(1,:));
    end
    numbox = size(boxes);
    for l=1:numbox(2)
        uniquebox = false;
        curr_b = boxes{l};
        scb = size(curr_b);
        for j=1:scb(2)
            bidx = find(full_m(1,:) == curr_b(j));
            if full_m(2,bidx) < 2
                uniquebox = true;
                break;
            end
        end
        if ~uniquebox
            boxes(l) = [];
            for j=1:scb(2)
                bidx2 = find(full_m(1,:) == curr_b(j));
                full_m(2,bidx2) = full_m(2,bidx2) - 1;
            end
        end
    end
end

