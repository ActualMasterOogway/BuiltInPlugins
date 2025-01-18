local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5) --[[ Line: 10 ]] --[[ Name: useItems ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v6 = v5:getRenderItems();
    local v7, v8 = l_useState_0(v6);
    l_useEffect_0(function() --[[ Line: 14 ]]
        -- upvalues: v5 (copy), v8 (copy)
        local v10 = v5.OnItemsChanged:Connect(function(v9) --[[ Line: 15 ]]
            -- upvalues: v8 (ref)
            v8(v9);
        end);
        return function() --[[ Line: 19 ]]
            -- upvalues: v10 (copy)
            v10:Disconnect();
        end;
    end, {});
    return v7;
end;