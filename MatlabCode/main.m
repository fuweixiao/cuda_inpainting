% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
% mask area 
maskX = 390; maskY = 240; maskW = 3; maskH = 3;
maskW = maskW * patchW; maskH = maskH * patchH;

iteration = 10;
old_img = imread('fig.jpg');
img = im2double(old_img);
[imgH, imgW, imgChannel] = size(img);

% generate patch list
[listPatchX, listPatchY] = genPatches(imgW, imgH, maskX, maskY, maskW, maskH);
[listPatchX; listPatchY];
% generate SSD table
SSDTable = calcSSDTable(img, listPatchX, listPatchY);
%SSDTable
% init nodeTable
%img
[oldMsg, newMsg, edgeCost, nodeMidX, nodeMidY, label] = initNodeTable(img, listPatchX, listPatchY, maskX, maskY, maskW, maskH);
% iteratively
i = 0; 
while (i < iteration)
%for i = 1:iteration
    i = i + 1
    [SSDTable, oldMsg, newMsg, edgeCost, nodeMidX, nodeMidY, label] = propogaeMSG(SSDTable, oldMsg, newMsg, edgeCost, nodeMidX, nodeMidY, label);
end
% select patch
%oldMsg
%edgeCost
label = selectPatch(oldMsg, edgeCost, label);
oldMsg
label
%label;
new_img = fillPatch(old_img, nodeMidX, nodeMidY, listPatchX, listPatchY, label);
for j = maskX:1:maskX+ maskW
    i = maskY;
    new_img(i, j, :) = zeros(3,1);
end
for i = maskY:1:maskY+ maskH
    j = maskX;
    new_img(i, j, :) = zeros(3,1);
end
% writing back to the img
imwrite(new_img, 'fig_new.jpg');






