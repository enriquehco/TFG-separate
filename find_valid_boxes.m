function choice = find_valid_boxes(b,boxes,l,distances)
    num_boxes = size(boxes);
    tamb = size(b{:});
    valid_boxes = {};
    bwascell = false;
    if isa(b,'cell') || tamb(2) > 1
        bwascell = true;
        b = b{:};
    end
    for i=1:num_boxes(2)
        tamc = size(boxes{i});
        mergeable = true;
        cwascell = false;
        compbox = boxes(i);
        
        if isa(compbox,'cell') || tamc(2) > 1
            compbox = compbox{:};
            cwascell = true;
        end
        
        for j=1:tamb(2)
            for k=1:tamc(2)
                if bwascell
                    bvalue = b(j);
                elseif ~bwascell
                    bvalue = b{j};
                end
                
                if cwascell
                    cvalue = compbox(k);
                elseif ~cwascell
                    cvalue = compbox{k};
                end
                if cvalue == bvalue || distances(cvalue,bvalue) > l
                    mergeable = false;
                end
            end
        end
            
        if ~cwascell && isa(compbox,'cell')
            compbox = compbox{:}
        end
        if ~bwascell && isa(b,'cell')
            b = b{:}
        end
        if mergeable
            valid_boxes{end+1} = {compbox b};
        end
    end
    tam_vb = size(valid_boxes);
    if tam_vb(2) > 0
        choicenum = randi(tam_vb(2));
        choice = valid_boxes{choicenum};
    else
        choice = {};
    end
end