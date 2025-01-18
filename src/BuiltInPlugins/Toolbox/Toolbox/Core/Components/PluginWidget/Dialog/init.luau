local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Core.Components.PluginWidget.PluginWidget)("Dialog", function(v1, v2) --[[ Line: 21 ]]
    local l_props_0 = v1.props;
    local l_plugin_0 = l_props_0.plugin;
    local v5 = nil;
    v5 = not l_props_0.InitialEnabled or l_props_0.InitialEnabled;
    return l_plugin_0:CreateQWidgetPluginGui(v2, l_props_0.options or {
        Size = l_props_0.Size or nil, 
        MinSize = l_props_0.MinSize or nil, 
        Resizable = l_props_0.Resizable or nil, 
        Modal = l_props_0.Modal or nil, 
        InitialEnabled = v5
    });
end);