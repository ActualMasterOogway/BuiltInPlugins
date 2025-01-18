local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v5.Util;
local v7 = if v2 then nil else l_Util_0.FitFrame.FitFrameOnAxis;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v5.UI.Pane;
local v11 = v3.PureComponent:extend("RadioButton");
v11.init = function(v12, _) --[[ Line: 34 ]] --[[ Name: init ]]
    v12.mouseEnter = function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        if v12.props.Enabled then
            v12:mouseHoverChanged(true);
        end;
    end;
    v12.mouseLeave = function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy)
        if v12.props.Enabled then
            v12:mouseHoverChanged(false);
        end;
    end;
end;
v11.mouseHoverChanged = function(v14, v15) --[[ Line: 48 ]] --[[ Name: mouseHoverChanged ]]
    local l_props_0 = v14.props;
    if v15 then
        l_props_0.Mouse:__pushCursor("PointingHand");
        return;
    else
        l_props_0.Mouse:__resetCursor();
        return;
    end;
end;
v11.render = function(v17) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v3 (copy), v2 (copy), l_Pane_0 (copy), v7 (copy), v4 (copy)
    local l_props_1 = v17.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Title_0 = v17.props.Title;
    local v21 = l_props_1.Description and l_props_1.Description or nil;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Title_0, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new());
    local v23 = l_props_1.Description and l_TextService_0:GetTextSize(v21, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.radioButton.descriptionWidth, 1e999));
    local v24 = l_props_1.Children and l_props_1.Children or {};
    local v25 = math.max(l_l_TextService_0_TextSize_0.X, v23 and v23.X or 0);
    local v26 = v25 + l_Stylizer_0.radioButton.size;
    return v3.createElement(if v2 then l_Pane_0 else v7, if v2 then {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_1.LayoutOrder or 1, 
        Spacing = l_Stylizer_0.radioButton.spacing, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    } else {
        axis = v7.Axis.Vertical, 
        minimumSize = UDim2.new(0, v26, 0, 0), 
        BackgroundTransparency = 1, 
        FillDirection = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_1.LayoutOrder or 1
    }, {
        Button = v3.createElement("ImageButton", {
            Size = UDim2.new(0, l_Stylizer_0.radioButton.size, 0, l_Stylizer_0.radioButton.size), 
            BackgroundTransparency = 1, 
            ImageTransparency = v17.props.Enabled and 0 or 0.4, 
            Image = l_Stylizer_0.radioButton.image.background, 
            ImageColor3 = l_Stylizer_0.radioButton.background, 
            LayoutOrder = 1, 
            [v3.Event.MouseEnter] = v17.mouseEnter, 
            [v3.Event.MouseLeave] = v17.mouseLeave, 
            [v3.Event.Activated] = function() --[[ Line: 112 ]]
                -- upvalues: v17 (copy)
                if v17.props.Enabled then
                    v17.props.OnClicked();
                end;
            end
        }, {
            Highlight = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = l_Stylizer_0.isDarkerTheme and UDim2.new(0.4, 0, 0.4, 0) or UDim2.new(0.5, 0, 0.5, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Visible = v17.props.Selected, 
                Image = v17.props.Enabled and l_Stylizer_0.radioButton.image.selected or l_Stylizer_0.radioButton.image.selectedDisabled
            })
        }), 
        ContentAndChildren = v3.createElement(if v2 then l_Pane_0 else v7, if v2 then {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2, 
            Spacing = l_Stylizer_0.radioButton.spacing
        } else {
            axis = v7.Axis.Vertical, 
            minimumSize = UDim2.new(0, v25, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_0.radioButton.padding), 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, v4.Dictionary.join({
            TitleLabel = v3.createElement("TextButton", v4.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTransparency = v17.props.Enabled and 0 or 0.5, 
                Text = l_Title_0, 
                [v3.Event.MouseEnter] = v17.mouseEnter, 
                [v3.Event.MouseLeave] = v17.mouseLeave, 
                [v3.Event.Activated] = function() --[[ Line: 166 ]]
                    -- upvalues: v17 (copy)
                    if v17.props.Enabled then
                        v17.props.OnClicked();
                    end;
                end, 
                LayoutOrder = -2
            })), 
            DescriptionLabel = l_props_1.Description and v3.createElement("TextButton", v4.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, v23.X, 0, v23.Y), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v21, 
                TextWrapped = true, 
                [v3.Event.MouseEnter] = v17.mouseEnter, 
                [v3.Event.MouseLeave] = v17.mouseLeave, 
                [v3.Event.Activated] = function() --[[ Line: 190 ]]
                    -- upvalues: v17 (copy)
                    if v17.props.Enabled then
                        v17.props.OnClicked();
                    end;
                end, 
                LayoutOrder = -1
            }))
        }, v24))
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v11));