local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v2.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v2.UI;
local l_Slider_0 = l_UI_0.Slider;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = v1.PureComponent:extend("AnimationPlaybackSlider");
l_Util_0.Typecheck.wrap(v11, script);
v11.init = function(v12) --[[ Line: 39 ]] --[[ Name: init ]]
    v12.onValueChanged = function(v13) --[[ Line: 40 ]]
        -- upvalues: v12 (copy)
        v12.props.OnSliderPlayheadChanged(v13);
    end;
end;
v11.render = function(v14) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_Slider_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v14.props;
    local l_Size_0 = l_props_0.Size;
    local v17 = l_props_0.Playhead or 0;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local v19 = l_props_0.TrackLength or 0;
    local v20 = string.format("%.2f", v19);
    local v21 = string.format("%.2f", v17);
    local v22 = v19 <= 0;
    local v23 = l_LayoutOrderIterator_0.new();
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_PlayImage_0 = l_Stylizer_0.PlayImage;
    local l_PauseImage_0 = l_Stylizer_0.PauseImage;
    local v27 = l_props_0.ShowTime == nil or l_props_0.ShowTime;
    local v28 = if v27 then l_Stylizer_0.PlayTimeLabelWidth else 0;
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Stylizer_0.Padding
    }, {
        PlayPauseButton = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            BorderColor3 = l_Stylizer_0.BorderColor, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, l_Stylizer_0.PlayButtonWidth, 0, l_Stylizer_0.PlayButtonWidth), 
            Image = l_IsPlaying_0 and l_PauseImage_0 or l_PlayImage_0, 
            AutoButtonColor = false, 
            LayoutOrder = v23:getNextOrder(), 
            [v1.Event.Activated] = function() --[[ Line: 79 ]]
                -- upvalues: l_props_0 (copy), l_IsPlaying_0 (copy)
                if l_props_0.TrackLength and l_props_0.TrackLength > 0 then
                    l_props_0.OnPlayPauseClicked(not l_IsPlaying_0);
                end;
            end
        }), 
        ValueSlider = v1.createElement(l_Slider_0, {
            Disabled = v22, 
            Min = 0, 
            Max = v19, 
            Value = v17, 
            Size = UDim2.new(1, -l_Stylizer_0.PlayButtonWidth - v28 - l_Stylizer_0.Padding, 1, 0), 
            LayoutOrder = v23:getNextOrder(), 
            OnValueChanged = v14.onValueChanged
        }), 
        PlayTimeLabel = if v27 then v1.createElement(l_TextLabel_0, {
            Text = v21 .. " / " .. v20, 
            TextColor = v22 and l_Stylizer_0.TextDisabledColor or l_Stylizer_0.TextColor, 
            Size = UDim2.new(0, l_Stylizer_0.PlayTimeLabelWidth, 1, 0), 
            LayoutOrder = v23:getNextOrder()
        }) else nil
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));