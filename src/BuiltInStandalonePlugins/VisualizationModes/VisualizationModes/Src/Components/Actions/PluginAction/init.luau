local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_ContextServices_0 = v2.ContextServices;
return function(v5) --[[ Line: 26 ]] --[[ Name: PluginAction ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy), v3 (copy)
    local v6 = l_ContextServices_0.Plugin:use():get();
    local v8 = v1.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v6 (copy), v5 (copy)
        if v6 == nil then
            return nil;
        else
            local l_v6_PluginAction_0 = v6:CreatePluginAction(v5.ActionId, v5.Text, v5.StatusTip, v5.IconName, v5.AllowBinding);
            if v5.Checked ~= nil then
                l_v6_PluginAction_0.Checked = v5.Checked;
            end;
            if v5.Enabled ~= nil then
                l_v6_PluginAction_0.Enabled = v5.Enabled;
            end;
            if v5.DefaultShortcut ~= nil then
                l_v6_PluginAction_0.DefaultShortcut = v5.DefaultShortcut;
            end;
            return l_v6_PluginAction_0;
        end;
    end, {
        v6, 
        v5.ActionId, 
        v5.Text, 
        v5.StatusTip, 
        v5.IconName, 
        v5.AllowBinding
    });
    local v9, v10 = v1.useState(v8);
    v1.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v9 (copy), v8 (copy), v10 (copy)
        if v9 then
            v9:Destroy();
        end;
        local v11 = v8();
        if v11 then
            v10(v11);
        end;
    end, {
        v8
    });
    v1.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v9 (copy)
        local l_v9_0 = v9;
        if l_v9_0 == nil then
            return nil;
        else
            return function() --[[ Line: 70 ]]
                -- upvalues: l_v9_0 (copy)
                l_v9_0:Destroy();
            end;
        end;
    end, {
        v9
    });
    v1.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v9 (copy), v5 (copy)
        if v9 ~= nil and v5.Checked ~= nil then
            v9.Checked = v5.Checked;
        end;
    end, {
        v9, 
        v5.Checked
    });
    v1.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v9 (copy), v5 (copy)
        if v9 ~= nil and v5.Enabled ~= nil then
            v9.Enabled = v5.Enabled;
        end;
    end, {
        v9, 
        v5.Enabled
    });
    v1.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v9 (copy), v5 (copy)
        if v9 ~= nil and v5.DefaultShortcut ~= nil then
            v9.DefaultShortcut = v5.DefaultShortcut;
        end;
    end, {
        v9, 
        v5.DefaultShortcut
    });
    if v9 then
        v3.useEventConnection(v9.Triggered, function() --[[ Line: 95 ]]
            -- upvalues: v5 (copy)
            if v5.OnTrigger then
                v5.OnTrigger();
            end;
        end, {
            v9, 
            v5.OnTrigger
        });
    end;
    return nil;
end;