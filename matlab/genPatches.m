function [listPatchX, listPatchY] = genPatches(imgW, imgH, targetX, targetY, targetW, targetH)
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
ww = imgW / nodeW; hh = imgH / nodeH;
midX = targetX + targetW / 2; midY = targetY + targetH / 2;
listPatchX = []; listPatchY = [];
% select adjacent patches only
range = 8;

for i = -range:1:range
    for j = -range:1:range
        cX = (midX + i * nodeW) - nodeW;
        cY = (midY + j * nodeH) - nodeH;
        if (~isOverlapping(cX, cY, patchW, patchH,  targetX, targetY, targetW, targetH))
            listPatchX = [listPatchX, cX];
            listPatchY = [listPatchY, cY]; 
        end
    end
end

end

