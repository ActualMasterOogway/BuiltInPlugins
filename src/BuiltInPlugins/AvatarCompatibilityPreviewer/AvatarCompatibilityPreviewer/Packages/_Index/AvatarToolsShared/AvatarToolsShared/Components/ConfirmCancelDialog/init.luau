local _ = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v11 = v2.PureComponent:extend("ConfirmCancelDialog");
v3.Util.Typecheck.wrap(v11, script);
v11.init = function(v12) --[[ Line: 40 ]] --[[ Name: init ]]
    local l_props_0 = v12.props;
    v12.onMessageBoxButtonClicked = function(v14) --[[ Line: 42 ]]
        -- upvalues: l_props_0 (copy)
        l_props_0.OnClose();
        if v14 == "Confirm" then
            l_props_0.OnConfirm();
        end;
    end;
end;
v11.render = function(v15) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_StyledDialog_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy)
    local l_props_1 = v15.props;
    local l_Localization_0 = l_props_1.Localization;
    local v18 = l_props_1.Title or l_Localization_0:getText("Dialog", "DefaultTitle");
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_OnClose_0 = l_props_1.OnClose;
    return v2.createElement(l_StyledDialog_0, {
        Style = "FullBleed", 
        Title = v18, 
        OnClose = l_OnClose_0, 
        OnButtonPressed = v15.onMessageBoxButtonClicked, 
        Buttons = {
            {
                Text = l_props_1.ConfirmText or l_props_1.Localization:getText("Dialog", "Confirm"), 
                Key = "Confirm", 
                Style = "Round"
            }, 
            {
                Text = l_props_1.CancelText or l_props_1.Localization:getText("Dialog", "Cancel"), 
                Key = "Cancel", 
                Style = "Round"
            }
        }, 
        MinContentSize = l_Stylizer_0.PopupMessageSize, 
        Modal = true
    }, {
        PromptPane = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Spacing = 15, 
            Padding = {
                Left = 12, 
                Right = 12
            }
        }, {
            Message = v2.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = l_props_1.Text, 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            HelpLink = if l_props_1.Link then v2.createElement(l_LinkText_0, {
                Text = l_props_1.Link.Text, 
                LayoutOrder = 2, 
                OnClick = function() --[[ Line: 97 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    game.GuiService:OpenBrowserWindow(l_props_1.Link.Url);
                end
            }) else nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));