local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Parent.Dash);
local l_omit_0 = v4.omit;
local l_join_0 = v4.join;
local _ = require(l_Parent_0.Types);
local l_prioritize_0 = require(l_Parent_0.Util).prioritize;
local l_UI_0 = l_Parent_0.UI;
local v10 = require(l_UI_0.Components.Pane);
local v11 = require(l_UI_0.Components.TextLabel);
local v12 = require(l_Parent_0.Wrappers.withForwardRef);
local v13 = v1.PureComponent:extend("TitledFrame");
v13.render = function(v14) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), l_omit_0 (copy), v1 (copy), v10 (copy), l_join_0 (copy), v11 (copy)
    local l_props_0 = v14.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v17 = UDim.new(0, l_Stylizer_0.Spacing);
    local v18 = l_prioritize_0(l_props_0.FillDirection, l_Stylizer_0.FillDirection, Enum.FillDirection.Horizontal);
    local l_Title_0 = l_props_0.Title;
    local v20 = if v18 == Enum.FillDirection.Horizontal then l_prioritize_0(l_props_0.TitleWidth, l_Stylizer_0.TitleWidth) else nil;
    local l_ForwardRef_0 = l_props_0.ForwardRef;
    local v22 = l_omit_0(l_props_0, {
        "ForwardRef", 
        "Title", 
        "TitleWidth", 
        "FillDirection", 
        "Style", 
        v1.Children
    });
    return v1.createElement(v10, l_join_0({
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Layout = v18, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Spacing = v17, 
        [v1.Ref] = l_ForwardRef_0
    }, v22), {
        Title = v1.createElement(v11, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            Size = if v20 then UDim2.new(0, v20, 0, 0) else UDim2.fromScale(1, 0), 
            Style = l_props_0.Style or "Title", 
            Text = l_Title_0, 
            TextWrapped = true
        }), 
        Content = v1.createElement(v10, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2, 
            Spacing = v17, 
            Size = if v20 then UDim2.new(1, -v20, 0, 0) else UDim2.fromScale(1, 0), 
            ZIndex = l_props_0.ZIndex
        }, l_props_0[v1.Children])
    });
end;
return v12((l_withContext_0({
    Stylizer = v2.Stylizer
})(v13)));