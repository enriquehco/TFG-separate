function retval = nbest(n,x,B,distances,lb)
    retval = x;
    while ~isempty(B)
        ind = randi(size(B));
        xk = B{ind};
        B(ind) = [];
        if x == ind
            continue
        end
        f = arrayfun(@(z) distances(n,z)<lb, xk);
        if ~ismember(0,f)
            retval = ind;
            break
        end
    end
end

