local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
return require(l_script_FirstAncestor_0.Src.Components.PluginWidget.PluginWidget)("DockWidget", function(v1, v2) --[[ Line: 5 ]]
    local l_props_0 = v1.props;
    local l_Plugin_0 = l_props_0.Plugin;
    if l_props_0.Widget then
        return l_props_0.Widget;
    else
        return l_Plugin_0:CreateDockWidgetPluginGui(v2, (DockWidgetPluginGuiInfo.new(l_props_0.InitialDockState, l_props_0.InitialEnabled, l_props_0.InitialEnabledShouldOverrideRestore, l_props_0.Size.X, l_props_0.Size.Y, l_props_0.MinSize.X, l_props_0.MinSize.Y)));
    end;
end);