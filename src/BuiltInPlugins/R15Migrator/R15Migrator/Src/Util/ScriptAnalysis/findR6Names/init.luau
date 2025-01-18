local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.StringUtil);
local function v5(v2, v3, v4) --[[ Line: 4 ]] --[[ Name: checkName ]]
    -- upvalues: v1 (copy)
    if v1.MatchBeforeOrAfter(v4, v2, v3, "%w", "%w") then
        return false;
    elseif v1.MatchBeforeAndAfter(v4, v2, v3, "[\"]", "[\"]") then
        return true;
    elseif v1.MatchBeforeAndAfter(v4, v2, v3, "[']", "[']") then
        return true;
    elseif v1.MatchBeforeAndAfter(v4, v2, v3, "[.]", "[[:%s.=,\r\n\t]", false, true) then
        return true;
    else
        return false;
    end;
end;
return function(v6, v7, v8, v9, v10) --[[ Line: 27 ]]
    -- upvalues: v5 (copy)
    local v11 = 1;
    for _, v13 in v8 do
        local v14 = nil;
        local v15 = nil;
        repeat
            local v16, v17 = string.find(v6, v13, v11);
            v14 = v16;
            v15 = v17;
            if v14 and v15 then
                if not v9 or v5(v14, v15, v6) then
                    v10(v14, v15, v13, v6, v7);
                end;
                v11 = v15;
            end;
        until v14 == nil and v15 == nil;
        v11 = 1;
    end;
end;