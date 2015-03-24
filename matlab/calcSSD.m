function result = calcSSD(img, directionType, patch1X, patch1Y, patch2X, patch2Y)
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
[imgH, imgW, imgChannel] = size(img);
%
if (directionType == 1) % up_down
    pv1 = img(patch1Y + nodeH:patch1Y + patchH, patch1X:patch1X + patchW, :);
    pv2 = img(patch2Y:patch2Y + nodeH, patch2X:patch2X + patchW, :);
elseif (directionType == 2) % down_up
    pv2 = img(patch2Y + nodeH:patch2Y + patchH, patch2X:patch2X + patchW, :);
    pv1 = img(patch1Y:patch1Y + nodeH, patch1X:patch1X + patchW, :);
elseif (directionType == 3) % left_right
    pv1 = img(patch1Y:patch1Y + patchH, patch1X + nodeW:patch1X + patchW, :);
    pv2 = img(patch2Y:patch2Y + patchH, patch2X:patch2X + nodeW, :);  
else % (directionType == 4) % right_left
    pv2 = img(patch2Y:patch2Y + patchH, patch2X + nodeW:patch2X + patchW, :);
    pv1 = img(patch1Y:patch1Y + patchH, patch1X:patch1X + nodeW, :); 
end
diff = pv1 - pv2;
result = sum(sum(sum(diff .* diff)));

end

