local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Pane_0 = l_UI_0.Pane;
local v9 = require(l_Parent_0.Src.Util.Enums);
local v10 = require(l_Parent_0.Src.Util.DMBridge);
local v11 = require(l_Parent_0.Src.Actions.Common.SetPluginState);
local v12 = v1.PureComponent:extend("RecordingFileSelector");
local l_UserInputPlaybackPluginFixRecordingFileSelectorNotUpdating_0 = game:GetFastFlag("UserInputPlaybackPluginFixRecordingFileSelectorNotUpdating");
v12.init = function(v14) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v9 (copy)
    v14.state = {
        playbackFileNameOptions = {}, 
        selectedRecordingIndex = nil
    };
    v14.DEPRECATED_updatePlaybackFileNameOptions = function(_, v16) --[[ Line: 31 ]]
        -- upvalues: v10 (ref)
        if v16.UserInputType == Enum.UserInputType.MouseButton1 and v16.UserInputState == Enum.UserInputState.Begin then
            v10.searchForUserInputRecordings();
        end;
    end;
    v14.setPlayableRecordings = function(v17) --[[ Line: 40 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            playbackFileNameOptions = v17
        });
    end;
    v14.loadRecordingIndex = function(v18) --[[ Line: 46 ]]
        -- upvalues: v14 (copy), v10 (ref)
        local l_playbackFileNameOptions_0 = v14.state.playbackFileNameOptions;
        assert(l_playbackFileNameOptions_0);
        local v20 = l_playbackFileNameOptions_0[v18];
        assert(v20);
        v10.loadRecordingWithName(v20);
    end;
    v14.onSelectInputItemActivated = function(v21, v22) --[[ Line: 54 ]]
        -- upvalues: v14 (copy), v9 (ref), v10 (ref)
        local l_props_0 = v14.props;
        if l_props_0.PluginState ~= v9.PluginState.Playing and l_props_0.PluginState ~= v9.PluginState.Disabled then
            v14:setState({
                selectedRecordingIndex = v22
            });
            l_props_0.OnCanStartPlaying(true);
            v10.loadRecordingWithName(v21);
        end;
    end;
    v14.onMouseEnter = function(_, _) --[[ Line: 65 ]]
        -- upvalues: v10 (ref)
        v10.searchForUserInputRecordings();
    end;
end;
v12.didMount = function(v26) --[[ Line: 70 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy)
    v10.connectSetPlayableRecordingsCallback(v26.setPlayableRecordings);
end;
v12.willUnmount = function(v27) --[[ Line: 74 ]] --[[ Name: willUnmount ]]
    -- upvalues: v10 (copy), v9 (copy)
    v10.disconnectSetPlayableRecordingsCallback();
    v27.props.SetPluginState(v9.PluginState.Default);
end;
v12.render = function(v28) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_UserInputPlaybackPluginFixRecordingFileSelectorNotUpdating_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy)
    local l_props_1 = v28.props;
    local l_state_0 = v28.state;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        [v1.Event.InputBegan] = if l_UserInputPlaybackPluginFixRecordingFileSelectorNotUpdating_0 then nil else v28.DEPRECATED_updatePlaybackFileNameOptions, 
        [v1.Event.MouseEnter] = if l_UserInputPlaybackPluginFixRecordingFileSelectorNotUpdating_0 then v28.onMouseEnter else nil
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("PlaybackTabView", "PlayFileLabel"), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = -1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Input = v1.createElement(l_SelectInput_0, {
            Style = l_Stylizer_0.PlaybackSelectInput, 
            Items = l_state_0.playbackFileNameOptions, 
            PlaceholderText = l_Localization_0:getText("PlaybackTabView", "SelectInputDefaultText"), 
            SelectedIndex = l_state_0.selectedRecordingIndex, 
            OnItemActivated = v28.onSelectInputItemActivated
        })
    });
end;
v12 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v12);
return v2.connect(function(v33, _) --[[ Line: 122 ]] --[[ Name: mapStateToProps ]]
    return {
        ShouldSetEmulationDevice = v33.playbackTab.shouldSetEmulationDevice, 
        PluginState = v33.common.pluginState
    };
end, function(v35) --[[ Line: 129 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy)
    return {
        SetPluginState = function(v36) --[[ Line: 131 ]] --[[ Name: SetPluginState ]]
            -- upvalues: v35 (copy), v11 (ref)
            v35(v11(v36));
        end
    };
end)(v12);