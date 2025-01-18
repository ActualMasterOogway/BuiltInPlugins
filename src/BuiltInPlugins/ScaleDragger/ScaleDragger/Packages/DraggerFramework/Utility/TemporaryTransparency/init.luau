local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = setmetatable({
        _draggingModifiedParts = {}
    }, v0);
    for _, v4 in ipairs(v1) do
        if v4:IsA("BasePart") then
            v4.LocalTransparencyModifier = 0.4;
            table.insert(v2._draggingModifiedParts, v4);
        end;
    end;
    return v2;
end;
v0.destroy = function(v5) --[[ Line: 21 ]] --[[ Name: destroy ]]
    for _, v7 in ipairs(v5._draggingModifiedParts) do
        v7.LocalTransparencyModifier = 0;
    end;
end;
return v0;