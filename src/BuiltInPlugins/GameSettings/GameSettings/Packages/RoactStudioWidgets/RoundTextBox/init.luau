local v0 = UDim.new(0, 10);
local v1 = require(script.Parent.Internal.RequireRoact);
local v2 = require(script.Parent.Internal.Constants);
local v3 = require(script.Parent.Internal.ThemeChangeListener);
local v4 = require(script.Parent.Internal.Theme);
local v5 = require(script.Parent.Internal.Mouse);
local v6 = require(script.Parent.TextEntry);
local v7 = require(script.Parent.MultilineTextEntry);
local v8 = Color3.new(1, 0.266, 0.266);
local v9 = nil;
local v10 = v1.PureComponent:extend("RoundTextBox");
v10.init = function(v11) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v11.state = {
        Focused = false
    };
    v11.focusChanged = function(v12, v13) --[[ Line: 62 ]]
        -- upvalues: v11 (copy)
        if v11.props.Enabled then
            if v11.props.FocusChanged then
                v11.props.FocusChanged(v12, v13);
            end;
            v11:setState({
                Focused = v12
            });
        end;
    end;
    v11.mouseHoverChanged = function(v14) --[[ Line: 73 ]]
        -- upvalues: v11 (copy), v5 (ref)
        if v11.props.Enabled then
            if v14 then
                v5.onEnter(v11.props.Mouse, "IBeam");
            else
                v5.onLeave(v11.props.Mouse);
            end;
            if v11.state.Focused and v11.props.HoverChanged then
                v11.props.HoverChanged(v14);
            end;
        end;
    end;
end;
v10.render = function(v15) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v9 (ref), v2 (copy), v8 (copy), v1 (copy), v7 (copy), v6 (copy), v0 (copy), v3 (copy)
    local function v28() --[[ Line: 89 ]] --[[ Name: renderInternal ]]
        -- upvalues: v15 (copy), v9 (ref), v2 (ref), v8 (ref), v1 (ref), v7 (ref), v6 (ref), v0 (ref)
        local l_Enabled_0 = v15.props.Enabled;
        local l_Focused_0 = v15.state.Focused;
        local l_Multiline_0 = v15.props.Multiline;
        local v19 = string.len(v15.props.Text);
        local v20 = v15.props.ErrorMessage or v15.props.MaxLength < v19;
        local v21 = v9(v15);
        local v22 = {
            BackgroundTransparency = 1, 
            Image = v2.ROUNDED_BACKGROUND_IMAGE, 
            ImageTransparency = 0, 
            ImageColor3 = l_Enabled_0 and v21.BackgroundColor or v21.DisabledColor, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v2.ROUNDED_FRAME_SLICE, 
            Position = v15.props.Position or UDim2.new(0, 0, 0, 0), 
            AnchorPoint = v15.props.AnchorPoint, 
            Size = v15.props.Width and UDim2.new(0, v15.props.Width, 0, v15.props.Height or 42) or UDim2.new(1, 0, 0, v15.props.Height or 42), 
            LayoutOrder = v15.props.LayoutOrder or 1
        };
        local v23 = v15.props.ShowToolTip == nil or v15.props.ShowToolTip;
        local v24 = nil;
        v24 = if l_Enabled_0 then if v20 and v15.props.ErrorMessage then v15.props.ErrorMessage else (not not v23 or v20) and v19 .. "/" .. v15.props.MaxLength or "" else "";
        local v25 = nil;
        v25 = if l_Enabled_0 then if v20 then v8 else if l_Focused_0 then v21.BorderHoverColor else v21.BorderDefaultColor else v21.BorderDefaultColor;
        local v26 = {
            Visible = v15.props.Enabled or v15.props.ShowTextWhenDisabled or false, 
            Enabled = v15.props.Enabled, 
            Text = v15.props.Text, 
            FocusChanged = v15.focusChanged, 
            HoverChanged = v15.mouseHoverChanged, 
            SetText = v15.props.SetText, 
            TextColor3 = v21.TextColor, 
            HorizontalAlignment = v15.props.HorizontalAlignment, 
            PlaceholderText = v15.props.PlaceholderText
        };
        local v27 = nil;
        v27 = if l_Multiline_0 then v1.createElement(v7, v26) else v1.createElement(v6, v26);
        return v1.createElement("ImageLabel", v22, {
            Tooltip = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 2, 1, 2), 
                Size = UDim2.new(1, 0, 0, 10), 
                Font = Enum.Font.SourceSans, 
                TextSize = 16, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Enabled_0 and v20 and v8 or v21.TooltipColor, 
                Text = v24, 
                Visible = v23 or v20 ~= nil
            }), 
            Border = v1.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = v2.ROUNDED_BORDER_IMAGE, 
                ImageColor3 = v25, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v2.ROUNDED_FRAME_SLICE
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = v15.props.PaddingLeft or v0, 
                    PaddingRight = v15.props.PaddingRight or v0, 
                    PaddingTop = v15.props.PaddingTop or v0, 
                    PaddingBottom = v15.props.PaddingBottom or v0
                }), 
                Text = v27
            })
        });
    end;
    return v1.createElement(v3, {
        render = v28
    });
end;
v9 = function(v29) --[[ Line: 204 ]]
    -- upvalues: v4 (copy)
    local v30 = {
        BorderHoverColor = v4.getBorderHoverColor(), 
        BorderDefaultColor = v4.getBorderDefaultColor(), 
        TextColor = v4.getMainTextColor(), 
        TooltipColor = v4.getTextDescriptionColor(), 
        BackgroundColor = v4.getBackgroundColor(), 
        DisabledColor = v4.getDisabledColor()
    };
    local v31 = {};
    for v32, v33 in pairs(v30) do
        v31[v32] = v29.props.Style and v29.props.Style[v32] or v33;
    end;
    return v31;
end;
return v10;