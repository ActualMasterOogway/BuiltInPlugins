local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local v5 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAudioUpdateLandingPage);
local l_ContextServices_0 = v2.ContextServices;
local l_HoverArea_0 = v2.UI.HoverArea;
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = v3.PureComponent:extend("IconTile");
v11.defaultProps = if v5() then {
    AutomaticSize = Enum.AutomaticSize.XY, 
    ContentsLayoutOverride = false, 
    ImageSize = UDim2.fromOffset(63, 63), 
    Size = UDim2.fromScale(0, 0)
} else {
    Size = UDim2.fromScale(0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
v11.init = function(v12) --[[ Line: 81 ]] --[[ Name: init ]]
    v12.state = {
        isHovered = false
    };
    v12.onMouseEnter = function() --[[ Line: 86 ]]
        -- upvalues: v12 (copy)
        v12:setState(function(v13) --[[ Line: 87 ]]
            if not v13.isHovered then
                return {
                    isHovered = true
                };
            else
                return;
            end;
        end);
    end;
    v12.onMouseLeave = function() --[[ Line: 96 ]]
        -- upvalues: v12 (copy)
        v12:setState(function(v14) --[[ Line: 97 ]]
            if v14.isHovered then
                return {
                    isHovered = false
                };
            else
                return;
            end;
        end);
    end;
    v12.onClick = function() --[[ Line: 106 ]]
        -- upvalues: v12 (copy)
        local l_props_0 = v12.props;
        if l_props_0.OnClick ~= nil then
            l_props_0.OnClick(l_props_0.Key);
        end;
    end;
    v12.onAbsoluteSizeChanged = function(v16) --[[ Line: 113 ]]
        -- upvalues: v12 (copy)
        local l_props_1 = v12.props;
        if l_props_1.OnAbsoluteSizeChanged then
            l_props_1.OnAbsoluteSizeChanged(v16.AbsoluteSize);
        end;
    end;
end;
v11.render = function(v18) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v3 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_HoverArea_0 (copy)
    local l_props_2 = v18.props;
    local l_state_0 = v18.state;
    local l_iconTile_0 = l_props_2.Stylizer.iconTile;
    local v22 = v4.new();
    local v23 = if l_props_2.ContentsLayoutOverride then nil else Enum.FillDirection.Vertical;
    local v24 = if l_props_2.ContentsPadding then l_props_2.ContentsPadding else l_iconTile_0.padding;
    return v3.createElement(l_Pane_0, {
        BackgroundColor = l_props_2.BackgroundColor, 
        LayoutOrder = l_props_2.LayoutOrder, 
        AutomaticSize = l_props_2.AutomaticSize, 
        Size = l_props_2.Size, 
        OnClick = v18.onClick, 
        [v3.Event.MouseEnter] = v18.onMouseEnter, 
        [v3.Event.MouseLeave] = v18.onMouseLeave, 
        [v3.Change.AbsoluteSize] = v18.onAbsoluteSizeChanged
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        DarkOverlay = l_state_0.isHovered and v3.createElement(l_Pane_0, {
            BackgroundTransparency = l_iconTile_0.overlayTransparency, 
            BackgroundColor = l_iconTile_0.overlayColor, 
            ZIndex = 2
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        }), 
        Contents = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = v23, 
            Padding = v24, 
            Spacing = l_iconTile_0.spacing
        }, {
            Title = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_iconTile_0.font, 
                LayoutOrder = v22:getNextOrder(), 
                Text = l_props_2.Title, 
                TextColor = l_iconTile_0.textColor, 
                TextSize = l_iconTile_0.textSize, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            ImageIcon = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_props_2.Image, 
                LayoutOrder = v22:getNextOrder(), 
                Size = l_props_2.ImageSize, 
                Position = l_props_2.ImagePosition
            })
        }), 
        UIGradientContainer = v3.createElement("Frame", {
            BackgroundColor3 = l_props_2.BackgroundColor, 
            BackgroundTransparency = 0.7, 
            ClipsDescendants = true, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -1
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                }), 
                Rotation = -90, 
                Color = if l_props_2.BackgroundColor then ColorSequence.new({
                    ColorSequenceKeypoint.new(0, l_iconTile_0.gradientColor), 
                    ColorSequenceKeypoint.new(1, l_props_2.BackgroundColor)
                }) else nil
            })
        }), 
        HoverArea = l_props_2.OnClick and v3.createElement(l_HoverArea_0, {
            Cursor = "PointingHand", 
            Size = UDim2.fromScale(1, 1)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));