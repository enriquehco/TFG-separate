function degrees = get_degree(matriz)
    tamm = size(matriz);
    degrees = zeros(1,tamm(1));
    
    for i=1:tamm(1)
        degrees(1,i) = nnz(matriz(i,:)); 
    end
end