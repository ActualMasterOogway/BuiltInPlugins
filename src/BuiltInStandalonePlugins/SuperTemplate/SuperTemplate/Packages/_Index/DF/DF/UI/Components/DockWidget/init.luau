local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v8 = require(l_Parent_0.UI.Components.createPluginWidget)("DockWidget", function(v2) --[[ Line: 44 ]]
    if v2.Widget then
        return v2.Widget;
    else
        local v3 = v2.Plugin:get();
        local v4 = v2.MinSize or Vector2.new(0, 0);
        local v5 = v2.ShouldRestore or false;
        local v6 = v2.Id or v2.Title;
        if v5 then
            assert(v2.OnWidgetRestored, "DockWidget expects an OnWidgetRestored function if ShouldRestore is true.\nThis DockWidget may restore as enabled, so we need to listen for that!");
        end;
        local v7 = not v5;
        return v3:CreateDockWidgetPluginGui(v6, (DockWidgetPluginGuiInfo.new(v2.InitialDockState, v2.Enabled or false, v7, v2.Size.X, v2.Size.Y, v4.X, v4.Y)));
    end;
end);
l_Typecheck_0.wrap(v8, script);
return v8;