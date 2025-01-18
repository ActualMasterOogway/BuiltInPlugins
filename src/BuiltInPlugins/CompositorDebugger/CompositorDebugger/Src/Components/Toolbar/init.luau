local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v14 = require(l_Thunks_0.SetScrubberOffset);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v16 = require(l_Util_0.Constants);
local v17 = require(script.settingsButton);
local v18 = require(script.scrubber);
local v19 = require(script.timeline);
local v20 = require(script.styles);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v22 = v1.PureComponent:extend("Toolbar");
v22.init = function(v23) --[[ Line: 44 ]] --[[ Name: init ]]
    v23.onPlayPauseClicked = function() --[[ Line: 45 ]]
        -- upvalues: v23 (copy)
        local l_props_0 = v23.props;
        local v25 = l_props_0.HistoryFrame == nil;
        l_props_0.SetScrubberOffset(0, nil);
        if not v25 then
            l_props_0.SetScrubberOffset(nil, nil);
        end;
    end;
    v23.onPreviousClicked = function() --[[ Line: 58 ]]
        -- upvalues: v23 (copy)
        v23.props.SetScrubberOffset(nil, 1);
    end;
    v23.onNextClicked = function() --[[ Line: 63 ]]
        -- upvalues: v23 (copy)
        v23.props.SetScrubberOffset(nil, -1);
    end;
end;
v22.render = function(v26) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v20 (copy), v1 (copy), l_Pane_0 (copy), v19 (copy), v18 (copy), l_Button_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy), v17 (copy)
    local l_props_1 = v26.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_FrameBuffer_0 = l_props_1.FrameBuffer;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    if l_FrameBuffer_0 then
        v30 = l_FrameBuffer_0:getSize() / v16.FRAMERATE;
        v31 = 1 + (l_props_1.HistoryOffset or 0) / v30;
        v32 = if l_FrameBuffer_0.first and l_FrameBuffer_0.last then l_FrameBuffer_0.last.timestamp - l_FrameBuffer_0.first.timestamp else 0;
    end;
    local l_Offset_0 = v20:GetAttribute("Padding").Offset;
    local v34 = l_props_1.HistoryFrame == nil;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "Toolbar X-Fill X-RowS X-Middle"
    }, {
        Timeline = if l_FrameBuffer_0 then v1.createElement(v19, {
            Size = UDim2.new(1, -100, 1, 0), 
            Timespan = v30, 
            LayoutOrder = 1, 
            MouseOffset = l_Offset_0, 
            [v1.Tag] = "Timeline"
        }, {
            Scrubber = v1.createElement(v18, {
                Position = UDim2.fromScale(v31, 0), 
                ZIndex = 2
            }), 
            BufferBar = v1.createElement(l_Pane_0, {
                ZIndex = 1, 
                Size = UDim2.new(math.clamp(v32 / v30, 0, 1), 0, 0, v20:GetAttribute("BufferBarHeight"))
            })
        }) else v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, -100, 1, 0)
        }), 
        Previous = v1.createElement(l_Button_0, {
            Style = "Round", 
            Size = UDim2.fromOffset(20, 20), 
            LayoutOrder = 2, 
            OnClick = v26.onPreviousClicked, 
            [v1.Tag] = "MediaButton"
        }, {
            Icon = v1.createElement(l_Image_0, {
                Image = "rbxasset://textures/CompositorDebugger/previous.png"
            }), 
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("Tooltips", "PrevFrame")
            })
        }), 
        PlayPauseButton = v1.createElement(l_Button_0, {
            Style = "Round", 
            Size = UDim2.fromOffset(20, 20), 
            LayoutOrder = 3, 
            OnClick = v26.onPlayPauseClicked
        }, {
            Icon = v1.createElement(l_Image_0, {
                Size = UDim2.fromOffset(20, 20), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v34 and "rbxasset://textures/CompositorDebugger/pause.png" or "rbxasset://textures/CompositorDebugger/play.png"
            }), 
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("Tooltips", v34 and "Pause" or "Resume")
            })
        }), 
        Next = v1.createElement(l_Button_0, {
            Style = "Round", 
            Size = UDim2.fromOffset(20, 20), 
            LayoutOrder = 4, 
            OnClick = v26.onNextClicked
        }, {
            Icon = v1.createElement(l_Image_0, {
                Size = UDim2.fromOffset(20, 20), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/CompositorDebugger/next.png"
            }), 
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("Tooltips", "NextFrame")
            })
        }), 
        SettingsButton = v1.createElement(v17, {
            Size = UDim2.fromOffset(20, 20), 
            FrameBuffer = l_props_1.FrameBuffer, 
            LayoutOrder = 5, 
            AnchorPoint = Vector2.new(1, 0.5)
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("Tooltips", "Settings")
            })
        })
    });
end;
v22 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v22);
return (v2.connect(function(v35, _) --[[ Line: 186 ]] --[[ Name: mapStateToProps ]]
    return {
        HistoryFrame = v35.Status.HistoryFrame, 
        HistoryOffset = v35.Status.HistoryOffset
    };
end, function(v37) --[[ Line: 193 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        SetScrubberOffset = function(v38, v39) --[[ Line: 195 ]] --[[ Name: SetScrubberOffset ]]
            -- upvalues: v37 (copy), v14 (ref)
            v37(v14(v38, v39));
        end
    };
end)(v22));