local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util);
local v5 = require(l_Parent_0.Util.Typecheck);
local l_prioritize_0 = v4.prioritize;
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v8 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v9 = require(l_Parent_0.UI.Components.HoverArea);
local v10 = require(l_Parent_0.UI.Components.Pane);
local v11 = require(l_Parent_0.UI.Components.TextLabel);
local v12 = v1.PureComponent:extend("Favorites");
v5.wrap(v12, script);
v12.formatCount = function(v13, v14) --[[ Line: 44 ]] --[[ Name: formatCount ]]
    -- upvalues: l_LOCALIZATION_PROJECT_NAME_0 (copy)
    if v14 < 10000 then
        return (tostring(v14));
    else
        return v13.props.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "Favorites", "FlooredCountInThousands", {
            count = math.floor(v14 / 1000)
        });
    end;
end;
v12.render = function(v15) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v1 (copy), v10 (copy), v8 (copy), v9 (copy), v11 (copy)
    local l_props_0 = v15.props;
    local l_Stylizer_0 = v15.props.Stylizer;
    local v18 = l_props_0.IsFavorited and l_Stylizer_0.Button.Filled or l_Stylizer_0.Button.Unfilled;
    local v19 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size);
    return v1.createElement(v10, {
        AnchorPoint = l_props_0.AnchorPoint, 
        AutomaticSize = l_props_0.AutomaticSize, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Position = l_props_0.Position, 
        Spacing = l_Stylizer_0.Spacing, 
        Size = v19
    }, {
        Icon = v1.createElement(v8, {
            AutomaticSize = l_props_0.AutomaticSize, 
            LayoutOrder = 1, 
            Style = v18, 
            OnClick = l_props_0.OnClick, 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            Size = l_Stylizer_0.IconSize
        }, {
            v1.createElement(v9, {
                Cursor = "PointingHand"
            })
        }), 
        Text = v1.createElement(v11, {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Style = l_Stylizer_0.Text, 
            Text = v15:formatCount(l_props_0.Count)
        })
    });
end;
return (l_withContext_0({
    Localization = v2.Localization, 
    Stylizer = v2.Stylizer
})(v12));