local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Util_0 = v2.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v12 = v1.PureComponent:extend("CheckboxSetting");
l_Typecheck_0.wrap(v12, script);
v12.render = function(v13) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_ToggleButton_0 (copy)
    local l_props_0 = v13.props;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Title_0 = l_props_0.Title;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_Selected_0 = l_props_0.Selected;
    local l_OnToggle_0 = l_props_0.OnToggle;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v22 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Stylizer_0.FramePadding
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = l_Title_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v22:getNextOrder(), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        CheckboxContainer = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v22:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Padding = {
                Right = l_Stylizer_0.FramePadding
            }
        }, {
            CheckboxToggle = v1.createElement(l_ToggleButton_0, {
                Disabled = not l_Enabled_0, 
                Selected = l_Selected_0, 
                OnClick = l_OnToggle_0, 
                Size = l_Stylizer_0.BoxSize
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12));