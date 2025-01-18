local v0 = require(script.Parent.Parent.getDescendants);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if v1 then
        local v3 = {};
        local v4 = v0({}, v1);
        for _, v6 in ipairs(v4) do
            if v2 and v6:IsA("WrapTarget") then
                v3[v6.Parent] = v6;
            elseif not v2 and v6:IsA("WrapLayer") then
                v3[v6.Parent] = v6;
            end;
        end;
        return v3;
    else
        return;
    end;
end;