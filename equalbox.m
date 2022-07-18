function dev = equalbox(b1,b2)
    if isempty(setdiff(b1,b2)) && isempty(setdiff(b2,b1))
        dev = [];
    else
        dev = [setdiff(b1,b2),setdiff(b2,b1)];
    end
end

