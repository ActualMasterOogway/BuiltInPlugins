local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.Cryo);
return function() --[[ Line: 13 ]] --[[ Name: useUsernameCache ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy)
    local v5, v6 = v3.useState({});
    local v7 = v3.useContext(v1);
    local v11 = v3.useCallback(function(v8) --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v6 (copy), v4 (ref)
        v7.activityHistoryClient.fetchUsernames(v8, function(v9) --[[ Line: 19 ]]
            -- upvalues: v6 (ref), v4 (ref)
            v6(function(v10) --[[ Line: 20 ]]
                -- upvalues: v4 (ref), v9 (copy)
                return v4.Dictionary.join(v10, v9);
            end);
        end);
    end, {});
    return {
        cache = v5, 
        fetchUsernames = v11
    };
end;