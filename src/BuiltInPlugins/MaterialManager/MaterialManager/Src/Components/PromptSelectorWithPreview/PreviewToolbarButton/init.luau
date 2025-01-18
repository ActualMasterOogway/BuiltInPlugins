local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v2.ContextServices.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_Dash_0 = v2.Dash;
local v6 = v1.PureComponent:extend("PreviewToolbarButton");
v6.init = function(v7) --[[ Line: 33 ]] --[[ Name: init ]]
    v7.state = {
        isHovered = false
    };
    v7.onHovered = function() --[[ Line: 38 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            isHovered = true
        });
    end;
    v7.onHoverEnded = function() --[[ Line: 44 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            isHovered = false
        });
    end;
end;
v6.render = function(v8) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: l_Dash_0 (copy), v1 (copy)
    local l_props_0 = v8.props;
    local l_state_0 = v8.state;
    local l_PromptSelectorWithPreview_0 = l_props_0.Stylizer.PromptSelectorWithPreview;
    local v12 = l_PromptSelectorWithPreview_0.ToolbarHeight - 4;
    local v13 = v12 - 10;
    local v14 = l_Dash_0.join(l_props_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        SizeConstraint = Enum.SizeConstraint.RelativeYY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v1.Event.MouseEnter] = v8.onHovered, 
        [v1.Event.MouseLeave] = v8.onHoverEnded, 
        Image = "", 
        Icon = l_Dash_0.None, 
        Stylizer = l_Dash_0.None
    });
    return v1.createElement("ImageButton", v14, {
        Background = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, v12, 0, v12), 
            BackgroundTransparency = l_state_0.isHovered and 0 or 1, 
            BorderSizePixel = 1, 
            BackgroundColor3 = l_PromptSelectorWithPreview_0.ToolbarButtonBackgroundColor
        }, {
            Icon = v1.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, v13, 0, v13), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 1, 
                Image = l_props_0.Icon, 
                ImageColor3 = l_state_0.isHovered and l_PromptSelectorWithPreview_0.ButtonIconHoveredColor or l_PromptSelectorWithPreview_0.ButtonIconColor
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));