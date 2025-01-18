local v0 = {};
local function v1(v2, v3, v4) --[[ Line: 4 ]] --[[ Name: _getElementByName ]]
    -- upvalues: v1 (copy)
    local l_v2_Children_0 = v2:GetChildren();
    if #l_v2_Children_0 == 0 then
        return nil;
    else
        for v6 = 1, #l_v2_Children_0 do
            if v4 and v2.Name then
                return v2;
            else
                local v7 = v1(l_v2_Children_0[v6], v3, true);
                if v7 then
                    return v7;
                end;
            end;
        end;
        return nil;
    end;
end;
v0.getElementByName = function(v8, v9, _) --[[ Line: 29 ]] --[[ Name: getElementByName ]]
    -- upvalues: v1 (copy)
    return (v1(v8, v9));
end;
return v0;