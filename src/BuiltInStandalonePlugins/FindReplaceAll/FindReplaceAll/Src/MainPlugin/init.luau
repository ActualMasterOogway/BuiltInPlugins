local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = v2.Util.LayoutOrderIterator.new();
local l_DockWidget_0 = v2.UI.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v8 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.WidgetHeader);
local v15 = require(l_Components_0.WidgetBody);
local v16 = v1.PureComponent:extend("MainPlugin");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v18 = {
    {
        text = "Workspace.Baseplate.Script", 
        children = {
            {
                LineNumber = 1, 
                text = "Item 1.1"
            }, 
            {
                LineNumber = 2, 
                text = "Item 1.2"
            }
        }
    }, 
    {
        text = "ReplacatedStorage.Modules.MyGreatModuleScript", 
        children = {
            {
                LineNumber = 42, 
                text = "Item 2.1"
            }, 
            {
                LineNumber = 142, 
                text = "Item 2.2"
            }
        }
    }
};
v16.init = function(v19, v20) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v19.state = {
        enabled = false
    };
    v19.toggleEnabled = function() --[[ Line: 73 ]]
        -- upvalues: v19 (copy)
        v19:setState(function(v21) --[[ Line: 74 ]]
            return {
                enabled = not v21.enabled
            };
        end);
    end;
    v19.onClose = function() --[[ Line: 81 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            enabled = false
        });
    end;
    v19.onRestore = function(v22) --[[ Line: 87 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            enabled = v22
        });
    end;
    v19.onWidgetEnabledChanged = function(v23) --[[ Line: 93 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            enabled = v23.Enabled
        });
    end;
    v19.onDockWidgetCreated = function() --[[ Line: 99 ]]
        -- upvalues: v19 (copy)
        v19.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v19.toggleEnabled);
    end;
    v19.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "FindReplaceAll"
    });
    v19.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 108 ]]
        return {};
    end, {});
    v19.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v19.design = l_registerPluginStyles_0(v20.Plugin);
end;
v16.didUpdate = function(v24) --[[ Line: 116 ]] --[[ Name: didUpdate ]]
    v24.props.PluginLoaderContext.mainButton:SetActive(v24.state.enabled);
end;
v16.render = function(v25) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v8 (copy), v1 (copy), l_DockWidget_0 (copy), v14 (copy), v3 (copy), v15 (copy), v18 (copy)
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v8(), 
        v25.localization, 
        v25.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "FindReplaceAll", 
            Enabled = l_enabled_0, 
            Title = v25.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v25.onClose, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v25.onDockWidgetCreated, 
            [v1.Change.Enabled] = v25.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement("Frame", {
                [v1.Tag] = "X-Fill X-Column X-Transparent"
            }, {
                WidgetHeader = v1.createElement(v14, {
                    [v1.Tag] = "Component-WidgetHeader", 
                    LayoutOrder = v3:getNextOrder(), 
                    OnFindExpressionUpdated = function(v30) --[[ Line: 153 ]] --[[ Name: OnFindExpressionUpdated ]]
                        print("Find expression updated to", v30);
                    end, 
                    OnReplaceExpressionUpdated = function(v31) --[[ Line: 156 ]] --[[ Name: OnReplaceExpressionUpdated ]]
                        print("Replace expression updated to", v31);
                    end, 
                    OnFindTriggered = function(_) --[[ Line: 160 ]] --[[ Name: OnFindTriggered ]]
                        print("TODO: Implement FindTriggered");
                    end, 
                    OnReplaceTriggered = function(_) --[[ Line: 163 ]] --[[ Name: OnReplaceTriggered ]]
                        print("TODO: Implement ReplaceTriggered");
                    end, 
                    OnReplaceAllTriggered = function(_) --[[ Line: 166 ]] --[[ Name: OnReplaceAllTriggered ]]
                        print("TODO: Implement ReplaceAllTriggered");
                    end, 
                    OnFindPreviousTriggered = function(_) --[[ Line: 169 ]] --[[ Name: OnFindPreviousTriggered ]]
                        print("TODO: Implement FindPreviousTriggered");
                    end, 
                    OnFindNextTriggered = function(_) --[[ Line: 172 ]] --[[ Name: OnFindNextTriggered ]]
                        print("TODO: Implement FindNextTriggered");
                    end
                }), 
                WidgetBody = v1.createElement(v15, {
                    [v1.Tag] = "Component-WidgetBody", 
                    LayoutOrder = v3:getNextOrder(), 
                    FindResults = v18, 
                    ReplaceResults = {}
                })
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v25.design
            })
        })
    });
end;
return v16;