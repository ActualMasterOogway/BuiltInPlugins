local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.Images);
local v5 = v2.PureComponent:extend("PopUpWrapperButton");
local v6 = UDim2.new(0, 32, 0, 32);
local v7 = UDim2.new(0, 28, 0, 28);
v5.init = function(v8, _) --[[ Line: 37 ]] --[[ Name: init ]]
    v8.state = {
        hovering = false
    };
    v8.mouseEnter = function() --[[ Line: 42 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            hovering = true
        });
    end;
    v8.mouseLeave = function() --[[ Line: 48 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            hovering = false
        });
    end;
end;
v5.render = function(v10) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v7 (copy), v2 (copy), v4 (copy)
    local l_props_0 = v10.props;
    local l_state_0 = v10.state;
    local l_position_0 = l_props_0.position;
    local l_ShowIcon_0 = l_props_0.ShowIcon;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v16 = l_props_0.HoverSize or v6;
    local v17 = l_props_0.Size or v7;
    local l_hovering_0 = l_state_0.hovering;
    return v2.createElement("ImageButton", {
        Position = l_position_0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = l_hovering_0 and v16 or v17, 
        Image = v4.MAGNIFIER_PH, 
        ImageTransparency = l_ShowIcon_0 and 0 or 1, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        [v2.Event.Activated] = l_props_0.onClick, 
        [v2.Event.MouseEnter] = v10.mouseEnter, 
        [v2.Event.MouseLeave] = v10.mouseLeave, 
        ZIndex = l_props_0.ZIndex
    });
end;
return v5;