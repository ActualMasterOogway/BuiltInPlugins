local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = require(l_Parent_0.Styling.supportsStyleSheets);
local v6 = require(l_Parent_0.Styling.joinTags);
local l_assign_0 = require(l_Parent_0.Parent.Dash).assign;
local l_Components_0 = l_Parent_0.UI.Components;
local v9 = require(l_Components_0.Pane);
local v10 = require(l_Components_0.Tooltip);
local v11 = v1.PureComponent:extend("PropertyCell");
v11.render = function(v12) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v11 (ref), v1 (copy), v9 (copy), l_assign_0 (copy), v5 (copy), v4 (copy), v6 (copy), v10 (copy)
    local l_props_0 = v12.props;
    local v14 = l_props_0.Renderers and l_props_0.Renderers[l_props_0.Schema.Type] or v11.Renderers[l_props_0.Schema.Type];
    if not v14 and l_props_0.Schema.Type ~= "Empty" then
        error("No renderer found for property schema " .. l_props_0.Schema.Type);
    end;
    local v15 = v1.createElement(v9, l_assign_0({
        AnchorPoint = l_props_0.AnchorPoint, 
        AutomaticSize = l_props_0.AutomaticSize, 
        ClipsDescendants = not l_props_0.AutomaticSize, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        VerticalAlignment = l_props_0.VerticalAlignment or Enum.VerticalAlignment.Center
    }, if v5 then {
        [v4.Tag] = v6("Component-PropertyCell", l_props_0[v4.Tag])
    } else nil), {
        Content = if v14 then v1.createElement(v14, l_props_0) else nil
    });
    if l_props_0.Tooltip then
        return v1.createElement(v10, {
            Child = v15, 
            Text = l_props_0.Tooltip
        });
    else
        return v15;
    end;
end;
v11.Renderers = require(script.Renderers);
if not v5 then
    v11 = l_withContext_0({
        Stylizer = v2.Stylizer
    })(v11);
end;
return v11;