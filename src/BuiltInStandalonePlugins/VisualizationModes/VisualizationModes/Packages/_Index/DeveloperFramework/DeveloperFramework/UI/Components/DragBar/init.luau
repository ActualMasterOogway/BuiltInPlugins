local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local _ = require(l_Parent_0.UI.ContextServices.Mouse);
local l_withContext_0 = v2.withContext;
local v5 = require(l_Parent_0.Util.Typecheck.t);
local _ = require(script.style);
local l_UI_0 = l_Parent_0.UI;
local v8 = require(l_UI_0.Components.Pane);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v10 = require(l_Parent_0.Wrappers.withControl);
local v11 = v1.PureComponent:extend("DragBar");
v11.didUpdate = function(v12, v13) --[[ Line: 52 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v12.props;
    if l_props_0.StyleModifier and not v13.StyleModifier then
        local v15 = l_props_0.FillDirection == Enum.FillDirection.Horizontal and "SizeNS" or "SizeEW";
        l_props_0.Mouse:__pushCursor(v15);
        return;
    else
        if not l_props_0.StyleModifier and v13.StyleModifier then
            l_props_0.Mouse:__popCursor();
        end;
        return;
    end;
end;
v11.render = function(v16) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v1 (copy), v8 (copy), l_join_0 (copy)
    local l_props_1 = v16.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Weight_0 = l_Stylizer_0.Weight;
    local v20 = l_props_1.Hide and "None" or l_props_1.BarStyle;
    assert(v5.numberMin(0)(l_Weight_0), "Weight style must be a number >= 0");
    local v21 = nil;
    v21 = if l_props_1.FillDirection == Enum.FillDirection.Horizontal then UDim2.new(1, 0, 0, l_Weight_0) else UDim2.new(0, l_Weight_0, 1, 0);
    return v1.createElement(v8, l_join_0({
        Size = v21, 
        Position = l_props_1.Position, 
        Style = v20, 
        LayoutOrder = l_props_1.LayoutOrder, 
        BackgroundColor = l_Stylizer_0.Background
    }, l_props_1.WrapperProps));
end;
return v10((l_withContext_0({
    Mouse = v2.Mouse, 
    Stylizer = v2.Stylizer
})(v11)));