local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v7 = require(l_Parent_0.Src.Components.Callstack.CallstackComponent);
local v8 = v1.PureComponent:extend("CallstackWindow");
v8.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_DockWidget_0 (copy), v7 (copy)
    local l_props_0 = v9.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_OnClose_0 = l_props_0.OnClose;
    return v1.createElement(l_DockWidget_0, {
        Id = "Callstack", 
        Title = l_Localization_1:getText("Callstack", "WindowName"), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        InitialDockState = Enum.InitialDockState.Bottom, 
        Size = Vector2.new(640, 480), 
        MinSize = Vector2.new(250, 200), 
        Enabled = l_Enabled_0, 
        OnClose = l_OnClose_0, 
        ShouldRestore = true, 
        OnWidgetRestored = l_props_0.OnRestore, 
        [v1.Change.Enabled] = l_props_0.OnWidgetEnabledChanged
    }, {
        Callstack = v1.createElement(v7)
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0
})(v8));