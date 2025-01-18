local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Standalone_0 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCommunication).Standalone;
local v4 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local l_DockWidget_0 = v2.UI.DockWidget;
local v6 = require(l_script_FirstAncestor_0.Src.Components.AnnotationListView);
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_script_FirstAncestor_0.Src.Contexts.UsernameContext);
local v11 = require(l_script_FirstAncestor_0.Src.Contexts.InputListenerContext);
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v15 = v1.PureComponent:extend("MainPlugin");
local v16 = {
    DataModel = "Standalone", 
    Category = "Actions", 
    PluginId = "PlaceAnnotations", 
    ItemId = "Toggle"
};
local v17 = {
    DataModel = "Standalone", 
    Category = "Actions", 
    PluginId = "PlaceAnnotations", 
    ItemId = "AddAnnotation"
};
v15.init = function(v18, v19) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v16 (copy), v17 (copy), l_Standalone_0 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_registerPluginStyles_0 (copy)
    local l_PluginComponent_0 = v19.Plugin:GetPluginComponent("Actions");
    v18.state = {
        enabled = false
    };
    if v4.fflagPlaceAnnotationsHotkey then
        l_PluginComponent_0:BindToActivatedAsync(v16):Connect(function() --[[ Line: 45 ]]
            -- upvalues: v18 (copy)
            v18:setState({
                enabled = not v18.state.enabled
            });
        end);
        l_PluginComponent_0:BindToActivatedAsync(v17):Connect(function() --[[ Line: 48 ]]
            -- upvalues: v19 (copy), l_Standalone_0 (ref)
            v19.Plugin:Activate(true);
            l_Standalone_0.beginAddAnnotation(v19.Plugin);
        end);
        v18.onWidgetClosed = function() --[[ Line: 52 ]]
            -- upvalues: v18 (copy)
            v18:setState({
                enabled = false
            });
        end;
    else
        l_PluginComponent_0:BindToActivatedAsync(v16):Connect(function(v21) --[[ Line: 56 ]]
            -- upvalues: v18 (copy)
            v18:setState({
                enabled = not v21.Checked
            });
        end);
        v18.onWidgetClosed = function() --[[ Line: 59 ]]
            -- upvalues: l_PluginComponent_0 (copy), v16 (ref)
            task.spawn(function() --[[ Line: 60 ]]
                -- upvalues: l_PluginComponent_0 (ref), v16 (ref)
                l_PluginComponent_0:ActivateAsync(v16);
            end);
        end;
    end;
    v18.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "PlaceAnnotations"
    });
    v18.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 78 ]]
        return {};
    end, {});
    v18.design = l_registerPluginStyles_0(v19.Plugin);
end;
v15.render = function(v22) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), v11 (copy), v1 (copy), l_DockWidget_0 (copy), v6 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v22.localization, 
        v22.analytics, 
        v10.new(), 
        v11.new()
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "PlaceAnnotations", 
            Enabled = l_enabled_0, 
            Title = v22.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v22.onWidgetClosed
        }, {
            AnnotationListView = if l_enabled_0 then v1.createElement(v6) else nil, 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v22.design
            })
        })
    });
end;
return v15;