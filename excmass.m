function masses = excmass(U,nodos,distancias,k)
    tamu = size(U);
    tamn = size(nodos);
    masses = zeros(tamn);
    indexes = U;
    for i=1:tamu(2)
        for j=1:tamu(2)
            if distancias(U(i),U(j)) <= k && j ~= i
                masses(U(i)) = masses(U(i)) + 1;
            end
        end
    end
end

