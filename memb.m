function boxes = memb(matriz,nodos)
    %this function defines k as the distance, not size of the box, much
    %like other algorithms we'll see in this thesis
    G = graph(matriz);
    distancias = distances(G);
    tammat = size(matriz);
    valores = [];
    iteraciones = 1:1:tammat(1);
    
    for k=1:tammat(2)
        U = nodos; %list of uncovered nodes
        C = []; %list of center nodes
        boxes = {};
        NCN = nodos;
        while ~isempty(U)
            [p, p_box] = maxexcmass(U,NCN,distancias,k); %maxexcmass should return node with maximal value for em.
            C(end+1) = p;
            boxes{end+1} = p;
            NCN = NCN(NCN~=p);
            %calculate p_box should return nodes 'covered' by p
            U = setdiff(U,p_box);
        end
        cdist = calc_dists(nodos,C,distancias,k); %returns list of closest center node per node
        C_bis = cdist(:,cdist(3,:)~=0);
        cbtam = size(C_bis);
        ctam = size(C);
        for i=1:cbtam(2)
            smallers = cdist(:,cdist(3,:)<C_bis(3,i));
            stam = size(smallers);
            smaller = smallers(:,randi(stam(2)));
            for j=1:ctam(2)
                if ismember(smaller(2,:),boxes{j})
                    boxes{j}(end+1) = C_bis(1,i);
                end
            end
        end
        num_boxes = size(boxes);
        valores(k) = num_boxes(2);
    end
    boxCovering = valores;

    x = iteraciones;
    y = boxCovering(iteraciones);
    
    Lb = x;
    Nb = y;
    
    N = log10(Nb)';
    R = log10(Lb)';
    figure;
    set(gcf,'color',[1 1 1]);
    set(gca, 'FontSize',15);
    p = scatter(R, N,'filled');
    title("Escala de cajas");
    hold on;
    
    dtt = p.DataTipTemplate;
    dtt.DataTipRows(1).Label = "Lb";
    dtt.DataTipRows(1).Value = Lb;
    dtt.DataTipRows(2).Label = "Nb";
    dtt.DataTipRows(2).Value = Nb;
end

