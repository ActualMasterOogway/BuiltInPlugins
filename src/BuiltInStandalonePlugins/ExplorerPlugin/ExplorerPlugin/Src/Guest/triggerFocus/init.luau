local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local l_StudioUri_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.StudioUri;
return function(v2) --[[ Line: 7 ]] --[[ Name: triggerFocus ]]
    -- upvalues: l_StudioUri_0 (copy)
    local l_v2_PluginComponent_0 = v2:GetPluginComponent("Actions");
    task.spawn(function() --[[ Line: 9 ]]
        -- upvalues: l_v2_PluginComponent_0 (copy), l_StudioUri_0 (ref)
        l_v2_PluginComponent_0:ActivateAsync(l_StudioUri_0.fromAction("BuilderTools", "ZoomExtents"));
    end);
end;