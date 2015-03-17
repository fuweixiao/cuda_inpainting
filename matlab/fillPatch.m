function [new_img] = fillPatch(old_img, nodeMidX, nodeMidY, listPatchX, listPatchY, label)
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
[hh, ww, len] = size(label);

new_img = old_img;
for i = 1:hh
    for j = 1:ww
        if (label <= 0)
            display('uninitialized label!');
        else
            new_img = pastePatch(new_img, old_img, nodeMidX, nodeMidY, listPatchX(label), listPatchY(label));
        end
    end
end

end

function [new_img] = pastePatch(new_img, old_img, nodeMidX, nodeMidY, patchX, patchY)
    % patch & node size
    radius = 16;
    patchW = radius; patchH = radius;
    nodeW = patchW / 2; nodeH = patchH / 2;
    % 
    xx = nodeMidX - nodeW;
    yy = nodeMidY - nodeH;
    
    for i = 0:patchH - 1
        for j = 0:patchW - 1
            new_img(yy + i, xx + j, :) = old_img(patchY + i, patchX + j, :);
        end
    end
    
end