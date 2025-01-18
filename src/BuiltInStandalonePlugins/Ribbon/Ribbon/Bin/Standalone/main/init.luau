local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
return function(v1) --[[ Line: 4 ]] --[[ Name: main ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    if game:GetFastFlag("DebugTestRibbonInAssetDM") then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Packages.React);
        local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
        local v4 = require(l_script_FirstAncestor_0.Src.MainPlugin);
        local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioFloatingRibbon)();
        local l_v1_QWidgetPluginGui_0 = v1:CreateQWidgetPluginGui("Ribbon", {
            Id = "Ribbon", 
            InitialEnabled = true, 
            MinSize = Vector2.new(640, 129), 
            Modal = false, 
            Panel = true, 
            Resizable = true, 
            Size = Vector2.new(640, 129), 
            Title = "Ribbon", 
            Parent = "studioTopBar", 
            AddToParentLayout = true
        });
        l_v1_QWidgetPluginGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        local v7 = nil;
        if v5 then
            v7 = v1:CreateQWidgetPluginGui("Floating", {
                Id = "Floating", 
                Callout = true, 
                Resizable = true, 
                Title = "Floating"
            });
            v7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        end;
        local v8 = v2.createElement(v4, {
            Plugin = v1, 
            Widget = l_v1_QWidgetPluginGui_0, 
            Floating = if v5 then v7 else nil
        });
        local v9 = v3.createRoot(l_v1_QWidgetPluginGui_0);
        v9:render(v8);
        v1.Unloading:Once(function() --[[ Line: 48 ]]
            -- upvalues: v9 (copy), l_v1_QWidgetPluginGui_0 (copy)
            v9:unmount();
            l_v1_QWidgetPluginGui_0:Destroy();
        end);
        return;
    end;
end;