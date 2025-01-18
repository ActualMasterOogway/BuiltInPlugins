local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useInstanceSetting);
return function(v4) --[[ Line: 19 ]] --[[ Name: SettingVisualizationMode ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5, v6 = v3(v4.Setting, v4.Property, false);
    local v9 = v2.useCallback(function(v7) --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v4 (copy)
        v6(v7.Enabled);
        local l_Setting_0 = v4.Setting;
        if l_Setting_0 then
            l_Setting_0[v4.Property] = v7.Enabled;
        end;
    end, {
        v4.Setting, 
        v4.Property
    });
    return v2.createElement("VisualizationMode", {
        Title = v4.Title, 
        Enabled = v5, 
        ToolTip = v4.ToolTip, 
        [v2.Change.Enabled] = v9
    });
end;