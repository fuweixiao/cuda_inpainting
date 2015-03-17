function SSDTable = calcSSDTable(img, listPatchX, listPatchY)
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
len = length(listPatchX);
SSDTable = zeros(len, len, 4);
for i = 1:len
    for j = i:len
        for type = 1:4;
            SSDTable(i, j, type) = calcSSD(img, type, listPatchX(i), listPatchY(i), listPatchX(j), listPatchY(j));
        end
    end
end
size(SSDTable);
end

