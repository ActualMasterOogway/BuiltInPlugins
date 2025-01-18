local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5) --[[ Line: 10 ]] --[[ Name: useSearchSourceList ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v6, v7 = l_useState_0(v5:getSourceList());
    l_useEffect_0(function() --[[ Line: 13 ]]
        -- upvalues: v5 (copy), v7 (copy)
        local v8 = v5.OnSourceListChanged:Connect(v7);
        return function() --[[ Line: 16 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {});
    return v6;
end;