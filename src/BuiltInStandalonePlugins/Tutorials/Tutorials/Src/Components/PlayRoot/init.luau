local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v8 = require(l_Parent_0.Src.Resources.MakeTheme);
local v9 = require(l_Parent_0.Src.Components.TourWidget);
local v10 = {
    DataModel = "PlayClient", 
    PluginType = "Standalone", 
    PluginId = "Tutorials", 
    Category = "Panels", 
    ItemId = "PlaytestWidget"
};
local v11 = {
    PluginId = "MainWindow", 
    Category = "Widgets", 
    ItemId = "Main"
};
local v12 = v1.PureComponent:extend("PlayRoot");
v12.init = function(v13) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: l_Localization_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v2 (copy)
    v13.state = {
        stepData = nil, 
        widget = nil
    };
    v13.localization = l_Localization_0.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Tutorials", 
        libraries = {
            [v2.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v2.Resources.SourceStrings, 
                translationResourceTable = v2.Resources.LocalizedStrings
            }
        }
    });
end;
v12.didMount = function(v14) --[[ Line: 49 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy), v11 (copy)
    local l_Plugin_0 = v14.props.Plugin;
    local l_l_Plugin_0_QWidgetPluginGui_0 = l_Plugin_0:CreateQWidgetPluginGui("PlaytestWidget", {
        Size = Vector2.new(275, 350), 
        MinSize = Vector2.new(275, 350), 
        Modal = false, 
        Callout = true, 
        InitialEnabled = true
    });
    l_l_Plugin_0_QWidgetPluginGui_0.Name = "PlaytestWidget";
    v14.connection = l_Plugin_0:OnInvoke("SendPlayStep", function(v17) --[[ Line: 59 ]]
        -- upvalues: v14 (copy), l_Plugin_0 (copy), v10 (ref), v11 (ref)
        v14:setState({
            stepData = v17
        });
        l_Plugin_0:GetPluginComponent("Panels"):SetAttachmentAsync(v10, {
            TargetWidgetUri = v11, 
            SubjectAnchorPoint = Vector2.new(0, 0), 
            TargetAnchorPoint = Vector2.new(0, 0), 
            Offset = Vector2.new(20, 20)
        });
    end);
    v14:setState({
        widget = l_l_Plugin_0_QWidgetPluginGui_0
    });
    l_Plugin_0:Invoke("GetPlayStep");
end;
v12.willUnmount = function(v18) --[[ Line: 79 ]] --[[ Name: willUnmount ]]
    if v18.connection then
        v18.connection:Disconnect();
    end;
end;
v12.render = function(v19) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Mouse_0 (copy), v8 (copy), v1 (copy), v9 (copy)
    local l_props_0 = v19.props;
    local l_state_0 = v19.state;
    local l_Plugin_1 = l_props_0.Plugin;
    if not l_state_0.widget then
        return nil;
    else
        return l_ContextServices_0.provide({
            l_ContextServices_0.Plugin.new(l_Plugin_1), 
            l_Mouse_0.new(l_Plugin_1:getMouse()), 
            v8(), 
            v19.localization
        }, {
            Tour = v1.createElement(v9, {
                OnNext = function() --[[ Line: 101 ]] --[[ Name: OnNext ]]

                end, 
                OnSkip = function() --[[ Line: 102 ]] --[[ Name: OnSkip ]]
                    -- upvalues: l_Plugin_1 (copy)
                    l_Plugin_1:Invoke("SkipStep");
                end, 
                OnQuit = function() --[[ Line: 105 ]] --[[ Name: OnQuit ]]
                    game:GetService("TutorialService"):PromptClosePlace();
                end, 
                Plugin = l_Plugin_1, 
                PressedKeys = {}, 
                StepData = l_state_0.stepData, 
                Widget = l_state_0.widget
            })
        });
    end;
end;
return v12;