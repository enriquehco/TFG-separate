function [node,mbox] = maxexcmass(U,NCN,distancias,k)
    tamncn = size(NCN);
    tamu = size(U);
    max_mass = 0;
    node = 0;
    mbox = [];
    for i=1:tamncn(2)
        ex_mass = 0;
        curr_box = [];
        curr_box(end+1) = NCN(i);
        for j=1:tamu(2)
            if distancias(NCN(i),U(j)) <= k && U(j) ~= node
                ex_mass = ex_mass + 1;
                curr_box(end+1) = U(j);
            end
        end
        if ex_mass > max_mass
            node = NCN(i);
            max_mass = ex_mass;
            mbox = curr_box;
        end
    end
end

