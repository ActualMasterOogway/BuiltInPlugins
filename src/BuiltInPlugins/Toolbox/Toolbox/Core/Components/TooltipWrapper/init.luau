local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_Tooltip_0 = require(l_Packages_0.Framework).UI.Tooltip;
local v3 = v1.PureComponent:extend("TooltipWrapper");
v3.render = function(v4) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Tooltip_0 (copy)
    local l_props_0 = v4.props;
    local v6 = tostring(l_props_0.Text or "");
    local v7 = l_props_0.SizeConstraint or Enum.SizeConstraint.RelativeXY;
    local l_canShowCurrentTooltip_0 = l_props_0.canShowCurrentTooltip;
    local l_isHovered_0 = l_props_0.isHovered;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        SizeConstraint = v7
    }, {
        Tooltip = v1.createElement(l_Tooltip_0, {
            Enabled = l_canShowCurrentTooltip_0 and l_isHovered_0, 
            Text = v6, 
            Priority = 2
        })
    });
end;
return v3;