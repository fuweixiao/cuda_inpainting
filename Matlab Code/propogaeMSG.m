function [SSDTable, oldMsg, newMsg, edgeCost, nodeMidX, nodeMidY, label] = propogaeMSG(SSDTable, oldMsg, newMsg, edgeCost, nodeMidX, nodeMidY, label)
% patch & node size
radius = 16;
patchW = radius; patchH = radius;
nodeW = patchW / 2; nodeH = patchH / 2;
maxMsg = radius * radius / 2 * 3;
%
%[hh, ww] = size(nodeMidX);
%[len, tmp] = size(SSDTable);
[hh, ww, len] = size(edgeCost);
%1 for up, 2 for down, 3 for left, 4 for right
for i = 1:hh
    for j = 1:ww
        for k = 1:len
            aroundMsg = 0; matchFactor = 1.2;
            msgFactor = 0.6;
            msgCount = msgFactor * 3 + matchFactor; 
            
            if(i ~= 1) 
				aroundMsg = aroundMsg + oldMsg(i - 1, j, k, 2);
			else 
				aroundMsg = aroundMsg + maxMsg;
            end
            
			if(i ~= hh) 
				aroundMsg = aroundMsg + oldMsg(i + 1, j, k, 1); 
			else 
				aroundMsg = aroundMsg + maxMsg;
            end
            
			if(j ~= 1)
				aroundMsg = aroundMsg + oldMsg(i, j - 1, k, 4);
			else 
				aroundMsg = aroundMsg + maxMsg;
            end
            
			if(j ~= ww) 
				aroundMsg = aroundMsg + oldMsg(i, j + 1, k, 3);
			else 
				aroundMsg = aroundMsg + maxMsg;
            end
            
            aroundMsg = aroundMsg * msgFactor;
            aroundMsg = aroundMsg + edgeCost(i, j, k);
            
            for l = 1:len
                val = 0; oldVal = 0;
                % up
                if(i ~= 1) 
					val = aroundMsg + getSSD(SSDTable, k, l, 2) * matchFactor;
					val = val - oldMsg(i - 1, j, k, 2) * msgFactor;
					val = val / msgCount;
                    oldVal = newMsg(i, j, l, 1);
                    newMsg(i, j, l, 1) = min(val, oldVal);
                end
				% down
				if(i ~= hh) 
					val = aroundMsg + getSSD(SSDTable, k, l, 1) * matchFactor;
					val = val - oldMsg(i + 1, j, k, 1) * msgFactor;
					val = val / msgCount;
                    oldVal = newMsg(i, j, l, 2);
                    newMsg(i, j, l, 2) = min(val, oldVal);
                end
				% left
				if(j ~= 1) 
					val = aroundMsg + getSSD(SSDTable, k, l, 4) * matchFactor;
					val = val - oldMsg(i, j - 1, k, 4) * msgFactor; 
					val = val / msgCount;
                    oldVal = newMsg(i, j, l, 3);
                    newMsg(i, j, l, 3) = min(val, oldVal);
                end
				% right
				if(j ~= ww) 
				    val = aroundMsg + getSSD(SSDTable, k, l, 3) * matchFactor;
					val = val - oldMsg(i, j + 1, k, 3) * msgFactor;
					val = val / msgCount;
                    oldVal = newMsg(i, j, l, 4);
                    newMsg(i, j, l, 4) = min(val, oldVal);
                 end
            end
            
        end
    end
end

for i = 1:hh
    for j = 1:ww
        oldMsg(i, j, :, :) = newMsg(i, j, :, :);
    end
end

end

