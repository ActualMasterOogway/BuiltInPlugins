local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.UI.Components.Pane);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local v6 = require(l_Parent_0.UI.Components.TextInput);
local v7 = require(l_Parent_0.UI.Components.StyledDialog);
local l_LayoutOrderIterator_0 = require(l_Parent_0.Util).LayoutOrderIterator;
local v9 = require(l_Parent_0.Util.StyleModifier);
local v10 = require(l_Parent_0.Util.Typecheck);
local v11 = v1.PureComponent:extend("TextInputDialog");
v10.wrap(v11, script);
v11.defaultProps = {
    Enabled = true, 
    TextInput = {
        {
            Text = "", 
            PlaceholderText = "", 
            BottomText = ""
        }
    }, 
    Title = ""
};
v11.init = function(v12) --[[ Line: 58 ]] --[[ Name: init ]]
    local v13 = nil;
    local v14 = nil;
    local v15 = v12.props.TextInput[1];
    local v16 = v12.props.TextInput[2];
    v13 = if v15 and v15.Text then v15.Text else "";
    v14 = if v16 and v16.Text then v16.Text else "";
    v12.state = {
        text = v13, 
        additionalText = v14
    };
end;
v11.render = function(v17) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), v7 (copy), v4 (copy), v5 (copy), v6 (copy), v9 (copy)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v20 = l_LayoutOrderIterator_0.new();
    local l_Header_0 = l_props_0.Header;
    local l_Body_0 = l_props_0.Body;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_Description_0 = l_props_0.Description;
    local v25 = l_props_0.TextInput[1];
    local v26 = l_props_0.TextInput[2] or nil;
    local l_text_0 = v17.state.text;
    local l_additionalText_0 = v17.state.additionalText;
    local l_Title_0 = l_props_0.Title;
    local v30 = l_props_0.Size or Vector2.new(l_Stylizer_0.Size.X, l_Stylizer_0.Size.Y);
    local l_Enabled_0 = l_props_0.Enabled;
    local l_OnButtonPressed_0 = l_props_0.OnButtonPressed;
    local l_OnClose_0 = l_props_0.OnClose;
    return v1.createElement(v7, {
        Buttons = l_Buttons_0, 
        Title = l_Title_0, 
        MinContentSize = v30, 
        OnButtonPressed = function(v34) --[[ Line: 106 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: v26 (copy), l_OnButtonPressed_0 (copy), v17 (copy)
            if v26 then
                l_OnButtonPressed_0(v34, v17.state.text, v17.state.additionalText);
                return;
            else
                l_OnButtonPressed_0(v34, v17.state.text);
                return;
            end;
        end, 
        OnClose = function() --[[ Line: 113 ]] --[[ Name: OnClose ]]
            -- upvalues: v26 (copy), l_OnClose_0 (copy), v17 (copy)
            if v26 then
                l_OnClose_0(v17.state.text, v17.state.additionalText);
                return;
            else
                l_OnClose_0(v17.state.text);
                return;
            end;
        end, 
        Modal = true, 
        Resizable = false, 
        Enabled = l_Enabled_0, 
        Style = "AcceptCancel"
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Pane = v1.createElement(v4, {
            Style = "Box", 
            Padding = l_Stylizer_0.Padding, 
            Spacing = l_Stylizer_0.Spacing, 
            Layout = Enum.FillDirection.Vertical
        }, {
            Header = l_Header_0 and v1.createElement(v5, {
                TextSize = l_Stylizer_0.TextSize, 
                Text = l_Header_0, 
                Style = "Semibold", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextWrapped = true, 
                LayoutOrder = v20:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }) or nil, 
            Body = v1.createElement(v5, {
                Text = l_Body_0, 
                Style = "Semibold", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextWrapped = true, 
                LayoutOrder = v20:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }), 
            Description = l_Description_0 and v1.createElement(v5, {
                Text = l_Description_0, 
                Style = "Normal", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextWrapped = true, 
                LayoutOrder = v20:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }) or nil, 
            TextInput = v1.createElement(v6, {
                LayoutOrder = v20:getNextOrder(), 
                BottomText = v25.BottomText or "", 
                OnTextChanged = function(v35) --[[ Line: 164 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v17 (copy)
                    v17:setState({
                        text = v35
                    });
                end, 
                PlaceholderText = v25.PlaceholderText, 
                ShouldFocus = true, 
                StyleModifier = if v25.BottomText ~= "" and v25.BottomText ~= nil then v9.Error else nil, 
                Text = l_text_0
            }), 
            AdditionalTextInput = v26 and v1.createElement(v6, {
                LayoutOrder = v20:getNextOrder(), 
                BottomText = v26.BottomText or "", 
                OnTextChanged = function(v36) --[[ Line: 179 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v17 (copy)
                    v17:setState({
                        additionalText = v36
                    });
                end, 
                PlaceholderText = v26.PlaceholderText or "", 
                StyleModifier = if v26.BottomText ~= "" and v26.BottomText ~= nil then v9.Error else nil, 
                Text = l_additionalText_0
            }) or nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v11));