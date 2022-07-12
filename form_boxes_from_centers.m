function boxes = form_boxes_from_centers(C,candidates,distancias,k)
    boxes = {};
    tn = size(candidates);
    tc = size(C);
    for i=1:tc(2)
        boxes{end+1} = C(i);
    end
    mindists = [candidates;zeros(1,tn(2));zeros(1,tn(2))+k];
    for i=1:tn(2)
        for j=1:tc(2)
            if distancias(candidates(i),C(j)) <= mindists(3,i)
                mindists(3,i) = distancias(candidates(i),C(j));
                mindists(2,i) = C(j);
            end
        end
    end
    mindists = sortrows(mindists',3)';    
    
    C_bis = mindists(:,mindists(3,:)~=0);
    cbtam = size(C_bis);
    ctam = size(C);
    for i=1:cbtam(2)
        smallers = mindists(:,mindists(3,:)<C_bis(3,i));
        stam = size(smallers);
        smaller = smallers(:,randi(stam(2)));
        for j=1:ctam(2)
            if ismember(smaller(2,:),boxes{j})
                boxes{j}(end+1) = C_bis(1,i);
            end
        end
    end
end

