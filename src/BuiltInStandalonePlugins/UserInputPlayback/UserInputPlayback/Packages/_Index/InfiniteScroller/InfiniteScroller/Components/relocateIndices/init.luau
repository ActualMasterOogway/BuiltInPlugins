local v0 = require(script.Parent.Round);
return function(v1, v2, v3) --[[ Line: 11 ]]
    -- upvalues: v0 (copy)
    local v4 = v1.anchorIndex ~= nil;
    local v5 = v1.leadIndex ~= nil;
    local v6 = v1.trailIndex ~= nil;
    local v7 = v1.anchorIndex or 0;
    local v8 = v1.leadIndex or 0;
    local v9 = v1.trailIndex or 0;
    local v10 = v2.anchorIndex or 0;
    local v11 = v2.leadIndex or 0;
    local v12 = v2.trailIndex or 0;
    if not v4 then
        if v5 and v6 then
            if v8 == v9 then
                v7 = v8;
            else
                local v13 = (v10 - v11) / (v12 - v11);
                v7 = math.min(math.max(v0.nearest((v9 - v8) * v13 + v8), 1), v3);
            end;
        else
            v7 = if v5 then math.min(math.max(v8 + v10 - v11, 1), v3) else if v6 then math.min(math.max(v9 + v10 - v12, 1), v3) else math.min(math.max(v10, 1), v3);
        end;
    end;
    if not v6 then
        v9 = math.min(math.max(v7 + v12 - v10, 1), v3);
    end;
    if not v5 then
        v8 = math.min(math.max(v7 + v11 - v10, 1), v3);
    end;
    local v14 = math.min(v7, v8, v9);
    local v15 = math.max(v7, v8, v9);
    return {
        trailIndex = v14, 
        anchorIndex = v7, 
        leadIndex = v15
    };
end;