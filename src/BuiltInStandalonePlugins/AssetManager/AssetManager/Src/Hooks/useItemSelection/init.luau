local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v4) --[[ Line: 8 ]] --[[ Name: useItemSelection ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v5, v6 = l_useState_0(v4:getSelection());
    l_useEffect_0(function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v6 (copy)
        local v7 = v4.OnItemSelectionChanged:Connect(v6);
        return function() --[[ Line: 14 ]]
            -- upvalues: v7 (copy)
            v7:Disconnect();
        end;
    end, {});
    return v5;
end;