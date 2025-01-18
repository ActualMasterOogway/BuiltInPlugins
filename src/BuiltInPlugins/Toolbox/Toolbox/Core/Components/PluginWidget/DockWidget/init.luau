local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Core.Components.PluginWidget.PluginWidget)("DockWidget", function(v1, v2) --[[ Line: 5 ]]
    local l_props_0 = v1.props;
    local l_plugin_0 = l_props_0.plugin;
    if l_props_0.Widget then
        return l_props_0.Widget;
    else
        return l_plugin_0:CreateDockWidgetPluginGui(v2, (DockWidgetPluginGuiInfo.new(l_props_0.InitialDockState, l_props_0.InitialEnabled, l_props_0.InitialEnabledShouldOverrideRestore, l_props_0.FloatingXSize, l_props_0.FloatingYSize, l_props_0.MinWidth, l_props_0.MinHeight)));
    end;
end);