local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("MenuEntry");
v4.mouseHoverChanged = function(v5, v6) --[[ Line: 25 ]] --[[ Name: mouseHoverChanged ]]
    v5:setState({
        hovering = v6
    });
end;
v4.render = function(v7) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_Stylizer_0 = v7.props.Stylizer;
    local l_hovering_0 = v7.state.hovering;
    local l_OnClicked_0 = v7.props.OnClicked;
    local l_Title_0 = v7.props.Title;
    local l_ShowError_0 = v7.props.ShowError;
    local l_ShowWarning_0 = v7.props.ShowWarning;
    local l_Selected_0 = v7.props.Selected;
    local v15 = l_hovering_0 or l_Selected_0;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 42), 
        BackgroundColor3 = v15 and l_Stylizer_0.menuEntry.hover or l_Stylizer_0.menuBar.backgroundColor, 
        BorderSizePixel = 0, 
        [v1.Event.MouseEnter] = function() --[[ Line: 50 ]]
            -- upvalues: v7 (copy)
            v7:mouseHoverChanged(true);
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 54 ]]
            -- upvalues: v7 (copy)
            v7:mouseHoverChanged(false);
        end
    }, {
        Highlight = v1.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.menuEntry.highlight, 
            BackgroundTransparency = l_Selected_0 and 0 or 1
        }), 
        Title = v1.createElement("TextButton", {
            ZIndex = 2, 
            Size = UDim2.new(1, -15, 1, 0), 
            Position = UDim2.new(0, 15, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_Title_0, 
            Font = l_Selected_0 and l_Stylizer_0.menuEntry.font.selected or l_Stylizer_0.menuEntry.font.unselected, 
            TextSize = 24, 
            TextColor3 = l_Stylizer_0.menuEntry.text, 
            [v1.Event.Activated] = l_OnClicked_0
        }), 
        Error = v1.createElement("ImageLabel", {
            ZIndex = 3, 
            Visible = l_ShowError_0 or l_ShowWarning_0 or false, 
            Size = UDim2.new(0, 18, 0, 18), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = l_ShowError_0 and "rbxasset://textures/GameSettings/ErrorIcon.png" or "rbxasset://textures/GameSettings/Warning.png"
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));