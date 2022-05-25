function retmat = merge2(matriz,nodos)
    retmat = {}
    n_nodos = size(nodos);
    boxes = {};
    G = graph(matriz);
    distancias = distances(G);
    for i=1:n_nodos(2)
        boxes{end+1} = nodos(i);
    end
    l = 1;
    k = 3;
    while l <= k
        boxes_vis = {};
        n_boxes = size(boxes);

        while ~isempty(boxes)
            bnum = randi(n_boxes(2));
            b = boxes(bnum);

            choice = find_valid_boxes(b,boxes,l,distancias);
            if ~isempty(choice)
                %boxes_vis{end+1} = [choice{1} choice{2}];
                boxes_vis{end+1} = [choice{:,1} choice{:,2}];
                f1 = @(a) isempty(setdiff(choice{1},a)) & isempty(setdiff(a,choice{1}));
                f2 = @(a) isempty(setdiff(choice{2},a)) & isempty(setdiff(a,choice{2}));
                matches1 = cellfun(f1,boxes,'UniformOutput',false);
                matches2 = cellfun(f2,boxes,'UniformOutput',false);
                u = n_boxes(2);
                while u ~= 0
                    if isequal(matches1{u},1)
                        boxes(u) = [];
                        n_boxes(2) = n_boxes(2) - 1;
                    elseif isequal(matches2{u},1)
                        boxes(u) = [];
                        n_boxes(2) = n_boxes(2) - 1;
                    end
                    u = u - 1;
                end
            else
                boxes_vis{end+1} = b{:};
                boxes(bnum) = [];
                n_boxes(2) = n_boxes(2) - 1;
            end
        end
        boxes = boxes_vis
        l = l + 1;
        retmat{end+1} = boxes;
    end
end