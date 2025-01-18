local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.prioritize);
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = require(l_Parent_0.Wrappers.withForwardRef);
local v7 = require(l_Parent_0.UI.Components.Container);
local v8 = require(l_Parent_0.UI.Components.RoundBox);
local v9 = require(l_Parent_0.Util.StyleModifier);
local v10 = v1.PureComponent:extend("DEPRECATED_TextInput");
v5.wrap(v10, script);
local v11 = game:DefineFastFlag("DevFrameworkFixTextInputFits", false);
v10.init = function(v12) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v9 (copy), v11 (copy)
    v12.textBoxRef = v12.props.ForwardRef or v1.createRef();
    v12.isHover = false;
    v12.isFocused = false;
    v12.setStyleModifier = function() --[[ Line: 70 ]]
        -- upvalues: v12 (copy), v9 (ref), v1 (ref)
        local v13 = nil;
        v13 = if v12.isFocused then v9.Selected else if v12.isHover then v9.Hover else v1.None;
        v12:setState({
            StyleModifier = v13
        });
    end;
    if v11 then
        v12.refit = function(v14) --[[ Line: 86 ]]
            -- upvalues: v12 (copy)
            if v14.TextFits then
                v14.TextXAlignment = v12.props.TextXAlignment or Enum.TextXAlignment.Left;
                return;
            else
                v14.TextXAlignment = v12.props.TextXAlignment or Enum.TextXAlignment.Right;
                return;
            end;
        end;
    end;
    v12.onTextChanged = function(v15) --[[ Line: 95 ]]
        -- upvalues: v12 (copy), v11 (ref)
        if not v12.textBoxRef.current then
            return;
        else
            if not v12.props.MultiLine then
                if v11 then
                    v12.refit(v15);
                elseif v15.TextFits then
                    v15.TextXAlignment = v12.props.TextXAlignment or Enum.TextXAlignment.Left;
                else
                    v15.TextXAlignment = v12.props.TextXAlignment or Enum.TextXAlignment.Right;
                end;
                if v12.props.ForceOnTextChange then
                    local v16 = string.gsub(v15.Text, "[\n\r]", " ");
                    v12.props.OnTextChanged(v16);
                    return;
                elseif v15.Text ~= v12.props.Text then
                    local v17 = string.gsub(v15.Text, "[\n\r]", " ");
                    if v12.props.OnTextChanged then
                        v12.props.OnTextChanged(v17);
                        return;
                    end;
                end;
            elseif v15.Text ~= v12.props.Text then
                v12.props.OnTextChanged(v15.Text);
            end;
            return;
        end;
    end;
    v12.onFocusGained = function(v18, v19) --[[ Line: 131 ]]
        -- upvalues: v12 (copy)
        v12.isFocused = true;
        v12.setStyleModifier();
        if v12.props.OnFocusGained then
            v12.props.OnFocusGained(v18, v19);
        end;
    end;
    v12.onFocusLost = function(v20, v21) --[[ Line: 140 ]]
        -- upvalues: v12 (copy)
        if not v12.textBoxRef.current then
            return;
        else
            v12.isFocused = false;
            v12.setStyleModifier();
            v12.textBoxRef.current.TextXAlignment = v12.props.TextXAlignment or Enum.TextXAlignment.Left;
            if v12.props.OnFocusLost then
                v12.props.OnFocusLost(v21, v20);
            end;
            return;
        end;
    end;
    v12.mouseEnter = function() --[[ Line: 158 ]]
        -- upvalues: v12 (copy)
        v12.isHover = true;
        v12.setStyleModifier();
    end;
    v12.mouseLeave = function() --[[ Line: 163 ]]
        -- upvalues: v12 (copy)
        v12.isHover = false;
        v12.setStyleModifier();
    end;
end;
v10.didUpdate = function(v22, v23) --[[ Line: 169 ]] --[[ Name: didUpdate ]]
    if v22.props.ShouldFocus and not v23.ShouldFocus and v22.textBoxRef.current then
        v22.textBoxRef.current:CaptureFocus();
    end;
end;
v10.render = function(v24) --[[ Line: 177 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy), v11 (copy), v8 (copy), v7 (copy)
    local l_props_0 = v24.props;
    local v26 = l_props_0.Enabled == nil or l_props_0.Enabled;
    local v27 = l_props_0.LayoutOrder or 0;
    local l_MultiLine_0 = l_props_0.MultiLine;
    local l_PlaceholderText_0 = l_props_0.PlaceholderText;
    local l_Position_0 = l_props_0.Position;
    local v31 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local v32 = l_props_0.Text or "";
    local l_TextWrapped_0 = l_props_0.TextWrapped;
    local l_OnInputBegan_0 = v24.props.OnInputBegan;
    local l_OnInputEnded_0 = v24.props.OnInputEnded;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v37 = v4(l_props_0.Font, l_Stylizer_0.Font);
    local v38 = v4(l_props_0.TextSize, l_Stylizer_0.TextSize);
    local l_TextColor_0 = l_Stylizer_0.TextColor;
    local l_PlaceholderTextColor_0 = l_Stylizer_0.PlaceholderTextColor;
    local v41 = v1.createElement("TextBox", {
        Visible = v24.props.Visible, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClearTextOnFocus = false, 
        PlaceholderText = l_PlaceholderText_0, 
        PlaceholderColor3 = l_PlaceholderTextColor_0, 
        Font = v37, 
        MultiLine = l_MultiLine_0, 
        TextSize = v38, 
        TextColor3 = l_TextColor_0, 
        Text = v32, 
        TextXAlignment = l_props_0.TextXAlignment or Enum.TextXAlignment.Left, 
        TextYAlignment = l_props_0.TextYAlignment or nil, 
        TextEditable = v26, 
        TextWrapped = l_TextWrapped_0, 
        [v1.Ref] = v24.textBoxRef, 
        [v1.Event.Focused] = v24.onFocusGained, 
        [v1.Event.FocusLost] = v24.onFocusLost, 
        [v1.Change.Text] = v24.onTextChanged, 
        [v1.Change.TextFits] = if v11 then v24.refit else nil, 
        [v1.Event.MouseEnter] = v24.mouseEnter, 
        [v1.Event.MouseLeave] = v24.mouseLeave, 
        [v1.Event.InputBegan] = l_OnInputBegan_0, 
        [v1.Event.InputEnded] = l_OnInputEnded_0
    });
    local l_BackgroundStyle_0 = l_Stylizer_0.BackgroundStyle;
    local l_Padding_0 = l_Stylizer_0.Padding;
    local v44 = l_Stylizer_0.useRoundBox and v8 or nil;
    return v1.createElement(v7, {
        AnchorPoint = l_props_0.AnchorPoint, 
        ClipsDescendants = true, 
        Position = l_Position_0, 
        Padding = l_Padding_0, 
        Size = v31, 
        Background = v44, 
        BackgroundStyle = l_BackgroundStyle_0, 
        LayoutOrder = v27
    }, {
        TextBox = v41
    });
end;
return v6((l_withContext_0({
    Stylizer = v2.Stylizer
})(v10)));