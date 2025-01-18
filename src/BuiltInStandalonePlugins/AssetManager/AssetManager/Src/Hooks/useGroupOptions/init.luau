local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v5) --[[ Line: 10 ]] --[[ Name: useGroupOptions ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v6, v7 = l_useState_0(v5:getGroupOptions());
    local v8, v9 = l_useState_0(v5:getToggleSet());
    l_useEffect_0(function() --[[ Line: 14 ]]
        -- upvalues: v5 (copy), v7 (copy)
        local v10 = v5.OnGroupOptionsChanged:Connect(v7);
        return function() --[[ Line: 17 ]]
            -- upvalues: v10 (copy)
            v10:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v9 (copy)
        local v11 = v5.OnToggleSetChanged:Connect(v9);
        return function() --[[ Line: 25 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
    end, {});
    return v6, v8;
end;