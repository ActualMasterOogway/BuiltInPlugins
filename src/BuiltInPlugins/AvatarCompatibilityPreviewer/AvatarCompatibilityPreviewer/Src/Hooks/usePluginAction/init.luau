local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_PluginActions_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.PluginActions;
return function(v3, v4) --[[ Line: 10 ]] --[[ Name: usePluginAction ]]
    -- upvalues: l_PluginActions_0 (copy), v1 (copy)
    local v5 = l_PluginActions_0:use():get(v3);
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v5 (copy), v4 (copy)
        assert(not v5.Enabled, "Plugin action already registered to something");
        v5.Enabled = true;
        local v6 = v5.Triggered:Connect(v4);
        return function() --[[ Line: 19 ]]
            -- upvalues: v5 (ref), v6 (copy)
            v5.Enabled = false;
            v6:Disconnect();
        end;
    end, {
        v5, 
        v4
    });
end;