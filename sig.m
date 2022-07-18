function retval = sig(z)
    compare = 1/(1+exp(-z));
    if rand < compare
        retval = 1;
    else
        retval = 0;
    end
end

