local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.StyleModifier);
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = require(l_Parent_0.Util.formatDuration);
local v7 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v8 = require(l_Parent_0.UI.Components.Container);
local v9 = require(l_Parent_0.UI.Components.HoverArea);
local v10 = require(l_Parent_0.UI.Components.LoadingIndicator);
local v11 = require(l_Parent_0.UI.Components.Slider);
local v12 = require(l_Parent_0.UI.Components.TextLabel);
local v13 = v1.PureComponent:extend("MediaPlayerControls");
v5.wrap(v13, script);
local function v14() --[[ Line: 42 ]]

end;
v13.init = function(v15) --[[ Line: 44 ]] --[[ Name: init ]]
    v15.onClickPlayPause = function() --[[ Line: 45 ]]
        -- upvalues: v15 (copy)
        if not v15.props.IsLoaded then
            return;
        elseif v15.props.IsPlaying then
            v15.props.OnPause();
            return;
        else
            v15.props.OnPlay();
            return;
        end;
    end;
end;
v13.calculateSize = function(v16) --[[ Line: 58 ]] --[[ Name: calculateSize ]]
    local l_Size_0 = v16.Scrubber.Size;
    local l_Size_1 = v16.Controls.Size;
    return UDim2.new(UDim.new(1, 0), l_Size_0.Y + l_Size_1.Y);
end;
v13.render = function(v19) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v8 (copy), v13 (ref), v11 (copy), v14 (copy), v7 (copy), v4 (copy), v9 (copy), v12 (copy), v6 (copy), v10 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = v19.props.Stylizer;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_IsLoaded_0 = l_props_0.IsLoaded;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local l_Position_0 = l_props_0.Position;
    local l_TimeLength_0 = l_props_0.TimeLength;
    local l_CurrentTime_0 = l_props_0.CurrentTime;
    local l_OnScrub_0 = l_props_0.OnScrub;
    local v30 = not l_OnScrub_0;
    local v31 = l_IsPlaying_0 and l_Stylizer_0.Controls.PauseButton or l_Stylizer_0.Controls.PlayButton;
    return v1.createElement(v8, {
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = v13.calculateSize(l_Stylizer_0)
    }, {
        Scrubber = v1.createElement(v11, {
            Style = l_Stylizer_0.Scrubber, 
            Min = 0, 
            Max = l_TimeLength_0, 
            Value = math.clamp(l_CurrentTime_0, 0, l_TimeLength_0), 
            OnValueChanged = v30 and v14 or l_OnScrub_0, 
            Disabled = not l_IsLoaded_0 or v30
        }), 
        Controls = v1.createElement(v8, {
            Position = UDim2.new(UDim.new(0, 0), l_Stylizer_0.Scrubber.Size.Y), 
            Size = l_Stylizer_0.Controls.Size, 
            Padding = l_Stylizer_0.Controls.Padding
        }, {
            PlayOrPauseButton = v1.createElement(v7, {
                OnClick = v19.onClickPlayPause, 
                Style = v31, 
                StyleModifier = not l_IsLoaded_0 and v4.Disabled or nil
            }, {
                HoverArea = l_IsLoaded_0 and v1.createElement(v9, {
                    Cursor = "PointingHand"
                })
            }), 
            TimeLabel = l_IsLoaded_0 and v1.createElement(v12, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(UDim.new(1, 0) - v31.Size.X, UDim.new(1, 0)), 
                Text = v6(l_CurrentTime_0) .. "/" .. v6(l_TimeLength_0), 
                TextXAlignment = Enum.TextXAlignment.Right
            }), 
            LoadingIndicator = not l_IsLoaded_0 and v1.createElement(v10, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 50, 1, 0)
            })
        })
    });
end;
v13 = l_withContext_0({
    Stylizer = v2.Stylizer
})(v13);
return v13;