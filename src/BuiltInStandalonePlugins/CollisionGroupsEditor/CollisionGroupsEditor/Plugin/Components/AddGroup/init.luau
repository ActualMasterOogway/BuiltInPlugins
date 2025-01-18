local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v10 = require(script.Parent.Parent.Constants);
local v11 = v2.PureComponent:extend("AddGroup");
v11.init = function(v12) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v12.textBoxRef = v2.createRef();
    v12.text = "";
    v12.state = {
        editing = false
    };
end;
v11.render = function(v13) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_TextService_0 (copy), v2 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_DEPRECATED_TextInput_0 (copy)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v17 = #l_props_0.Groups >= v10.GroupCountMax;
    if v17 and v13.state.editing then
        v13:setState({
            editing = false
        });
    end;
    local v18 = "+ " .. l_Localization_0:getText("Actions", "AddGroup");
    local v19 = "+ " .. l_Localization_0:getText("Info", "NewGroupName");
    local l_Font_0 = l_Stylizer_0.Font;
    local l_TextSize_0 = l_Stylizer_0.TextSize;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v18, l_TextSize_0, l_Font_0, Vector2.new(0, 0));
    local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v19, l_TextSize_0, l_Font_0, Vector2.new(0, 0));
    local v24 = math.ceil(l_l_TextService_0_TextSize_0.X + 2);
    local v25 = math.ceil(l_l_TextService_0_TextSize_1.X + 2);
    local v26 = math.max(v10.ControlsHeaderButtonWidth, v24, v25);
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(0, v26, 1, 0), 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    }, {
        AddButton = not v13.state.editing and v2.createElement(l_Button_0, {
            Style = "Round", 
            Text = v18, 
            StyleModifier = if v17 then l_StyleModifier_0.Disabled else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            TextWrapped = true, 
            OnClick = function() --[[ Line: 69 ]] --[[ Name: OnClick ]]
                -- upvalues: v13 (copy), l_props_0 (copy)
                v13:setState({
                    editing = true
                });
                if v13.textBoxRef:getValue() ~= nil then
                    v13.textBoxRef:getValue():CaptureFocus();
                end;
                l_props_0.OnEditingChanged(true);
            end
        }), 
        TextInput = v13.state.editing and v2.createElement(l_DEPRECATED_TextInput_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            PlaceholderText = v19, 
            ForwardRef = v13.textBoxRef, 
            OnTextChanged = function(v27) --[[ Line: 87 ]] --[[ Name: OnTextChanged ]]
                -- upvalues: v13 (copy)
                v13.text = v27;
            end, 
            OnFocusLost = function(v28) --[[ Line: 90 ]] --[[ Name: OnFocusLost ]]
                -- upvalues: v13 (copy), l_props_0 (copy)
                local l_text_0 = v13.text;
                l_text_0 = string.gsub(l_text_0, "^%s+", "");
                local v30 = false;
                v30 = l_text_0 == "Default";
                if v28 and l_text_0 ~= "" and not v30 then
                    l_props_0.OnGroupAdded(l_text_0);
                    if v13.textBoxRef:getValue() ~= nil then
                        v13.textBoxRef:getValue():CaptureFocus();
                    end;
                else
                    v13:setState({
                        editing = false
                    });
                    l_props_0.OnEditingChanged(false);
                end;
                if v13.textBoxRef:getValue() ~= nil then
                    v13.textBoxRef:getValue().Text = "";
                end;
            end
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));