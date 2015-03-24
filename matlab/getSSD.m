function result = getSSD(SSDTable, p1, p2, directionType)
if (p1 > p2)
    if (directionType == 1)
        result = SSDTable(p1, p2, 2);
    elseif (directionType == 2)
        result = SSDTable(p1, p2, 1);
    elseif (directionType == 3)
        result = SSDTable(p1, p2, 4);
    else
        result = SSDTable(p1, p2, 3);
    end
else
    result = SSDTable(p1, p2, directionType);
end

end

