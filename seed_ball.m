function ball = seed_ball(node,nodes,distancias,k)
    tamn=size(nodes);
    ball = [];
    ball(end+1) = node;
    for i=1:tamn(2)
        if node ~= nodes(1,i) && distancias(node,nodes(1,i)) <= k
            ball(end+1) = nodes(1,i);
        end
    end
end

