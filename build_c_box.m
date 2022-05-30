function box = build_c_box(n,k,full_m,distancias)
    box = int16.empty(3,0);
    n_el = full_m(1,n);
    box(:,end+1) = full_m(:,n);
    tami = size(full_m);
    for i=1:tami(2)
        ni = full_m(1,i);
        if n_el~=ni && distancias(n_el,ni) <= k
            box(:,end+1) = full_m(:,i);
        end
    end
end