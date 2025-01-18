local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.Parent.Roact);
local v2 = v1.PureComponent:extend("ScreenGuiWrapper");
v2.defaultProps = {
    DisplayOrder = 0, 
    OnTopOfCoreBlur = false, 
    visible = true
};
v2.render = function(v3) --[[ Line: 12 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy), v1 (copy)
    local l_props_0 = v3.props;
    local l_component_0 = l_props_0.component;
    local l_visible_0 = l_props_0.visible;
    local l_DisplayOrder_0 = l_props_0.DisplayOrder;
    local l_OnTopOfCoreBlur_0 = l_props_0.OnTopOfCoreBlur;
    local v9 = v0.Dictionary.join(l_props_0, {
        component = v0.None, 
        DisplayOrder = v0.None, 
        OnTopOfCoreBlur = v0.None
    });
    return v1.createElement("ScreenGui", {
        Enabled = l_visible_0, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = l_DisplayOrder_0, 
        OnTopOfCoreBlur = l_OnTopOfCoreBlur_0
    }, {
        InnerComponent = v1.createElement(l_component_0, v9)
    });
end;
return v2;