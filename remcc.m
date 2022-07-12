function boxes = remcc(matriz,nodos)
    %this function defines k as the distance, not size of the box, much
    %like other algorithms we'll see in this thesis
    G = graph(matriz);
    distancias = distances(G);
    distancias(distancias==0)=inf;
    tammat = size(matriz);
    valores = [];
    iteraciones = 1:1:tammat(1);
    sh_paths = [];
    for i=1:tammat(1)
        sh_paths(end+1)= sum(distancias(i,distancias(i,:)~=inf))/(tammat(1)-1);
    end
    for k=1:tammat(1)
        U = nodos; %list of uncovered nodes
        C = []; %list of center nodes
        boxes = {};
        utam = size(U);
        %distances already gives us average shortest distance path between
        %nodes, so now we calculate excluded mass for all nodes,
        while ~isempty(U)
            masses = excmass(U,nodos,distancias,k); %returns list of masses of U on the first row
            %and number of node on the second row.
            if ~any(masses)
               maxnode = U(randi(length(U),1));
            else
                tamm = size(masses);
                maxf = 0;
                maxnode = 0;
                for n=1:tamm(2)
                    f = masses(1,n)*sh_paths(1,n);
                    if f > maxf
                        maxf = f;
                        maxnode = n;
                    end
                end
            end
            
            C(end+1) = maxnode;
            maxnodeball = seed_ball(maxnode,U,distancias,k);
            U = setdiff(U,maxnodeball);
        end
        %box forming of memb with all reached centers
        index = 1:tammat(1)+1:tammat(1)*tammat(2);
        distancias(index)=0;
        boxes = form_boxes_from_centers(C,nodos,distancias,k);
        
        num_boxes = size(boxes);
        valores(k) = num_boxes(2);
    end
end

