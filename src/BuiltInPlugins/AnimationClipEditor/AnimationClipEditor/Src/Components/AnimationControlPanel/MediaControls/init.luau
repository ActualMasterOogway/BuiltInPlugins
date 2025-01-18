local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.LayoutOrderIterator);
local l_Button_0 = v2.UI.Button;
local v8 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v9 = v1.PureComponent:extend("MediaControls");
v9.makeButton = function(v10, v11, v12, v13, v14) --[[ Line: 52 ]] --[[ Name: makeButton ]]
    -- upvalues: v1 (copy), v5 (copy), l_Button_0 (copy), v8 (copy)
    local l_button_0 = v10.props.Stylizer.button;
    return v1.createElement("Frame", {
        LayoutOrder = v10.layoutOrderIterator:getNextOrder(), 
        Size = UDim2.new(0, v5.TIMELINE_HEIGHT, 0, v5.TIMELINE_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        Button = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            OnClick = v12, 
            Style = l_button_0.MediaControl
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v11, 
                ImageColor3 = v13.iconColor
            }), 
            Tooltip = v14 and v1.createElement(v8, {
                TextKey = v14
            })
        })
    });
end;
v9.makeToggle = function(v16, v17, v18, v19, v20, v21, v22) --[[ Line: 78 ]] --[[ Name: makeToggle ]]
    -- upvalues: v1 (copy), v5 (copy), l_Button_0 (copy), v8 (copy)
    local l_button_1 = v16.props.Stylizer.button;
    return v1.createElement("Frame", {
        LayoutOrder = v16.layoutOrderIterator:getNextOrder(), 
        Size = UDim2.new(0, v5.TIMELINE_HEIGHT, 0, v5.TIMELINE_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        Button = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Style = v17 and l_button_1.ActiveControl or l_button_1.MediaControl, 
            OnClick = v20
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v17 and v18 or v19, 
                ImageColor3 = v17 and v21.iconHighlightColor or v21.iconColor
            }), 
            Tooltip = v22 and v1.createElement(v8, {
                TextKey = v22
            })
        })
    });
end;
v9.makePlayToggle = function(v24, v25, v26, v27, v28, v29, v30, v31) --[[ Line: 111 ]] --[[ Name: makePlayToggle ]]
    -- upvalues: v1 (copy), v5 (copy), l_Button_0 (copy), v8 (copy)
    local l_button_2 = v24.props.Stylizer.button;
    return v1.createElement("Frame", {
        LayoutOrder = v24.layoutOrderIterator:getNextOrder(), 
        Size = UDim2.new(0, v5.TIMELINE_HEIGHT, 0, v5.TIMELINE_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        Button = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Style = v25 and l_button_2.ActiveControl or l_button_2.MediaControl, 
            OnClick = function() --[[ Line: 130 ]] --[[ Name: OnClick ]]
                -- upvalues: v24 (copy), v25 (copy), v5 (ref), v28 (copy)
                if v24.props.SetPlayState then
                    v24.props.SetPlayState(if v25 then v5.PLAY_STATE.Pause else v28);
                end;
            end
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = if v25 then v26 else v27, 
                ImageColor3 = v25 and v29.iconHighlightColor or v29.iconColor
            }), 
            Tooltip = v1.createElement(v8, {
                TextKey = if v25 then v30 else v31
            })
        })
    });
end;
v9.render = function(v33) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v6 (copy), v1 (copy)
    local l_props_0 = v33.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_IsLooping_0 = l_props_0.IsLooping;
    local v37 = l_props_0.PlayState == v5.PLAY_STATE.Reverse;
    local _ = l_props_0.PlayState == v5.PLAY_STATE.Pause;
    local v39 = l_props_0.PlayState == v5.PLAY_STATE.Play;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_SkipBackward_0 = l_props_0.SkipBackward;
    local l_SkipForward_0 = l_props_0.SkipForward;
    local l_ToggleLooping_0 = l_props_0.ToggleLooping;
    local l_GoToFirstFrame_0 = l_props_0.GoToFirstFrame;
    local l_GoToLastFrame_0 = l_props_0.GoToLastFrame;
    local l_playbackTheme_0 = l_Stylizer_0.playbackTheme;
    v33.layoutOrderIterator = v6.new();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(0, v5.CONTROLS_WIDTH, 0, v5.TIMELINE_HEIGHT)
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        GoToFirstFrame = v33:makeButton(l_playbackTheme_0.goToFirstFrame, l_GoToFirstFrame_0, l_playbackTheme_0, "GoToFirstFrame"), 
        SkipBackward = v33:makeButton(l_playbackTheme_0.skipBackward, l_SkipBackward_0, l_playbackTheme_0, "SkipBackward"), 
        Reverse = v33:makePlayToggle(v37, l_playbackTheme_0.pause, l_playbackTheme_0.reverse, v5.PLAY_STATE.Reverse, l_playbackTheme_0, "Pause", "Reverse"), 
        Play = v33:makePlayToggle(v39, l_playbackTheme_0.pause, l_playbackTheme_0.play, v5.PLAY_STATE.Play, l_playbackTheme_0, "Pause", "Play"), 
        SkipForward = v33:makeButton(l_playbackTheme_0.skipForward, l_SkipForward_0, l_playbackTheme_0, "SkipForward"), 
        GoToLastFrame = v33:makeButton(l_playbackTheme_0.goToLastFrame, l_GoToLastFrame_0, l_playbackTheme_0, "GoToLastFrame"), 
        Loop = v33:makeToggle(l_IsLooping_0, l_playbackTheme_0.loop, l_playbackTheme_0.loop, l_ToggleLooping_0, l_playbackTheme_0, "ToggleLooping")
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));