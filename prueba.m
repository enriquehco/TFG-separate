function prueba(nodos)
    
end

N = 100; % size of square matrix
p = 0.5; % probability of 0s
A = triu(rand(N)>p, 1); % matrix of 0s and 1s (upper triangular part)
A = A + A'; % now it is symmetric