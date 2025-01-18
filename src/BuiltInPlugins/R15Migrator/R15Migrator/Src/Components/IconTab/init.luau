local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v9 = v2.PureComponent:extend("IconTab");
v9.init = function(v10) --[[ Line: 16 ]] --[[ Name: init ]]
    v10.state = {
        hovered = false
    };
    v10.hover = function(v11) --[[ Line: 21 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            hovered = v11
        });
    end;
    v10.onPress = function() --[[ Line: 27 ]]
        -- upvalues: v10 (copy)
        local l_props_0 = v10.props;
        if not l_props_0.Disabled then
            l_props_0.OnTabSelected(l_props_0.Tab);
        end;
    end;
end;
v9.render = function(v13) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_StyleModifier_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local l_props_1 = v13.props;
    local l_Stylizer_0 = v13.props.Stylizer;
    local l_Icon_0 = l_props_1.Tab.Icon;
    local l_Tooltip_1 = l_props_1.Tab.Tooltip;
    local l_Selected_0 = l_props_1.Selected;
    local l_Color_0 = l_Stylizer_0.Color;
    local l_Size_0 = l_Stylizer_0.Size;
    local l_hovered_0 = v13.state.hovered;
    local v22 = v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Style = "Box", 
        LayoutOrder = l_props_1.Index, 
        OnPress = v13.onPress, 
        [v2.Event.MouseEnter] = function() --[[ Line: 53 ]]
            -- upvalues: v13 (copy)
            v13.hover(true);
        end, 
        [v2.Event.MouseLeave] = function() --[[ Line: 56 ]]
            -- upvalues: v13 (copy)
            v13.hover(false);
        end, 
        StyleModifier = if l_Selected_0 then l_StyleModifier_0.Selected else if l_hovered_0 then l_StyleModifier_0.Hover else nil, 
        BackgroundTransparency = (not not l_Selected_0 or l_hovered_0) and 0 or 1
    }, {
        Icon = l_Icon_0 and v2.createElement(l_Image_0, {
            Image = l_Icon_0, 
            ImageColor3 = l_Color_0, 
            Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
            LayoutOrder = 1
        })
    });
    if l_Tooltip_1 then
        return v2.createElement(l_Tooltip_0, {
            Text = l_Tooltip_1, 
            Child = v22
        });
    else
        return v22;
    end;
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));