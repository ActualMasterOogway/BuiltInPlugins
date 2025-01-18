local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.PluginSettingsContext);
return function(v3) --[[ Line: 8 ]] --[[ Name: usePluginSetting ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.useContext(v2);
    local v6 = v1.useCallback(function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v3 (copy)
        v4.setSetting(v3, v5);
    end, {
        v3, 
        v4.setSetting
    });
    return v4.getSetting(v3), v6;
end;