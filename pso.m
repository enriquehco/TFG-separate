function boxes = pso(matriz,nodos,g,p,c1,c2)
    %operator (+) is defined as the interger difference of two numbers
    G = graph(matriz);
    distancias = distances(G);
    tammat = size(matriz);
    valores = [];
    iteraciones = 1:1:tammat(1);
    %for k=1:tammat(1)
    for k=1:1
        boxes = {};
        P = []; %P stores greedily selected colors for each 'particle', meaning
                %apply greedy algorithm to the initial matriz to have an
                %initial positioning of nodes,for n size of nodes
        gbest = [];
        gbestsize = 1000;
        for i=1:p
            P(end+1,:) = greedy_coloring(matriz,nodos,k); %this returns list of colors of each node
            nboxes = max(P(end));
            if ~isempty(gbest) || (nboxes < gbestsize)
                gbest = P(end,:);
                gbestsize = nboxes;
            end
        end
        V = zeros(size(P)); %V stores the velocity of each node (chance to change assigned box
        pbest = P;
        for j=1:g
            for n=1:p
                %construct boxes
                boxes = {};
                maxcolor = max(P(n,:));
                for l=1:maxcolor
                    boxes{l} = P(n,P(n,:)==l); 
                end
                
                %leverage bla bla bla
                for m=1:tammat(1)
                    omega = rand;
                    r1 = rand;
                    r2 = rand;
                    %update speeed                  
                    V(n,m) = sig(omega*V(n,m)+c1*r1*~isempty(equalbox(pbest(n,m),P(n,m)))+c2*r2*~isempty(equalbox(gbest(m),P(n,m))));
                    
                    if V(n,m) == 1
                        orig = P(n,m);
                        P(n,m) = nbest(m,P(n,m),boxes,distancias,k);
                        
                        if orig ~= P(n,m)
                            manbox = boxes{orig};
                            manbox(manbox==m)=[];
                            boxes{orig} = manbox;
                            newbox = boxes{P(n,m)};
                            newbox(end+1) = m;
                            boxes{P(n,m)} = newbox;
                        end
                    end
                end
            end
        end
        
    end
end

