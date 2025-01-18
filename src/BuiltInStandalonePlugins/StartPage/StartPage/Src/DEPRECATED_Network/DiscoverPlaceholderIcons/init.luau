local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DiscoverGameIcons);
return function(v3) --[[ Line: 18 ]] --[[ Name: DiscoverPlaceholderIcons ]]
    -- upvalues: v2 (copy)
    if #v3.gameIds == 0 then
        return v3;
    else
        local v4 = {
            returnPolicy = "Placeholder", 
            size = "256x256", 
            format = "png", 
            universeIds = v3.gameIds
        };
        v2(v3.setter, v4);
        return v3;
    end;
end;