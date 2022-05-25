function calculaMergeAlgorithm(nodos)
           limit = size(nodos);
           valores = [];
           iteraciones = 1:1:limit(1);
           l = 1;
           k = 1;
           
           %while k < limit(2)
           while k <= 2
                %todo nodo es una caja
                boxes = {};
                limit2 = size(nodos);
                for n=1:limit(2)
                    boxes{end+1} = nodos(1,n);
                end
                l = 1;
                while l <= k
                    boxes_vis = {};
                    while (~isempty(boxes))
                        box_cant = size(boxes);
                        bnum = randi(box_cant(2));
                        %b = boxes{bnum,1};
                        b = boxes{1,bnum};
                        adj = {};
                        cell_adj = {};
                        i=1;
                        %for i=1:limit(2)
                        limit = size(nodos);
                        while i < box_cant(2)
                            if i~=bnum
                                compound_box = {};
                                subbox1 = b;
                                subbox2 = boxes{i};
                                compound_box = [subbox1 subbox2];  
                                cell_box = {subbox1 subbox2};
                                adj{end+1} = compound_box; 
                                cell_adj{end+1} = cell_box;
                            end
                            i = i +1;
                        end
                        n_adj = size(adj);
                        choices = {};
                        cell_choices = {};
                        l
                        k
                        boxes

                        for c=1:n_adj(2)
                            b_size = size(adj{c});
                            if b_size(2) <= l
                                choices{end+1} = adj{c};
                                cell_choices{end+1} = cell_adj{c};
                            end
                        end
                        %función aislada, para comparación entre celdas
                        limit3 = size(choices);
                        if ~isempty(adj) && limit3(2) > 0
                                cnum = randi(limit3(2));
                                choice = choices{cnum,1};
                                cell_choice = cell_choices{cnum,1};
                                boxes_vis{end+1} = choice{1};
                                f1 = @(a) a == cell_choice{1};
                                f2 = @(a) a == cell_choice{2};
                                members1 = cellfun(f1,boxes,'UniformOutput',false);
                                members2 = cellfun(f2,boxes,'UniformOutput',false);
                                m_size = size(members1);
                                q = 1;
                                while q < m_size(1)
                                    if ~ismember(0,members1{q})
                                        boxes(q) = [];
                                        members1(q) = [];
                                        members2(q) = [];
                                        m_size(1) = m_size(1) - 1;
                                        limit2(2) = limit2(2) -1;
                                        limit(2) = limit(2) -1;
                                    end
                                    if ~ismember(0,members2{q})
                                        boxes(q) = [];
                                        members1(q) = [];
                                        members2(q) = [];
                                        m_size(1) = m_size(1) - 1;
                                        limit2(2) = limit2(2) -1;
                                        limit(2) = limit(2) -1;
                                    end
                                    q = q + 1;
                                end
                        else
                            boxes_vis{end+1} = b;
                            boxes_vis
                            cand_size = size(boxes);
                            u = cand_size(1);
                            while u ~= 0
                                if isequal(b,boxes{u})
                                    boxes(u) = [];
                                    limit2(2) = limit2(2) -1;
                                    limit(2) = limit(2) -1;
                                end
                                u = u - 1;
                            end
                        end
                    end
                    boxes = boxes_vis;
                    l = l + 1;
                end
                num_boxes = size(boxes);
                valores(k) = num_boxes(2);
                k = k + 1;
                limit = size(nodos);
           end
end
         