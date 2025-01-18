local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(l_Parent_0.Src.Components.UIKeyValueTextLabel);
local v9 = require(l_Parent_0.Src.Util.StringFormatters);
local v10 = require(l_Parent_0.Src.Util.DMBridge);
local _ = require(l_Parent_0.Src.Types);
local l_PlaybackTab_0 = l_Parent_0.Src.Actions.PlaybackTab;
local v13 = require(l_PlaybackTab_0.SetCurrentRecordingDurationSec);
local v14 = require(l_PlaybackTab_0.SetCurrentRecordingNumEvents);
local v15 = require(l_PlaybackTab_0.SetCurrentRecordingResolution);
local v16 = require(l_PlaybackTab_0.SetCurrentRecordingDeviceId);
local v17 = require(l_PlaybackTab_0.SetCurrentRecordingDeviceOrientation);
local v18 = v1.PureComponent:extend("PlaybackInfoUIGroup");
v18.init = function(v19) --[[ Line: 29 ]] --[[ Name: init ]]
    v19.state = {
        dataValid = false
    };
    v19.onPlaybackInfoChanged = function(v20, v21, v22) --[[ Line: 34 ]]
        -- upvalues: v19 (copy)
        if v20 ~= nil then
            local l_props_0 = v19.props;
            l_props_0.SetCurrentRecordingDurationSec(v21);
            l_props_0.SetCurrentRecordingNumEvents(v22);
            l_props_0.SetCurrentRecordingDeviceId(v20.deviceId);
            l_props_0.SetCurrentRecordingDeviceOrientation(v20.orientation);
            local l_resolution_0 = v20.resolution;
            local v25 = Vector2.new(l_resolution_0[1], l_resolution_0[2]);
            l_props_0.SetCurrentRecordingResolution(v25);
            v19:setState({
                dataValid = true
            });
            return;
        else
            v19:setState({
                dataValid = false
            });
            return;
        end;
    end;
end;
v18.didMount = function(v26) --[[ Line: 57 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy)
    v10.connectPlaybackInfoChangedCallback(v26.onPlaybackInfoChanged);
end;
v18.willUnmount = function(_) --[[ Line: 61 ]] --[[ Name: willUnmount ]]
    -- upvalues: v10 (copy)
    v10.disconnectPlaybackInfoChangedCallback();
end;
v18.render = function(v28) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v8 (copy), v9 (copy)
    if not v28.state.dataValid then
        return nil;
    else
        local l_props_1 = v28.props;
        local l_Localization_0 = l_props_1.Localization;
        local l_Stylizer_0 = l_props_1.Stylizer;
        return v1.createElement(l_Pane_0, {
            LayoutOrder = l_props_1.LayoutOrder, 
            Style = "CornerBox", 
            Size = UDim2.fromOffset(l_Stylizer_0.UIGroupWidthPx, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
            Padding = l_Stylizer_0.PaddingPx, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Label = v1.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("PlaybackTabView", "RecordingInfoLabel"), 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            KeyValuePairs = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                RecordingDuration = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingDuration"), 
                    Value = string.format("%.2f ", l_props_1.CurrentRecordingDurationSec) .. l_Localization_0:getText("PlaybackTabView", "SecondsUnitAbbrevation"), 
                    LayoutOrder = 1
                }), 
                NumberOfEvents = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingNumberOfEvents"), 
                    Value = tostring(l_props_1.CurrentRecordingNumEvents), 
                    LayoutOrder = 2
                }), 
                RecordingDeviceId = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingDevice"), 
                    Value = v9.formatDeviceName(l_props_1.CurrentRecordingDeviceId, l_Localization_0), 
                    LayoutOrder = 3
                }), 
                RecordingOrientation = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingOrientation"), 
                    Value = v9.formatDeviceOrientation(l_props_1.CurrentRecordingDeviceOrientation, l_props_1.CurrentRecordingDeviceId, l_Localization_0), 
                    LayoutOrder = 4
                }), 
                RecordingResolution = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingResolution"), 
                    Value = v9.format2dResolution(l_props_1.CurrentRecordingResolution, l_Localization_0:getText("RecordTabView", "ResolutionPixelsName")), 
                    LayoutOrder = 5
                })
            })
        });
    end;
end;
v18 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v18);
return v2.connect(function(v32, _) --[[ Line: 144 ]] --[[ Name: mapStateToProps ]]
    return {
        CurrentRecordingDurationSec = v32.playbackTab.currentRecordingDurationSec, 
        CurrentRecordingNumEvents = v32.playbackTab.currentRecordingNumEvents, 
        CurrentRecordingDeviceId = v32.playbackTab.currentRecordingDeviceId, 
        CurrentRecordingDeviceOrientation = v32.playbackTab.currentRecordingDeviceOrientation, 
        CurrentRecordingResolution = v32.playbackTab.currentRecordingResolution
    };
end, function(v34) --[[ Line: 154 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v16 (copy), v14 (copy), v15 (copy), v17 (copy)
    return {
        SetCurrentRecordingDurationSec = function(v35) --[[ Line: 156 ]] --[[ Name: SetCurrentRecordingDurationSec ]]
            -- upvalues: v34 (copy), v13 (ref)
            v34(v13(v35));
        end, 
        SetCurrentRecordingDeviceId = function(v36) --[[ Line: 159 ]] --[[ Name: SetCurrentRecordingDeviceId ]]
            -- upvalues: v34 (copy), v16 (ref)
            v34(v16(v36));
        end, 
        SetCurrentRecordingNumEvents = function(v37) --[[ Line: 162 ]] --[[ Name: SetCurrentRecordingNumEvents ]]
            -- upvalues: v34 (copy), v14 (ref)
            v34(v14(v37));
        end, 
        SetCurrentRecordingResolution = function(v38) --[[ Line: 165 ]] --[[ Name: SetCurrentRecordingResolution ]]
            -- upvalues: v34 (copy), v15 (ref)
            v34(v15(v38));
        end, 
        SetCurrentRecordingDeviceOrientation = function(v39) --[[ Line: 168 ]] --[[ Name: SetCurrentRecordingDeviceOrientation ]]
            -- upvalues: v34 (copy), v17 (ref)
            v34(v17(v39));
        end
    };
end)(v18);