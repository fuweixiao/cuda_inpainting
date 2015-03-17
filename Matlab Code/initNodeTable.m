function [oldMsg, newMsg, edgeCost, nodeMidX, nodeMidY, label] = initNodeTable(img, listPatchX, listPatchY, targetX, targetY, targetW, targetH)
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
%
maxVal = radius * radius / 2 * 3;
%
hh = targetH / nodeH; ww = targetW / nodeW;
len = length(listPatchX);
oldMsg = maxVal * ones(hh + 1, ww + 1, len, 4);
newMsg = maxVal * ones(hh + 1, ww + 1, len, 4);
edgeCost = zeros(hh + 1, ww + 1, len);
%maxVal * ones(hh + 1, ww + 1, len);
nodeMidX = zeros(hh + 1, ww + 1);
nodeMidY = zeros(hh + 1, ww + 1);
label = -1 * ones(hh + 1, ww + 1);

for i = 1:hh+1
    for j = 1:ww+1
        nodeMidX(i, j) = targetX + j * nodeW;
        nodeMidY(i, j) = targetY + i * nodeH;
        for k = 1:len
            val = 0.0;
            if(((i == 1 || i == hh + 1) && (j >= 1 && j <= ww + 1)) || ((j == 1 || j == ww + 1) && (i >= 1 && i <= hh + 1))) 
                val = 0.0;
                %result = calcSSD(img, directionType, patch1X, patch1Y,patch2X, patch2Y)
                currPatchX = nodeMidX(i, j); currPatchY = nodeMidY(i, j);
                if (j == 1)
                    currPatchX = currPatchX - patchW;
                    currPatchY = currPatchY - nodeH;
                    val = val + calcSSD(img, 3, currPatchX, currPatchY, listPatchX(k), listPatchY(k));
                else
                    currPatchX = currPatchX;
                    currPatchY = currPatchY - nodeH;
                    val = val + calcSSD(img, 4, currPatchX, currPatchY, listPatchX(k), listPatchY(k));
                end

                if (i == 1)
                    currPatchX = currPatchX - nodeW;
                    currPatchY = currPatchY - patchH;
                    val = val + calcSSD(img, 1, currPatchX, currPatchY, listPatchX(k), listPatchY(k));
                else
                    currPatchX = currPatchX - nodeW;
                    currPatchY = currPatchY;
                    val = val + calcSSD(img, 2, currPatchX, currPatchY, listPatchX(k), listPatchY(k));
                end
            end
            edgeCost(i, j, k) = val;
            if (val < 1) 
                edgeCost(i, j, k) = maxVal;
            end
        end

    end
end

end

