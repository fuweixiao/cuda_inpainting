function label = selectPatch(oldMsg, edgeCost, label);
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
%
[hh, ww, len] = size(edgeCost);

for i = 1:hh
    for j = 1:ww
        %len = length(edgeCost(i, j))
        maxB = 0.0; maxIdx = -1;
        for k = 1:len
            bl = -edgeCost(i, j, k);
            if (i > 1 && oldMsg(i - 1, j, k, 2) > 0)
                bl = bl - oldMsg(i - 1, j, k, 2);
            end
            
            if (i < hh && oldMsg(i + 1, j, k, 1) > 0)
                bl = bl - oldMsg(i + 1, j, k, 1);
            end
            
            if (j > 1 && oldMsg(i, j - 1, k, 4) > 0)
                bl = bl - oldMsg(i, j - 1, k, 4);
            end
            
            if (j < ww && oldMsg(i, j + 1, k, 3) > 0)
                bl = bl - oldMsg(i, j + 1, k, 3);
            end
            
            if (bl > maxB || maxIdx < 0)
                maxB = bl;
                maxIdx = k;
            end
        end
        
        label(i, j) = maxIdx;
    end
end


end

