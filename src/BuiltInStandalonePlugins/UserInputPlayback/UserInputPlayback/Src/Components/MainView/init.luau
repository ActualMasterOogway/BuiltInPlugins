local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Components_0 = l_Parent_0.Src.Components;
local v5 = require(l_Components_0.TabbedView);
local v6 = require(l_Components_0.PlaybackTabView);
local v7 = require(l_Components_0.RecordTabView);
local v8 = require(l_Parent_0.Src.Util.Enums);
local v9 = require(l_Parent_0.Src.Util.DMBridge);
local v10 = require(l_Parent_0.Src.Actions.Common.SetPluginState);
local l_UserInputPlaybackPluginFixTabInitiallySelected_0 = game:GetFastFlag("UserInputPlaybackPluginFixTabInitiallySelected");
local v12 = v1.PureComponent:extend("MainView");
v12.didMount = function(v13) --[[ Line: 22 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    v9.setPluginObject(v13.props.Plugin:get());
    v9.setLocalizationObject(v13.props.Localization);
    v9.setPluginStateRoduxActionHandler(v13.props.SetPluginState);
end;
v12.render = function(v14) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v1 (copy), v5 (copy), v7 (copy), l_UserInputPlaybackPluginFixTabInitiallySelected_0 (copy), v6 (copy)
    local l_props_0 = v14.props;
    local l_Localization_0 = v14.props.Localization;
    local v17 = l_props_0.PluginState == v8.PluginState.Disabled;
    local v18 = l_props_0.PluginState == v8.PluginState.Recording;
    local v19 = l_props_0.PluginState == v8.PluginState.Playing;
    return v1.createElement(v5, {
        Tabs = {
            {
                Label = l_Localization_0:getText("Plugin", "RecordingTabTitle"), 
                ContentComponent = v7, 
                Disabled = v17 or v19, 
                Key = l_UserInputPlaybackPluginFixTabInitiallySelected_0 and "Recording Tab" or nil
            }, 
            {
                Label = l_Localization_0:getText("Plugin", "PlaybackTabTitle"), 
                ContentComponent = v6, 
                Disabled = v17 or v18, 
                Key = l_UserInputPlaybackPluginFixTabInitiallySelected_0 and "Playback Tab" or nil
            }
        }
    });
end;
v12 = l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization
})(v12);
return v2.connect(function(v20, _) --[[ Line: 58 ]] --[[ Name: mapStateToProps ]]
    return {
        PluginState = v20.common.pluginState
    };
end, function(v22) --[[ Line: 64 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy)
    return {
        SetPluginState = function(v23) --[[ Line: 66 ]] --[[ Name: SetPluginState ]]
            -- upvalues: v22 (copy), v10 (ref)
            v22(v10(v23));
        end
    };
end)(v12);