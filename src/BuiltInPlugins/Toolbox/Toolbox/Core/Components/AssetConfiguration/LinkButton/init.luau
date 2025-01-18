local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v9 = v2.PureComponent:extend("LinkButton");
v9.init = function(v10, v11) --[[ Line: 32 ]] --[[ Name: init ]]
    v10.state = {
        hovered = false
    };
    v10.onMouseEnter = function(_, _, _) --[[ Line: 37 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            hovered = true
        });
    end;
    v10.onMouseLeave = function(_, _, _) --[[ Line: 43 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            hovered = false
        });
    end;
    v10.onActivated = function(_) --[[ Line: 49 ]]
        -- upvalues: v11 (copy)
        if v11.onActivated then
            v11.onActivated();
        end;
    end;
end;
v9.render = function(v19) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), v2 (copy), v5 (copy)
    local l_props_0 = v19.props;
    local l_state_0 = v19.state;
    local l_linkButton_0 = l_props_0.Stylizer.linkButton;
    local v23 = l_GetTextSize_0(l_props_0.Text, nil, nil, Vector2.new(9999, 9999));
    return v2.createElement("Frame", {
        Size = l_props_0.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Link = v2.createElement("TextButton", {
            Size = UDim2.new(0, v23.X, 0, v23.Y), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_props_0.Text, 
            TextSize = l_props_0.TextSize, 
            Font = v5.FONT, 
            TextScaled = true, 
            TextColor3 = l_linkButton_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            [v2.Event.MouseEnter] = v19.onMouseEnter, 
            [v2.Event.MouseLeave] = v19.onMouseLeave, 
            [v2.Event.Activated] = v19.onActivated
        }, {
            UnderLine = l_state_0.hovered and v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(0, v23.X, 0, 1), 
                BackgroundColor3 = l_linkButton_0.textColor, 
                BorderSizePixel = 0
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));