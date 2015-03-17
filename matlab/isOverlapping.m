function [flag] = isOverlapping(patch1X, patch1Y, patch1W, patch1H,patch2X, patch2Y, patch2W, patch2H)
flag = 0;
maxLX = max(patch1X, patch2X);
minRX = min(patch1X + patch1W, patch2X + patch2W); 
maxDY = max(patch1Y, patch2Y);
minUY = min(patch1Y + patch1H, patch2Y + patch2H);
if (minRX > maxLX && minUY > maxDY)
    flag = 1;
end
end

