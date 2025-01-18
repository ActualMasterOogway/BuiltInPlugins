local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.Util.Typecheck);
local v4 = require(l_Parent_0.Wrappers.withForwardRef);
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = game:DefineFastFlag("DevFrameworkTextInputRemoveScrollingHack", false);
local v7 = Vector2.new(0, 0);
local v8 = v2.PureComponent:extend("TextBox");
v3.wrap(v8, script);
v8.defaultProps = {
    AllowTab = false, 
    Disabled = false, 
    ClearTextOnFocus = false, 
    PlaceholderText = "", 
    Size = UDim2.new(0, 100, 0, 32), 
    TextWrapped = false
};
v8.init = function(v9, v10) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v2 (copy)
    if not v6 then
        v9.clipBoxRef = v2.createRef();
    end;
    v9.textBoxRef = v10.ForwardRef or v2.createRef();
    if not v6 then
        v9.cursorPositionChanged = function() --[[ Line: 68 ]]
            -- upvalues: v9 (copy)
            v9:_updateTextBoxOffset();
        end;
    end;
    v9.focused = function() --[[ Line: 73 ]]
        -- upvalues: v9 (copy)
        if v9.props.OnFocused then
            v9.props.OnFocused();
        end;
    end;
    v9.focusLost = function(v11, v12, v13) --[[ Line: 79 ]]
        -- upvalues: v6 (ref), v9 (copy)
        if not v6 then
            v9:_resetTextBoxOffset();
        end;
        if v9.props.OnFocusLost then
            v9.props.OnFocusLost(v11, v12, v13);
        end;
        if v12 and v9.props.OnEnter ~= nil then
            v9.props.OnEnter();
        end;
    end;
    if not v6 then
        v9.textPropertiesUpdated = function() --[[ Line: 93 ]]
            -- upvalues: v9 (copy)
            local l_current_0 = v9.textBoxRef.current;
            if not l_current_0 then
                return;
            elseif #l_current_0.Text == 0 then
                v9:_resetTextBoxOffset();
                return;
            else
                v9:_updateTextBoxOffset();
                return;
            end;
        end;
    end;
    v9.textChanged = function() --[[ Line: 107 ]]
        -- upvalues: v9 (copy), v6 (ref)
        local l_current_1 = v9.textBoxRef.current;
        if not l_current_1 then
            return;
        else
            local l_Text_0 = l_current_1.Text;
            local l_l_Text_0_0 = l_Text_0;
            if not v9.props.AllowTab and string.find(l_l_Text_0_0, "\t") then
                l_l_Text_0_0 = l_l_Text_0_0:gsub("\t", "");
            end;
            if v9.props.OnEnter ~= nil and string.find(l_l_Text_0_0, "\n") then
                l_l_Text_0_0 = l_l_Text_0_0:gsub("\n", "");
            end;
            if l_l_Text_0_0 ~= l_Text_0 then
                l_Text_0 = l_l_Text_0_0;
                l_current_1.Text = l_Text_0;
                l_current_1:ReleaseFocus(true);
            end;
            if v9.props.OnTextChanged then
                v9.props.OnTextChanged(l_Text_0);
            end;
            if not v6 then
                v9.textPropertiesUpdated();
            end;
            return;
        end;
    end;
end;
v8.render = function(v18) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy)
    local l_props_0 = v18.props;
    local l_MultiLine_0 = l_props_0.MultiLine;
    if v6 then
        return v2.createElement("TextBox", {
            AutomaticSize = if l_MultiLine_0 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClearTextOnFocus = l_props_0.ClearTextOnFocus, 
            ClipsDescendants = true, 
            Font = l_props_0.Font, 
            LayoutOrder = l_props_0.LayoutOrder, 
            LineHeight = l_props_0.LineHeight, 
            MultiLine = l_props_0.MultiLine, 
            PlaceholderColor3 = l_props_0.PlaceholderTextColor, 
            PlaceholderText = l_props_0.PlaceholderText, 
            Size = l_props_0.Size, 
            Text = l_props_0.Text, 
            TextColor3 = l_props_0.TextColor, 
            TextEditable = not l_props_0.Disabled, 
            TextSize = l_props_0.TextSize, 
            TextWrapped = l_props_0.TextWrapped, 
            TextXAlignment = l_props_0.TextXAlignment, 
            TextYAlignment = l_props_0.TextYAlignment, 
            [v2.Event.Focused] = v18.focused, 
            [v2.Event.FocusLost] = v18.focusLost, 
            [v2.Change.Text] = v18.textChanged, 
            [v2.Ref] = v18.textBoxRef
        });
    else
        return v2.createElement(v5, {
            AutomaticSize = if l_MultiLine_0 then Enum.AutomaticSize.Y else nil, 
            BackgroundColor = l_props_0.BackgroundColor, 
            ClipsDescendants = true, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = l_props_0.Size, 
            [v2.Ref] = v18.clipBoxRef
        }, {
            TextBox = v2.createElement("TextBox", {
                AutomaticSize = if l_MultiLine_0 then Enum.AutomaticSize.Y else nil, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClearTextOnFocus = l_props_0.ClearTextOnFocus, 
                Font = l_props_0.Font, 
                LineHeight = l_props_0.LineHeight, 
                MultiLine = l_props_0.MultiLine, 
                PlaceholderColor3 = l_props_0.PlaceholderTextColor, 
                PlaceholderText = l_props_0.PlaceholderText, 
                Size = UDim2.fromScale(1, l_MultiLine_0 and 0 or 1), 
                Text = l_props_0.Text, 
                TextColor3 = l_props_0.TextColor, 
                TextEditable = not l_props_0.Disabled, 
                TextSize = l_props_0.TextSize, 
                TextWrapped = l_props_0.TextWrapped, 
                TextXAlignment = l_props_0.TextXAlignment, 
                TextYAlignment = l_props_0.TextYAlignment, 
                [v2.Event.Focused] = v18.focused, 
                [v2.Event.FocusLost] = v18.focusLost, 
                [v2.Change.CursorPosition] = v18.cursorPositionChanged, 
                [v2.Change.Text] = v18.textChanged, 
                [v2.Ref] = v18.textBoxRef, 
                [v2.Change.TextSize] = if not v6 then v18.textPropertiesUpdated else nil, 
                [v2.Change.Font] = if not v6 then v18.textPropertiesUpdated else nil
            })
        });
    end;
end;
if not v6 then
    v8._resetTextBoxOffset = function(v21) --[[ Line: 224 ]] --[[ Name: _resetTextBoxOffset ]]
        local l_current_2 = v21.textBoxRef.current;
        if l_current_2 then
            l_current_2.Position = UDim2.new(0, 0, 0, 0);
        end;
    end;
    v8._updateTextBoxOffset = function(v23) --[[ Line: 235 ]] --[[ Name: _updateTextBoxOffset ]]
        -- upvalues: l_TextService_0 (copy), v7 (copy)
        local l_current_3 = v23.textBoxRef.current;
        if not l_current_3 then
            return;
        else
            local l_current_4 = v23.clipBoxRef.current;
            if not l_current_4 then
                return;
            elseif v23.props.MultiLine then
                return;
            else
                local v26 = string.sub(l_current_3.Text, 1, l_current_3.CursorPosition - 1);
                if #v26 ~= l_current_3.CursorPosition - 1 then
                    return;
                else
                    local l_Font_0 = l_current_3.Font;
                    local l_TextSize_0 = l_current_3.TextSize;
                    local l_X_0 = l_TextService_0:GetTextSize(v26, l_TextSize_0, l_Font_0, v7).X;
                    local l_X_1 = l_TextService_0:GetTextSize(l_current_3.Text, l_TextSize_0, l_Font_0, v7).X;
                    local v31 = math.min(l_current_3.Position.X.Offset, 0);
                    local l_X_2 = l_current_4.AbsoluteSize.X;
                    local v33 = -v31;
                    local v34 = v33 + l_X_2;
                    if l_X_0 <= v33 then
                        v31 = -l_X_0;
                    elseif v34 <= l_X_0 then
                        v31 = -(l_X_0 - l_X_2);
                    end;
                    v31 = math.max(v31, -math.max(l_X_1 - l_X_2, 0));
                    if l_X_0 == l_X_2 - v31 then
                        v31 = v31 - 1;
                    end;
                    l_current_3.Position = UDim2.new(0, math.ceil(v31), 0, 0);
                    l_current_3.Size = UDim2.new(0, math.ceil((math.max(l_X_1, l_X_2))), 1, 0);
                    return;
                end;
            end;
        end;
    end;
end;
return v4(v8);