local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = v1.PureComponent:extend("Label");
v4.render = function(v5) --[[ Line: 8 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v5.props;
    local v7 = l_props_0.Localization:getText("Example", "Hello", {
        Name = l_props_0.Name
    });
    return v1.createElement("TextLabel", {
        Size = UDim2.new(0, 100, 0, 60), 
        Text = v7, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    });
end;
return (l_withContext_0({
    Localization = v2.Localization
})(v4));