local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local v10 = require(l_Parent_0.Src.TagManager);
local v11 = v1.PureComponent:extend("CustomPage");
v11.init = function(v12) --[[ Line: 18 ]] --[[ Name: init ]]
    v12.state = {
        text = "", 
        focused = false
    };
end;
local function v14(v13) --[[ Line: 28 ]] --[[ Name: validate ]]
    if v13 ~= nil then
        if string.match(v13, "^rbxassetid://[0-9]+$") then
            return v13;
        elseif string.match(v13, "^[0-9]+$") then
            return "rbxassetid://" .. v13;
        end;
    end;
    return false;
end;
v11.render = function(v15) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v14 (copy), l_Button_0 (copy), v10 (copy)
    local l_props_0 = v15.props;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(l_Pane_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Input = v1.createElement(l_TextInput_0, {
            Size = UDim2.new(1, 0, 0, 40), 
            Text = v15.state.text, 
            PlaceholderText = l_Localization_1:getText("IconPicker", "EnterAnAssetID"), 
            OnTextChanged = function(v18, _) --[[ Line: 51 ]] --[[ Name: OnTextChanged ]]
                -- upvalues: v15 (copy)
                v15:setState({
                    text = v18
                });
                local v20 = v18 ~= nil and if string.match(v18, "^rbxassetid://[0-9]+$") then v18 else if string.match(v18, "^[0-9]+$") then "rbxassetid://" .. v18 else false;
                if v20 then
                    v15.props.onHoverFunc(v20);
                end;
            end, 
            OnValidateText = v14, 
            OnFocusLost = function(_, _) --[[ Line: 61 ]] --[[ Name: OnFocusLost ]]
                -- upvalues: v15 (copy)
                local l_text_0 = v15.state.text;
                local v24 = l_text_0 ~= nil and if string.match(l_text_0, "^rbxassetid://[0-9]+$") then l_text_0 else if string.match(l_text_0, "^[0-9]+$") then "rbxassetid://" .. l_text_0 else false;
                if v24 then
                    v15:setState({
                        text = v24
                    });
                    v15.props.onHoverFunc(v24);
                end;
            end
        }), 
        Submit = v1.createElement(l_Button_0, {
            Size = UDim2.fromOffset(100, 24), 
            Position = UDim2.fromOffset(8, 50), 
            Text = l_Localization_1:getText("General", "Save"), 
            Style = "RoundPrimary", 
            OnClick = function() --[[ Line: 76 ]] --[[ Name: OnClick ]]
                -- upvalues: v15 (copy), v10 (ref)
                local l_text_1 = v15.state.text;
                local v26 = l_text_1 ~= nil and if string.match(l_text_1, "^rbxassetid://[0-9]+$") then l_text_1 else if string.match(l_text_1, "^[0-9]+$") then "rbxassetid://" .. l_text_1 else false;
                if v26 then
                    v10.Get():SetIcon(v15.props.tagName, v26);
                    v15.props.closeFunc();
                end;
            end
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0
})(v11));