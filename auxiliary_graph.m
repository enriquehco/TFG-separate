function [agraph,neighbors] = auxiliary_graph(matriz,lb)
    neighbors = {};
    limit = size(matriz);
    edges = [0 0];
    G = graph(matriz);
    distancias = distances(G);
    nlist = [0 0];

    for v1=1:limit(2)
        for v2=1:limit(2)
            if(distancias(v1,v2)>lb && v1~=v2)
                if(~any(ismember(edges,[v2 v1],'rows')))
                    edges(end+1,:) = [v1 v2];
                end
                nlist(end+1,:) = [v1 v2];
            end
        end
    end
    edges(1,:) = [];
    nlist(1,:) = [];
    G2 = graph;
    sedge = size(edges);
    for i=1:sedge(1)
        G2 = addedge(G2,edges(i,1),edges(i,2));
    end
    iedges = nlist;
    for i=1:limit(2)
        neighbors{end+1} = iedges(iedges(:,1)==i,2);
    end
    agraph = G2;
end

