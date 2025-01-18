local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_useState_0 = v1.useState;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5) --[[ Line: 9 ]] --[[ Name: useFetchProgressInfo ]]
    -- upvalues: l_useState_0 (copy), v1 (copy), v2 (copy)
    local v6, v7 = l_useState_0(v5:getProgressInfo());
    v1.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v7 (copy), v2 (ref)
        local v9 = v5.OnFetchProgressInfoChanged:Connect(function(v8) --[[ Line: 13 ]]
            -- upvalues: v7 (ref), v2 (ref)
            v7(v2.copy(v8));
        end);
        return function() --[[ Line: 16 ]]
            -- upvalues: v9 (copy)
            v9:Disconnect();
        end;
    end, {});
    return v6;
end;