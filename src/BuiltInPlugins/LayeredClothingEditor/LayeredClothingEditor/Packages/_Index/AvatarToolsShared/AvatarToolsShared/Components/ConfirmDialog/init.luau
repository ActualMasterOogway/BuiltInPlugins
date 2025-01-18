local _ = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = v2.PureComponent:extend("ConfirmDialog");
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
v3.Util.Typecheck.wrap(v6, script);
v6.render = function(v11) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_StyledDialog_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v11.props;
    local l_Localization_0 = l_props_0.Localization;
    local v14 = l_props_0.Title or l_Localization_0:getText("Dialog", "DefaultTitle");
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_Resizable_0 = l_props_0.Resizable;
    local v18 = l_props_0.ConfirmText or l_props_0.Localization:getText("Dialog", "Confirm");
    return v2.createElement(l_StyledDialog_0, {
        Title = v14, 
        OnClose = l_OnClose_0, 
        OnButtonPressed = l_OnClose_0, 
        Buttons = {
            {
                Text = v18, 
                Key = "Confirm", 
                Style = "Round"
            }
        }, 
        MinContentSize = l_Stylizer_0.PopupMessageSize, 
        Resizable = l_Resizable_0, 
        Modal = true
    }, {
        PromptPane = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Spacing = l_Stylizer_0.Spacing, 
            Padding = l_Stylizer_0.Padding
        }, {
            Message = v2.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = l_props_0.Text, 
                BackgroundTransparency = 1, 
                TextWrapped = true
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v6));