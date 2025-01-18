local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or nil;
    local v4 = if v2 ~= nil then v2.TagMenu else nil;
    if v3.type == "OpenTagMenu" then
        return v3.tag;
    elseif v3.type == "OpenGroupMenu" then
        return nil;
    elseif v3.type == "MoveTagSelectionUpOrDown" and #v2.TagData > 0 then
        if v4 ~= nil then
            local v6 = v1.findIndex(v2.TagData, function(v5) --[[ Line: 15 ]]
                -- upvalues: v4 (copy)
                return v5.Name == v4;
            end);
            if v6 == nil then
                return v4;
            else
                v6 = if v3.isDown then v6 + (v6 < #v2.TagData and 1 or 0) else v6 + (v6 > 1 and -1 or 0);
                return v2.TagData[v6].Name;
            end;
        else
            return v2.TagData[1].Name;
        end;
    else
        return v4;
    end;
end;