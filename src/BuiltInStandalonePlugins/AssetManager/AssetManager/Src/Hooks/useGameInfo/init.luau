local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
return function(v5) --[[ Line: 9 ]] --[[ Name: useGameInfo ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v6, v7 = l_useState_0(v5:getGameInfo());
    l_useEffect_0(function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v7 (copy)
        local v8 = v5.OnGameInfoFetched:Connect(v7);
        return function() --[[ Line: 15 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {});
    return v6;
end;