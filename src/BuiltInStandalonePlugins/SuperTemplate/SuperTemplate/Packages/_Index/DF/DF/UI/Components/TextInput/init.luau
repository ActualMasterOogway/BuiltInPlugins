local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v4 = require(l_Parent_0.Styling.supportsStyleSheets);
local v5 = require(l_Parent_0.Styling.joinTags);
local v6 = require(l_Parent_0.Styling.hasTag);
local v7 = require(script.styles);
local l_v7_Attribute_0 = v7:GetAttribute("InputTextSize");
local l_v7_Attribute_1 = v7:GetAttribute("CompactInputTextSize");
local l_v7_Attribute_2 = v7:GetAttribute("Size");
local l_v7_Attribute_3 = v7:GetAttribute("ExtraComponentSpacing");
local v12 = require(l_Parent_0.SharedFlags);
local v13 = v12.getFFlagDevFrameworkFixAutocompleteDropdownMenuStyle();
local v14 = v12.getFFlagPassTagsThroughToChildren();
local v15 = v12.getFFlagDevFrameworkFixTextInputWidth();
local v16 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v16.withContext;
local v18 = require(l_Parent_0.Util.LayoutOrderIterator);
local v19 = require(l_Parent_0.Util.Typecheck);
local v20 = require(l_Parent_0.Util.prioritize);
local v21 = require(l_Parent_0.Wrappers.withForwardRef);
local v22 = require(l_Parent_0.UI.Components.DropdownMenu);
local v23 = require(l_Parent_0.UI.Components.Pane);
local v24 = require(l_Parent_0.UI.Components.TextInput.TextBox);
local v25 = require(l_Parent_0.UI.Components.TextLabel);
local v26 = require(l_Parent_0.UI.Components.ScrollingFrame);
local v27 = require(l_Parent_0.Util.StyleModifier);
local v28 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v28.join;
local _ = require(l_Parent_0.Types);
local function _(v31, v32) --[[ Line: 110 ]] --[[ Name: getBottomText ]]
    -- upvalues: v20 (copy)
    local v33 = if v31.MaxLength then utf8.len(v31.Text) else nil;
    local v34 = if v31.MaxLength then ("%d/%d"):format(v33, v31.MaxLength) else v31.BottomText;
    return v20(v32.errorText, v31.ErrorText, v34);
end;
local function _(v36) --[[ Line: 116 ]] --[[ Name: isEmpty ]]
    return not v36 or #v36 == 0;
end;
local function _(v38) --[[ Line: 120 ]] --[[ Name: isEmptyTable ]]
    if not v38 then
        return true;
    else
        return next(v38) == nil;
    end;
end;
local v40 = v2.PureComponent:extend("TextInput");
v19.wrap(v40, script);
v40.defaultProps = {
    AllowTab = false, 
    BottomComponentProps = {}, 
    Disabled = false, 
    ClearTextOnFocus = false, 
    LeadingComponentProps = {}, 
    PlaceholderText = "", 
    ShouldFocus = false, 
    Style = if v4 then nil else "BorderBox", 
    Text = "", 
    TrailingComponentProps = {}
};
v40.init = function(v41) --[[ Line: 149 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v4 (copy)
    v41.textBoxRef = v41.props.ForwardRef or v2.createRef();
    v41.scrollingFrameRef = v2.createRef();
    v41.ref = v2.createRef();
    v41.state = {
        isError = false, 
        isFocused = false, 
        isHovered = false, 
        autocompleteItems = {}, 
        autocompleteSelectedIndex = nil
    };
    if not v4 then
        v41.mouseEnter = function() --[[ Line: 164 ]]
            -- upvalues: v41 (copy)
            if v41.unmounted then
                return;
            else
                v41:setState({
                    isHovered = true
                });
                return;
            end;
        end;
        v41.mouseLeave = function() --[[ Line: 173 ]]
            -- upvalues: v41 (copy)
            if v41.unmounted then
                return;
            else
                v41:setState({
                    isHovered = false
                });
                return;
            end;
        end;
    end;
    v41.updateAutocomplete = function(v42) --[[ Line: 183 ]]
        -- upvalues: v41 (copy), v2 (ref)
        if v41.props.GetAutocompleteItems and v41.autocompleteItemSelectTime + 0.25 < os.time() then
            local v43 = v41.props.GetAutocompleteItems(v42) or {};
            v41:setState(function(v44) --[[ Line: 187 ]]
                -- upvalues: v43 (copy), v2 (ref)
                local v45 = if #v43 > 0 and v44.autocompleteSelectedIndex then math.clamp(v44.autocompleteSelectedIndex, 1, #v43) else v2.None;
                return {
                    autocompleteItems = v43, 
                    autocompleteSelectedIndex = v45
                };
            end);
        end;
    end;
    v41.onDropdownFocusLost = function() --[[ Line: 200 ]]
        -- upvalues: v41 (copy)
        if v41.unmounted then
            return;
        else
            v41:setState({
                isFocused = false
            });
            if v41.props.OnFocusLost then
                local l_current_0 = v41.textBoxRef.current;
                v41.props.OnFocusLost(if l_current_0 then l_current_0.Text else nil, false);
            end;
            return;
        end;
    end;
    v41.updateText = function(v47) --[[ Line: 215 ]]
        -- upvalues: v41 (copy)
        local l_current_1 = v41.textBoxRef.current;
        if not l_current_1 then
            return;
        else
            if v41.props.OnFormatText then
                local v49 = v41.props.OnFormatText(v47);
                if v49 ~= nil and v49 ~= v47 then
                    l_current_1.Text = v49;
                end;
            else
                l_current_1.Text = v47;
            end;
            local v50 = v41:_validateText(v47);
            if v41.props.OnTextChanged then
                v41.props.OnTextChanged(v47, v50);
            end;
            return;
        end;
    end;
    v41.focused = function() --[[ Line: 236 ]]
        -- upvalues: v41 (copy)
        if v41.unmounted then
            return;
        else
            v41:setState({
                isFocused = true
            });
            if v41.props.OnFocused then
                v41.props.OnFocused();
            end;
            local l_current_2 = v41.textBoxRef.current;
            if l_current_2 then
                v41.updateAutocomplete(l_current_2.Text);
            end;
            return;
        end;
    end;
    v41.focusLost = function(_, v53, v54) --[[ Line: 253 ]]
        -- upvalues: v41 (copy)
        if v41.unmounted then
            return;
        else
            v41:setState(function(v55) --[[ Line: 257 ]]
                -- upvalues: v54 (copy), v53 (copy), v41 (ref)
                if not v55.isFocused then
                    return {};
                elseif v54 and v54.UserInputType ~= Enum.UserInputType.Keyboard and #v55.autocompleteItems >= 1 then
                    return {};
                else
                    if v53 then
                        local v56 = nil;
                        local l_autocompleteSelectedIndex_0 = v55.autocompleteSelectedIndex;
                        if #v55.autocompleteItems == 1 then
                            v56 = v55.autocompleteItems[1];
                        elseif #v55.autocompleteItems > 1 and l_autocompleteSelectedIndex_0 then
                            v56 = v55.autocompleteItems[l_autocompleteSelectedIndex_0];
                        end;
                        v41.autocompleteItemSelected(v56);
                    end;
                    if v41.props.OnFocusLost then
                        local l_current_3 = v41.textBoxRef.current;
                        v41.props.OnFocusLost(if l_current_3 then l_current_3.Text else nil, v53);
                    end;
                    return {
                        isFocused = false
                    };
                end;
            end);
            return;
        end;
    end;
    v41.textChanged = function(v59) --[[ Line: 294 ]]
        -- upvalues: v41 (copy)
        v41.updateText(v59);
        v41.updateAutocomplete(v59);
    end;
    v41.autocompleteItemSelectTime = 0;
    v41.autocompleteItemSelected = function(v60) --[[ Line: 301 ]]
        -- upvalues: v41 (copy)
        if not v60 then
            return;
        else
            v41.textChanged(v60.Value);
            return;
        end;
    end;
    v41.autocompleteItemChanged = function(v61) --[[ Line: 309 ]]
        -- upvalues: v41 (copy)
        v41:setState({
            autocompleteSelectedIndex = v61
        });
    end;
    v41.autocompleteMouseLeave = function() --[[ Line: 315 ]]
        -- upvalues: v41 (copy), v2 (ref)
        v41:setState({
            autocompleteSelectedIndex = v2.None
        });
    end;
end;
v40._getStyleAndTags = function(v62) --[[ Line: 322 ]] --[[ Name: _getStyleAndTags ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy)
    local l_props_0 = v62.props;
    local v64 = if v4 then l_props_0[v3.Tag] else nil;
    local v65 = if v4 then l_props_0.Style or {} else l_props_0.Stylizer;
    if v4 and typeof(v65) == "string" then
        v64 = v5(v64, v65);
        v65 = {};
    end;
    return v65, v64;
end;
v40._getTextSize = function(_, v67, v68) --[[ Line: 333 ]] --[[ Name: _getTextSize ]]
    -- upvalues: v4 (copy), v6 (copy), l_v7_Attribute_1 (copy), l_v7_Attribute_0 (copy)
    if v4 then
        if v6(v68, "Compact") then
            return l_v7_Attribute_1;
        else
            return l_v7_Attribute_0;
        end;
    elseif v67 == nil then
        return l_v7_Attribute_0;
    else
        return v67.TextSize;
    end;
end;
v40._getPositionAtIndex = function(v69, v70, v71) --[[ Line: 341 ]] --[[ Name: _getPositionAtIndex ]]
    -- upvalues: l_TextService_0 (copy)
    local l_Y_0 = v71.CanvasPosition.Y;
    local v73, v74 = v69:_getStyleAndTags();
    local v75 = v69:_getTextSize(v73, v74);
    local v76 = v71.AbsoluteSize.X - 8;
    local l_Y_1 = v71.AbsoluteSize.Y;
    local l_Y_2 = l_TextService_0:GetTextSize(string.sub(v69.props.Text, 0, v70 - 1), v75, Enum.Font.SourceSans, Vector2.new(v76, 1e999)).Y;
    if l_Y_2 < l_Y_0 + v75 then
        return l_Y_2 - v75;
    elseif l_Y_0 + l_Y_1 - v75 < l_Y_2 then
        return l_Y_2 - l_Y_1;
    else
        return l_Y_0;
    end;
end;
v40._updateScroller = function(v79, v80) --[[ Line: 363 ]] --[[ Name: _updateScroller ]]
    -- upvalues: l_TextService_0 (copy)
    local l_props_1 = v79.props;
    local l_current_4 = v79.scrollingFrameRef.current;
    if not l_current_4 or not l_props_1.MultiLine then
        return;
    else
        local v83, v84 = v79:_getStyleAndTags();
        local v85 = v79:_getTextSize(v83, v84);
        local v86 = l_current_4.AbsoluteSize.X - 8;
        local l_current_5 = v79.textBoxRef.current;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_props_1.Text, v85, Enum.Font.SourceSans, Vector2.new(v86, 1e999));
        l_current_4.CanvasSize = UDim2.new(0, 0, 0, l_l_TextService_0_TextSize_0.y);
        l_current_5.Size = UDim2.new(1, 0, 0, (math.max(l_current_4.AbsoluteSize.Y, l_l_TextService_0_TextSize_0.y)));
        if v80 and l_current_5.CursorPosition >= 0 then
            l_current_4.CanvasPosition = Vector2.new(0, v79:_getPositionAtIndex(l_current_5.CursorPosition, l_current_4));
        end;
        return;
    end;
end;
v40.didMount = function(v89) --[[ Line: 382 ]] --[[ Name: didMount ]]
    local l_props_2 = v89.props;
    local l_MultiLine_0 = l_props_2.MultiLine;
    local l_current_6 = v89.textBoxRef.current;
    if l_MultiLine_0 and l_current_6 then
        v89.cursorChangeSignal = l_current_6:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ Line: 387 ]]
            -- upvalues: v89 (copy)
            v89:_updateScroller(true);
        end);
    end;
    if l_props_2.ShouldFocus and l_current_6 then
        l_current_6:CaptureFocus();
    end;
end;
v40.willUnmount = function(v93) --[[ Line: 397 ]] --[[ Name: willUnmount ]]
    v93.unmounted = true;
    if v93.cursorChangeSignal then
        v93.cursorChangeSignal:Disconnect();
    end;
end;
v40.didUpdate = function(v94, v95, v96) --[[ Line: 405 ]] --[[ Name: didUpdate ]]
    local l_props_3 = v94.props;
    local l_state_0 = v94.state;
    local l_current_7 = v94.textBoxRef.current;
    if not l_current_7 then
        return;
    else
        if l_props_3.ShouldFocus and not v95.ShouldFocus then
            l_current_7:CaptureFocus();
        end;
        if l_props_3.MultiLine then
            local v100 = true;
            if v95.Text == l_props_3.Text then
                v100 = l_current_7.CursorPosition ~= v95.CursorPosition;
            end;
            v94:_updateScroller(v100);
        end;
        if v96.autocompleteItems and not l_state_0.autocompleteItems then
            v94.focusLost();
        end;
        return;
    end;
end;
v40._exceedsMaxLength = function(v101) --[[ Line: 429 ]] --[[ Name: _exceedsMaxLength ]]
    local l_props_4 = v101.props;
    return l_props_4.MaxLength and utf8.len(l_props_4.Text) > l_props_4.MaxLength;
end;
v40.hasError = function(v103) --[[ Line: 434 ]] --[[ Name: hasError ]]
    -- upvalues: v4 (copy), v6 (copy), v3 (copy), v27 (copy)
    local l_state_1 = v103.state;
    local l_props_5 = v103.props;
    local v106;
    if v4 then
        v106 = v103:_exceedsMaxLength();
        if not v106 then
            v106 = l_state_1.isError;
            if not v106 then
                v106 = v6(l_props_5[v3.Tag], "Error");
                if not v106 then
                    local l_ErrorText_0 = l_props_5.ErrorText;
                    return not (not l_ErrorText_0 or #l_ErrorText_0 == 0);
                end;
            end;
        end;
    else
        v106 = l_props_5.StyleModifier == v27.Error;
    end;
    return v106;
end;
v40.render = function(v108) --[[ Line: 444 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v4 (copy), v2 (copy), v25 (copy), v3 (copy), v5 (copy), v22 (copy), v13 (copy), v14 (copy), v23 (copy)
    local l_props_6 = v108.props;
    local l_state_2 = v108.state;
    local v111, v112 = v108:_getStyleAndTags();
    local v113 = if l_props_6.MaxLength then utf8.len(l_props_6.Text) else nil;
    local v114 = if l_props_6.MaxLength then ("%d/%d"):format(v113, l_props_6.MaxLength) else l_props_6.BottomText;
    local v115 = v20(l_state_2.errorText, l_props_6.ErrorText, v114);
    v113 = not (not v115 or #v115 == 0);
    v114 = v108:hasError();
    local l_XY_0 = Enum.AutomaticSize.XY;
    if l_props_6.AutomaticSize then
        l_XY_0 = l_props_6.AutomaticSize;
    end;
    local v117 = {
        TextInput = v108:_renderTextInput(v113)
    };
    if v113 then
        local v118 = v114 and "Error" or v4 and "Label" or v111.BottomText;
        v117.BottomText = v2.createElement(v25, if v4 then {
            LayoutOrder = 2, 
            Text = v115, 
            [v3.Tag] = v5(v118, "X-Fit Wrap")
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Style = v118, 
            StyleModifier = l_state_2.StyleModifier, 
            Text = v115, 
            TextWrapped = true
        });
    end;
    if l_state_2.autocompleteItems and #l_state_2.autocompleteItems > 0 then
        local v119 = l_props_6.Width or v108.ref and v108.ref.current.AbsoluteSize.X;
        local v120 = nil;
        v120 = #l_state_2.autocompleteItems == 1 and 1 or l_state_2.autocompleteSelectedIndex;
        v117.AutocompleteDropdown = v2.createElement(v22, {
            Items = l_state_2.autocompleteItems, 
            OnHoveredItemChanged = v108.autocompleteItemChanged, 
            OnMouseLeave = v108.autocompleteMouseLeave, 
            Hide = not l_state_2.isFocused, 
            HoveredItemIndex = v120, 
            Style = if v13 then nil else "TextInputDropdown", 
            Width = v119, 
            Position = l_props_6.Position, 
            OnItemActivated = v108.autocompleteItemSelected, 
            OnFocusLost = v108.onDropdownFocusLost, 
            OnRenderItem = l_props_6.OnRenderAutocompleteItem
        });
    end;
    local v121 = if v113 then v111.BottomTextSpacing else 0;
    local v122 = nil;
    v122 = if v4 then {
        AnchorPoint = l_props_6.AnchorPoint, 
        AutomaticSize = l_XY_0, 
        LayoutOrder = l_props_6.LayoutOrder, 
        Position = l_props_6.Position, 
        Size = v108:_getSize(), 
        [v2.Ref] = v108.ref, 
        [v3.Tag] = if v14 then l_props_6[v3.Tag] or v5("Component-TextInput", "X-Left X-Top X-ColumnS", v112) else v5("Component-TextInput", "X-Left X-Top X-ColumnS", v112)
    } else {
        AnchorPoint = l_props_6.AnchorPoint, 
        AutomaticSize = l_XY_0, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_6.LayoutOrder, 
        Position = l_props_6.Position, 
        [v2.Ref] = v108.ref, 
        Spacing = v121, 
        Size = v108:_getSize(), 
        VerticalAlignment = Enum.VerticalAlignment.Top
    };
    return v2.createElement(v23, v122, v117);
end;
v40._getSize = function(v123) --[[ Line: 543 ]] --[[ Name: _getSize ]]
    -- upvalues: v20 (copy), l_v7_Attribute_2 (copy)
    local l_props_7 = v123.props;
    local v125 = v123:_getStyleAndTags();
    local v126 = v20(l_props_7.Size, v125.Size) or l_v7_Attribute_2;
    local v127 = v20(l_props_7.Width, v125.Width);
    local v128 = v20(l_props_7.Height, v125.Height);
    if typeof(v127) == "number" then
        v126 = UDim2.new(UDim.new(0, v127), v126.Y);
    elseif typeof(v127) == "UDim" then
        v126 = UDim2.new(v127, v126.Y);
    end;
    if typeof(v128) == "number" then
        return (UDim2.new(v126.X, UDim.new(0, v128)));
    else
        if typeof(v128) == "UDim" then
            v126 = UDim2.new(v126.X, v128);
        end;
        return v126;
    end;
end;
local function _(v129) --[[ Line: 565 ]] --[[ Name: getLeadingComponent ]]
    -- upvalues: v4 (copy), v20 (copy)
    local v130 = if v4 then nil else v129.Stylizer;
    local v131 = if v4 then v129.LeadingComponent else v20(v129.LeadingComponent, v130.LeadingComponent);
    local l_LeadingComponentProps_0 = v129.LeadingComponentProps;
    if not v4 then
        local l_l_LeadingComponentProps_0_0 = l_LeadingComponentProps_0;
        if not l_l_LeadingComponentProps_0_0 or next(l_l_LeadingComponentProps_0_0) == nil then
            l_l_LeadingComponentProps_0_0 = v130.LeadingComponentProps;
            if not (not l_l_LeadingComponentProps_0_0 or next(l_l_LeadingComponentProps_0_0) == nil) then
                l_LeadingComponentProps_0 = v130.LeadingComponentProps;
            end;
        end;
    end;
    return v131, l_LeadingComponentProps_0;
end;
local function _(v135) --[[ Line: 577 ]] --[[ Name: getTrailingComponent ]]
    -- upvalues: v4 (copy), v20 (copy)
    local v136 = if v4 then nil else v135.Stylizer;
    local v137 = if v4 then v135.TrailingComponent else v20(v135.TrailingComponent, v136.TrailingComponent);
    local l_TrailingComponentProps_0 = v135.TrailingComponentProps;
    if not v4 then
        local l_l_TrailingComponentProps_0_0 = l_TrailingComponentProps_0;
        if not l_l_TrailingComponentProps_0_0 or next(l_l_TrailingComponentProps_0_0) == nil then
            l_l_TrailingComponentProps_0_0 = v136.TrailingComponentProps;
            if not (not l_l_TrailingComponentProps_0_0 or next(l_l_TrailingComponentProps_0_0) == nil) then
                l_TrailingComponentProps_0 = v136.TrailingComponentProps;
            end;
        end;
    end;
    return v137, l_TrailingComponentProps_0;
end;
local function v146(v141) --[[ Line: 589 ]] --[[ Name: getBottomComponent ]]
    -- upvalues: v4 (copy), v20 (copy)
    local v142 = if v4 then {} else v141.Stylizer;
    local v143 = if v4 then v141.BottomComponent else v20(v141.BottomComponent, v142.BottomComponent);
    local l_BottomComponentProps_0 = v141.BottomComponentProps;
    if not v4 then
        local l_l_BottomComponentProps_0_0 = l_BottomComponentProps_0;
        if not l_l_BottomComponentProps_0_0 or next(l_l_BottomComponentProps_0_0) == nil then
            l_l_BottomComponentProps_0_0 = v142.BottomComponentProps;
            if not (not l_l_BottomComponentProps_0_0 or next(l_l_BottomComponentProps_0_0) == nil) then
                l_BottomComponentProps_0 = v142.BottomComponentProps;
            end;
        end;
    end;
    return v143, l_BottomComponentProps_0;
end;
v40._renderTextInput = function(v147, v148) --[[ Line: 601 ]] --[[ Name: _renderTextInput ]]
    -- upvalues: v4 (copy), v18 (copy), v20 (copy), v146 (copy), v2 (copy), l_join_0 (copy), v7 (copy), v24 (copy), v26 (copy), v15 (copy), v23 (copy), v28 (copy), v3 (copy), v14 (copy), v5 (copy)
    local l_props_8 = v147.props;
    local v150 = if v4 then {} else l_props_8.Stylizer;
    local l_StyleModifier_0 = v147.state.StyleModifier;
    local v152 = v18.new();
    local v153 = if v4 then nil else l_props_8.Stylizer;
    local v154 = if v4 then l_props_8.LeadingComponent else v20(l_props_8.LeadingComponent, v153.LeadingComponent);
    local l_LeadingComponentProps_1 = l_props_8.LeadingComponentProps;
    if not v4 then
        local l_l_LeadingComponentProps_1_0 = l_LeadingComponentProps_1;
        if not l_l_LeadingComponentProps_1_0 or next(l_l_LeadingComponentProps_1_0) == nil then
            l_l_LeadingComponentProps_1_0 = v153.LeadingComponentProps;
            if not (not l_l_LeadingComponentProps_1_0 or next(l_l_LeadingComponentProps_1_0) == nil) then
                l_LeadingComponentProps_1 = v153.LeadingComponentProps;
            end;
        end;
    end;
    local l_v154_0 = v154;
    local l_l_LeadingComponentProps_1_1 = l_LeadingComponentProps_1;
    l_LeadingComponentProps_1 = if v4 then nil else l_props_8.Stylizer;
    local v159 = if v4 then l_props_8.TrailingComponent else v20(l_props_8.TrailingComponent, l_LeadingComponentProps_1.TrailingComponent);
    local l_TrailingComponentProps_1 = l_props_8.TrailingComponentProps;
    if not v4 then
        local l_l_TrailingComponentProps_1_0 = l_TrailingComponentProps_1;
        if not l_l_TrailingComponentProps_1_0 or next(l_l_TrailingComponentProps_1_0) == nil then
            l_l_TrailingComponentProps_1_0 = l_LeadingComponentProps_1.TrailingComponentProps;
            if not (not l_l_TrailingComponentProps_1_0 or next(l_l_TrailingComponentProps_1_0) == nil) then
                l_TrailingComponentProps_1 = l_LeadingComponentProps_1.TrailingComponentProps;
            end;
        end;
    end;
    v153 = v159;
    v154 = l_TrailingComponentProps_1;
    l_LeadingComponentProps_1, v159 = v146(l_props_8);
    l_TrailingComponentProps_1 = function(v162, v163) --[[ Line: 611 ]] --[[ Name: renderExtraComponent ]]
        -- upvalues: v2 (ref), l_join_0 (ref), v152 (copy), l_StyleModifier_0 (copy)
        if v162 then
            return v2.createElement(v162, l_join_0(v163, {
                LayoutOrder = v152:getNextOrder(), 
                StyleModifier = l_StyleModifier_0
            }));
        else
            return nil;
        end;
    end;
    local v164 = 0;
    local v165 = 0;
    if l_v154_0 or v153 or l_LeadingComponentProps_1 then
        v164 = (if v4 then v7:GetAttribute("HorizontalComponentSpacing") else v150.HorizontalComponentSpacing) or 0;
        v165 = (if v4 then v7:GetAttribute("VerticalComponentSpacing") else v150.VerticalComponentSpacing) or 0;
    end;
    local function v168() --[[ Line: 640 ]] --[[ Name: calculateTextBoxSize ]]
        -- upvalues: l_v154_0 (copy), v153 (copy), l_LeadingComponentProps_1 (copy), v164 (ref), l_l_LeadingComponentProps_1_1 (copy), v154 (copy), v165 (ref), v159 (copy)
        if l_v154_0 or v153 or l_LeadingComponentProps_1 then
            local v166 = 0;
            local v167 = 0;
            if l_v154_0 then
                v166 = v166 + v164;
                if l_l_LeadingComponentProps_1_1.Size then
                    v166 = v166 + l_l_LeadingComponentProps_1_1.Size.X.Offset;
                end;
            end;
            if v153 then
                v166 = v166 + v164;
                if v154.Size then
                    v166 = v166 + v154.Size.X.Offset;
                end;
            end;
            if l_LeadingComponentProps_1 then
                v167 = v167 + v165;
                if v159.Size then
                    v167 = v167 + v159.Size.Y.Offset;
                end;
            end;
            return UDim2.new(1, -v166, 1, -v167);
        else
            return UDim2.fromScale(1, 1);
        end;
    end;
    local l_MultiLine_1 = l_props_8.MultiLine;
    local function v176() --[[ Line: 674 ]] --[[ Name: renderTextBox ]]
        -- upvalues: v20 (ref), l_props_8 (copy), v150 (copy), l_MultiLine_1 (copy), v168 (copy), v152 (copy), v2 (ref), v24 (ref), v147 (copy), v26 (ref)
        local v170 = v20(l_props_8.TextXAlignment, v150.TextXAlignment);
        local v171 = if l_MultiLine_1 then Enum.TextYAlignment.Top else nil;
        local v172 = v20(l_props_8.TextYAlignment, v150.TextYAlignment, v171);
        local v173 = v168();
        local v174 = v152:getNextOrder();
        local v175 = v2.createElement(v24, {
            AllowTab = l_props_8.AllowTab, 
            ClearTextOnFocus = l_props_8.ClearTextOnFocus, 
            Disabled = l_props_8.Disabled, 
            Font = v150.Font, 
            LayoutOrder = if l_MultiLine_1 then nil else v174, 
            LineHeight = v150.LineHeight, 
            MultiLine = l_MultiLine_1, 
            OnEnter = l_props_8.OnEnter, 
            PlaceholderText = l_props_8.PlaceholderText, 
            PlaceholderTextColor = v150.PlaceholderTextColor, 
            Size = v173, 
            Text = l_props_8.Text, 
            TextColor = v150.TextColor, 
            TextSize = v150.TextSize, 
            TextWrapped = l_MultiLine_1, 
            TextXAlignment = v170, 
            TextYAlignment = v172, 
            OnFocused = v147.focused, 
            OnFocusLost = v147.focusLost, 
            OnTextChanged = v147.textChanged, 
            [v2.Ref] = v147.textBoxRef
        });
        if l_MultiLine_1 then
            return v2.createElement(v26, {
                LayoutOrder = v174, 
                Size = v173, 
                [v2.Ref] = v147.scrollingFrameRef
            }, {
                TextBox = v175
            });
        else
            return v175;
        end;
    end;
    local v177 = if l_v154_0 then v2.createElement(l_v154_0, l_join_0(l_l_LeadingComponentProps_1_1, {
        LayoutOrder = v152:getNextOrder(), 
        StyleModifier = l_StyleModifier_0
    })) else nil;
    local v178 = v176();
    local v179 = if v153 then v2.createElement(v153, l_join_0(v154, {
        LayoutOrder = v152:getNextOrder(), 
        StyleModifier = l_StyleModifier_0
    })) else nil;
    local v180 = {
        LeadingContent = v177, 
        TextBox = v178, 
        TrailingContent = v179
    };
    local l_Horizontal_0 = Enum.FillDirection.Horizontal;
    local v182 = if v15 then v164 else v150.HorizontalComponentSpacing;
    if l_LeadingComponentProps_1 then
        local l_v178_0 = v178;
        if l_v154_0 or v153 then
            l_v178_0 = v2.createElement(v23, if v4 then v28.join({
                LayoutOrder = v152:getNextOrder()
            }, if v15 then {
                Layout = Enum.FillDirection.Horizontal, 
                Spacing = v164
            } else {
                [v3.Tag] = "X-RowM"
            }) else {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v152:getNextOrder(), 
                Spacing = v150.HorizontalComponentSpacing
            }, {
                LeadingContent = v177, 
                TextBox = v178, 
                TrailingContent = v179
            });
        end;
        l_Horizontal_0 = Enum.FillDirection.Vertical;
        v182 = if v15 then v165 else v150.VerticalComponentSpacing;
        v180 = {
            TextBoxContent = l_v178_0, 
            BottomContent = if l_LeadingComponentProps_1 then v2.createElement(l_LeadingComponentProps_1, l_join_0(v159, {
                LayoutOrder = v152:getNextOrder(), 
                StyleModifier = l_StyleModifier_0
            })) else nil
        };
    end;
    local v184 = v20(l_props_8.BackgroundColor, v150.BackgroundColor);
    local v185 = v20(l_props_8.BorderColor, v150.BorderColor);
    if v147:_exceedsMaxLength() or l_props_8.ErrorText then
        v185 = v150.ErrorBorderColor;
    end;
    local v186 = v147:hasError();
    return v2.createElement(v23, if v4 then v28.join({
        LayoutOrder = v148 and 1 or l_props_8.LayoutOrder, 
        Size = v147:_getSize(), 
        [v2.Event.MouseEnter] = v147.mouseEnter, 
        [v2.Event.MouseLeave] = v147.mouseLeave, 
        [v3.Tag] = if v14 then l_props_8.PaneTags or v5("Input X-Corner X-Left X-PadS X-Middle", v186 and "X-Error" or "X-Stroke", if v15 then nil else l_Horizontal_0 == Enum.FillDirection.Vertical and "X-ColumnM" or "X-RowM") else v5("Input X-Corner X-Left X-PadS X-Middle", v186 and "X-Error" or "X-Stroke", if v15 then nil else l_Horizontal_0 == Enum.FillDirection.Vertical and "X-ColumnM" or "X-RowM")
    }, if v15 then {
        Layout = l_Horizontal_0, 
        Spacing = v182
    } else nil) else {
        BackgroundColor = v184, 
        BorderColor = v185, 
        ClipsDescendants = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Layout = l_Horizontal_0, 
        LayoutOrder = v148 and 1 or l_props_8.LayoutOrder, 
        Padding = if l_MultiLine_1 then v150.MultiLinePadding else v150.Padding, 
        Size = v147:_getSize(), 
        Spacing = v182, 
        Style = l_props_8.Style == "PropertyCellError" and "BorderBox" or l_props_8.Style, 
        [v2.Event.MouseEnter] = v147.mouseEnter, 
        [v2.Event.MouseLeave] = v147.mouseLeave
    }, v180);
end;
v40._DEPRECATED_renderTextInput = function(v187, v188) --[[ Line: 819 ]] --[[ Name: _DEPRECATED_renderTextInput ]]
    -- upvalues: v4 (copy), v20 (copy), l_v7_Attribute_3 (copy), v18 (copy), v2 (copy), l_join_0 (copy), v24 (copy), v26 (copy), v23 (copy), v3 (copy), v5 (copy)
    local l_props_9 = v187.props;
    local l_state_3 = v187.state;
    local v191 = if v4 then l_props_9.Style or {} else l_props_9.Stylizer;
    if v4 and typeof(v191) == "string" then
        v191 = {};
    end;
    local v192 = v20(l_props_9.BackgroundColor, v191.BackgroundColor);
    local v193 = v20(l_props_9.BorderColor, v191.BorderColor);
    local l_MultiLine_2 = l_props_9.MultiLine;
    local v195 = if v4 then l_v7_Attribute_3 else v191.ExtraComponentSpacing;
    local v196 = v20(l_props_9.TrailingComponent, v191.TrailingComponent);
    local l_TrailingComponentProps_2 = l_props_9.TrailingComponentProps;
    local v198 = v20(l_props_9.LeadingComponent, v191.LeadingComponent);
    local l_LeadingComponentProps_2 = l_props_9.LeadingComponentProps;
    local l_l_TrailingComponentProps_2_0 = l_TrailingComponentProps_2;
    if not l_l_TrailingComponentProps_2_0 or next(l_l_TrailingComponentProps_2_0) == nil then
        l_l_TrailingComponentProps_2_0 = v191.TrailingComponentProps;
        if not (not l_l_TrailingComponentProps_2_0 or next(l_l_TrailingComponentProps_2_0) == nil) then
            l_TrailingComponentProps_2 = v191.TrailingComponentProps;
        end;
    end;
    l_l_TrailingComponentProps_2_0 = l_LeadingComponentProps_2;
    if not l_l_TrailingComponentProps_2_0 or next(l_l_TrailingComponentProps_2_0) == nil then
        l_l_TrailingComponentProps_2_0 = v191.LeadingComponentProps;
        if not (not l_l_TrailingComponentProps_2_0 or next(l_l_TrailingComponentProps_2_0) == nil) then
            l_LeadingComponentProps_2 = v191.LeadingComponentProps;
        end;
    end;
    if v187:_exceedsMaxLength() or l_props_9.ErrorText then
        v193 = v191.ErrorBorderColor;
    end;
    local v201 = v187:_getSize();
    l_l_TrailingComponentProps_2_0 = v18.new();
    local function _(v202, v203) --[[ Line: 851 ]] --[[ Name: renderExtraComponent ]]
        -- upvalues: v2 (ref), l_join_0 (ref), l_l_TrailingComponentProps_2_0 (copy), l_state_3 (copy)
        if v202 then
            return v2.createElement(v202, l_join_0(v203, {
                LayoutOrder = l_l_TrailingComponentProps_2_0:getNextOrder(), 
                StyleModifier = l_state_3.StyleModifier
            }));
        else
            return nil;
        end;
    end;
    local v205 = v198 or v196;
    local v206 = nil;
    if v205 then
        local v207 = 0;
        if v198 then
            if l_LeadingComponentProps_2.Size then
                v207 = v207 + l_LeadingComponentProps_2.Size.X.Offset;
            end;
            v207 = v207 + v195;
        end;
        if v196 then
            if l_TrailingComponentProps_2.Size then
                v207 = v207 + l_TrailingComponentProps_2.Size.X.Offset;
            end;
            v207 = v207 + v195;
        end;
        v206 = UDim2.new(1, -v207, 1, 0);
    else
        v206 = UDim2.fromScale(1, 1);
    end;
    local v208 = v20(l_props_9.TextXAlignment, v191.TextXAlignment);
    local v209 = v20(l_props_9.TextYAlignment, v191.TextYAlignment, if l_MultiLine_2 then Enum.TextYAlignment.Top else nil);
    local l_v198_0 = v198;
    local l_l_LeadingComponentProps_2_0 = l_LeadingComponentProps_2;
    v198 = if l_v198_0 then v2.createElement(l_v198_0, l_join_0(l_l_LeadingComponentProps_2_0, {
        LayoutOrder = l_l_TrailingComponentProps_2_0:getNextOrder(), 
        StyleModifier = l_state_3.StyleModifier
    })) else nil;
    l_v198_0 = v2.createElement(v24, {
        AllowTab = l_props_9.AllowTab, 
        ClearTextOnFocus = l_props_9.ClearTextOnFocus, 
        Disabled = l_props_9.Disabled, 
        Font = v191.Font, 
        LayoutOrder = l_l_TrailingComponentProps_2_0:getNextOrder(), 
        LineHeight = v191.LineHeight, 
        MultiLine = l_MultiLine_2, 
        OnEnter = l_props_9.OnEnter, 
        PlaceholderText = l_props_9.PlaceholderText, 
        PlaceholderTextColor = v191.PlaceholderTextColor, 
        Size = v206, 
        Text = l_props_9.Text, 
        TextColor = v191.TextColor, 
        TextSize = v191.TextSize, 
        TextWrapped = l_MultiLine_2, 
        TextXAlignment = v208, 
        TextYAlignment = v209, 
        OnFocused = v187.focused, 
        OnFocusLost = v187.focusLost, 
        OnTextChanged = v187.textChanged, 
        [v2.Ref] = v187.textBoxRef
    });
    if l_MultiLine_2 then
        l_v198_0 = v2.createElement(v26, {
            Size = UDim2.fromScale(1, 1), 
            [v2.Ref] = v187.scrollingFrameRef
        }, {
            TextBox = l_v198_0
        });
    end;
    l_l_LeadingComponentProps_2_0 = v196;
    local l_l_TrailingComponentProps_2_1 = l_TrailingComponentProps_2;
    v196 = if l_l_LeadingComponentProps_2_0 then v2.createElement(l_l_LeadingComponentProps_2_0, l_join_0(l_l_TrailingComponentProps_2_1, {
        LayoutOrder = l_l_TrailingComponentProps_2_0:getNextOrder(), 
        StyleModifier = l_state_3.StyleModifier
    })) else nil;
    l_l_LeadingComponentProps_2_0 = v187:hasError();
    return v2.createElement(v23, if v4 then {
        LayoutOrder = v188 and 1 or l_props_9.LayoutOrder, 
        Size = v201, 
        [v2.Event.MouseEnter] = v187.mouseEnter, 
        [v2.Event.MouseLeave] = v187.mouseLeave, 
        [v3.Tag] = v5("Input X-RowM X-Corner X-Left X-PadS", l_l_LeadingComponentProps_2_0 and "X-Error" or "X-Stroke")
    } else {
        BackgroundColor = v192, 
        BorderColor = v193, 
        ClipsDescendants = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v188 and 1 or l_props_9.LayoutOrder, 
        Padding = if l_MultiLine_2 then v191.MultiLinePadding else v191.Padding, 
        Size = v201, 
        Spacing = v205 and v195 or nil, 
        Style = l_props_9.Style == "PropertyCellError" and "BorderBox" or l_props_9.Style, 
        [v2.Event.MouseEnter] = v187.mouseEnter, 
        [v2.Event.MouseLeave] = v187.mouseLeave
    }, {
        LeadingComponent = v198, 
        TextBox = l_v198_0, 
        TrailingComponent = v196
    });
end;
v40._validateText = function(v213, v214) --[[ Line: 964 ]] --[[ Name: _validateText ]]
    -- upvalues: v2 (copy)
    if v213.props.OnValidateText then
        local v215, v216 = v213.props.OnValidateText(v214);
        local v217 = not v215;
        if v213.state.isError ~= v217 or v213.state.errorText ~= v216 then
            v213:setState({
                isError = v217, 
                errorText = v216 or v2.None
            });
        end;
        return v215;
    else
        return true;
    end;
end;
v40.getDerivedStateFromProps = function(v218, v219) --[[ Line: 979 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v27 (copy), v2 (copy)
    local v220 = false;
    local v221 = nil;
    if v218.Disabled then
        v221 = v27.Disabled;
    else
        if not v219.isError and not v218.Error then
            local l_ErrorText_1 = v218.ErrorText;
            if not l_ErrorText_1 or #l_ErrorText_1 == 0 then
                if v219.isFocused then
                    v221 = v27.Selected;
                    v220 = true;
                elseif v219.isHovered then
                    v221 = v27.Hover;
                    v220 = true;
                else
                    v220 = true;
                end;
            end;
        end;
        if not v220 then
            if not v220 then
                if not v220 then
                    v221 = v27.Error;
                end;
            end;
        end;
    end;
    v220 = false;
    if v221 ~= v219.StyleModifier then
        return {
            StyleModifier = v221 or v2.None
        };
    else
        return nil;
    end;
end;
return v21((l_withContext_0({
    Stylizer = if v4 then nil else v16.Stylizer
})(v40)));