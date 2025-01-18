local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_HoverArea_0 = require(l_Parent_0.Packages.Framework).UI.HoverArea;
local v3 = v1.PureComponent:extend("PopUpButton");
local v4 = UDim2.new(0, 32, 0, 32);
local v5 = UDim2.new(0, 28, 0, 28);
v3.init = function(v6, _) --[[ Line: 27 ]] --[[ Name: init ]]
    v6.state = {
        hovering = false
    };
    v6.mouseEnter = function() --[[ Line: 32 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            hovering = true
        });
    end;
    v6.mouseLeave = function() --[[ Line: 38 ]]
        -- upvalues: v6 (copy)
        v6:setState({
            hovering = false
        });
    end;
end;
v3.render = function(v8) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v5 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v8.props;
    local l_state_0 = v8.state;
    local l_Position_0 = l_props_0.Position;
    local l_ShowIcon_0 = l_props_0.ShowIcon;
    local l_Image_0 = l_props_0.Image;
    local l_OnClick_0 = l_props_0.OnClick;
    local v15 = l_props_0.OnRightClick and l_props_0.OnRightClick or function() --[[ Line: 54 ]]

    end;
    local l_hovering_0 = l_state_0.hovering;
    return v1.createElement("ImageButton", {
        Position = l_Position_0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = l_hovering_0 and v4 or v5, 
        Image = l_Image_0, 
        ImageTransparency = l_ShowIcon_0 and 0 or 1, 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = l_OnClick_0, 
        [v1.Event.MouseButton2Click] = v15, 
        [v1.Event.MouseEnter] = v8.mouseEnter, 
        [v1.Event.MouseLeave] = v8.mouseLeave
    }, {
        Hover = v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        })
    });
end;
return v3;