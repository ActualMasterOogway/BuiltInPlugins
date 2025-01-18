local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v9 = require(l_Components_0.RoundButton);
local v10 = v2.Component:extend("NavButton");
v10.init = function(v11, _) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v11:setState({
        hovered = false, 
        pressed = false
    });
    v11.buttonRef = v2.createRef();
    v11.onMouseEnter = function() --[[ Line: 39 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            hovered = true
        });
    end;
    v11.onMouseLeave = function() --[[ Line: 43 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            hovered = false
        });
    end;
    v11.onMouseButton1Down = function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            pressed = true
        });
    end;
    v11.onMouseButton1Up = function() --[[ Line: 51 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            pressed = false
        });
    end;
end;
v10.render = function(v13) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v9 (copy), v5 (copy)
    local l_props_0 = v13.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v16 = l_props_0.isPrimary and l_Stylizer_0.nav.mainButton or l_Stylizer_0.nav.button;
    local v17 = nil;
    v17 = if v13.state.hovered and v13.state.pressed then v16.pressBackground else if v13.state.hovered then v16.hoverBackground else v16.background;
    return v2.createElement(v9, {
        Size = l_props_0.Size, 
        Position = l_props_0.Position, 
        LayoutOrder = l_props_0.LayoutOrder, 
        BackgroundColor3 = v17, 
        BorderColor3 = v16.borderColor, 
        BorderSizePixel = l_props_0.isPrimary and 0 or 1, 
        [v2.Event.MouseEnter] = v13.onMouseEnter, 
        [v2.Event.MouseLeave] = v13.onMouseLeave, 
        [v2.Event.MouseButton1Down] = v13.onMouseButton1Down, 
        [v2.Event.MouseButton1Up] = v13.onMouseButton1Up, 
        [v2.Event.MouseButton1Click] = l_props_0.onClick
    }, {
        Title = v2.createElement("TextLabel", {
            Text = l_props_0.titleText, 
            Font = v5.FONT, 
            TextSize = v5.FONT_SIZE_LARGE, 
            BackgroundTransparency = 1, 
            TextColor3 = v16.textColor, 
            Size = UDim2.new(1, 0, 1, 0)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));