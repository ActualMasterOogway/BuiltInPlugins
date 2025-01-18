local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.Dash);
local function _(v2, v3) --[[ Line: 10 ]] --[[ Name: mergeProps ]]
    -- upvalues: v1 (copy)
    local v4 = v1.join(v2, v3);
    v4.tag = if v2.tag and v3.tag then ("%* %*"):format(v2.tag, v3.tag) else if v2.tag then v2.tag else v3.tag;
    return v4;
end;
composeStyleVariant = function(v6, ...) --[[ Line: 18 ]] --[[ Name: composeStyleVariant ]]
    -- upvalues: v1 (copy)
    local v7 = v1.copy(v6);
    v1.forEachArgs(function(v8) --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v1 (ref)
        for v9, v10 in v8 do
            local l_v7_0 = v7;
            local v12 = v7[v9] or {};
            local v13 = v1.join(v12, v10);
            v13.tag = if v12.tag and v10.tag then ("%* %*"):format(v12.tag, v10.tag) else if v12.tag then v12.tag else v10.tag;
            l_v7_0[v9] = v13;
        end;
    end, ...);
    return v7;
end;
return composeStyleVariant;