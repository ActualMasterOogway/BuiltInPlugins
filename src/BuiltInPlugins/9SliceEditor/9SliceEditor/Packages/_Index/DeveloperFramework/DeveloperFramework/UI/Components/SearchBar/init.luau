local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util);
local l_isInputMainPress_0 = v4.isInputMainPress;
local l_prioritize_0 = v4.prioritize;
local v7 = require(l_Parent_0.Util.Typecheck);
local v8 = require(l_Parent_0.Util.StyleModifier);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v10 = require(l_Parent_0.UI.Components.Pane);
local v11 = require(l_Parent_0.UI.Components.Image);
local v12 = require(l_Parent_0.UI.Components.TextInput);
local v13 = require(l_Parent_0.UI.Components.DEPRECATED_TextInput);
local v14 = require(script.SearchButtons);
local v15 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v16 = require(l_Parent_0.Styling.supportsStyleSheets);
local v17 = require(l_Parent_0.Styling.joinTags);
local v18 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkFixSearchBarVerticalPadding);
local v19 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkSearchBarFocusLost);
local v20 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkSearchBarFocusOnMount);
local v21 = game:DefineFastFlag("DevFrameworkSearchBarAutomaticSize", false);
local v22 = game:DefineFastFlag("DevFrameworkSearchBarFixClearImmediacy", false);
local v23 = v1.PureComponent:extend("SearchBar");
v7.wrap(v23, script);
v23.defaultProps = {
    ButtonWidth = 24, 
    LayoutOrder = 0, 
    Disabled = false, 
    IncrementalTextSearch = false, 
    IncrementalTextSearchDelay = 500, 
    ShowSearchButton = true, 
    ShowSearchIcon = false, 
    ShouldFocusOnMount = false, 
    ShowFilterButton = false, 
    SearchIsFiltered = false
};
v23.init = function(v24) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_isInputMainPress_0 (copy), v4 (copy), v1 (copy), v19 (copy), v22 (copy)
    v24.state = {
        text = "", 
        lastSearchTermAsProp = "", 
        isFocused = false, 
        isHovered = false, 
        shouldFocus = false
    };
    if not v16 then
        v24.mouseEnter = function() --[[ Line: 104 ]]
            -- upvalues: v24 (copy)
            if v24.props.Disabled then
                return;
            else
                v24:setStateAndStyleModifier({
                    isHovered = true
                });
                return;
            end;
        end;
        v24.mouseLeave = function() --[[ Line: 113 ]]
            -- upvalues: v24 (copy)
            if v24.props.Disabled then
                return;
            else
                v24:setStateAndStyleModifier({
                    isHovered = false
                });
                return;
            end;
        end;
    end;
    v24.requestSearch = function() --[[ Line: 123 ]]
        -- upvalues: v24 (copy)
        if v24.props.Disabled then
            return;
        else
            if v24.searchDelayTask then
                task.cancel(v24.searchDelayTask);
                v24.searchDelayTask = nil;
            end;
            if v24.props.OnSearchRequested then
                v24.props.OnSearchRequested(v24.state.text);
            end;
            return;
        end;
    end;
    v24.onBackgroundInputBegan = function(_, v26) --[[ Line: 141 ]]
        -- upvalues: v24 (copy), l_isInputMainPress_0 (ref)
        if v24.props.Disabled then
            return;
        else
            if l_isInputMainPress_0(v26) then
                v24:setState({
                    shouldFocus = true
                });
            end;
            return;
        end;
    end;
    v24.onBackgroundFocusLost = function(_, v28) --[[ Line: 154 ]]
        -- upvalues: v24 (copy)
        if v24.props.Disabled then
            return;
        else
            if v28.UserInputType == Enum.UserInputType.Focus then
                v24:onFocusLost(false);
            end;
            return;
        end;
    end;
    v24.startIncrementalTextSearch = function() --[[ Line: 163 ]]
        -- upvalues: v24 (copy)
        if v24.props.IncrementalTextSearch then
            if v24.searchDelayTask then
                task.cancel(v24.searchDelayTask);
            end;
            v24.searchDelayTask = task.delay(v24.props.IncrementalTextSearchDelay / 1000, function() --[[ Line: 168 ]]
                -- upvalues: v24 (ref)
                if v24.isMounted then
                    v24.searchDelayTask = nil;
                    v24.requestSearch();
                end;
            end);
        end;
    end;
    v24.onTextChanged = function(v29) --[[ Line: 179 ]]
        -- upvalues: v4 (ref), v1 (ref), v24 (copy)
        if v4.isRoact17(v1) then
            v24:setState(function(v30) --[[ Line: 181 ]]
                -- upvalues: v29 (copy)
                if v30.text == v29 then
                    return;
                else
                    return {
                        text = v29
                    };
                end;
            end, function() --[[ Line: 189 ]]
                -- upvalues: v24 (ref)
                v24.startIncrementalTextSearch();
            end);
            return;
        else
            v24:setState(function(v31) --[[ Line: 193 ]]
                -- upvalues: v29 (copy)
                if v31.text == v29 then
                    return;
                else
                    return {
                        text = v29
                    };
                end;
            end);
            v24.startIncrementalTextSearch();
            return;
        end;
    end;
    v24.onTextBoxFocusGained = function() --[[ Line: 207 ]]
        -- upvalues: v24 (copy), v16 (ref)
        if v24.props.Disabled then
            return;
        else
            if v24.props.OnTextBoxFocusGained then
                v24.props.OnTextBoxFocusGained();
            end;
            if v16 then
                v24:setState({
                    isFocused = true
                });
                return;
            else
                v24:setStateAndStyleModifier({
                    isFocused = true
                });
                return;
            end;
        end;
    end;
    v24.onTextBoxFocusLost = function(v32) --[[ Line: 227 ]]
        -- upvalues: v19 (ref), v24 (copy)
        if v19() and v24.props.OnTextBoxFocusLost then
            v24.props.OnTextBoxFocusLost(v32);
        end;
        v24:onFocusLost(v32);
    end;
    v24.onClearButtonClicked = function() --[[ Line: 237 ]]
        -- upvalues: v24 (copy), v16 (ref), v4 (ref), v1 (ref), v22 (ref)
        if v24.props.Disabled then
            return;
        elseif v16 then
            v24:setState({
                text = "", 
                isFocused = true, 
                shouldFocus = true
            }, if v4.isRoact17(v1) then if v22 then v24.requestSearch else v24.requestSearch() else nil);
            return;
        else
            v24:setStateAndStyleModifier({
                text = "", 
                isFocused = true, 
                shouldFocus = true
            }, if v4.isRoact17(v1) then if v22 then v24.requestSearch else v24.requestSearch() else nil);
            return;
        end;
    end;
    v24.onSearchButtonClicked = function() --[[ Line: 271 ]]
        -- upvalues: v24 (copy)
        if v24.props.Disabled then
            return;
        else
            v24.requestSearch();
            return;
        end;
    end;
end;
v23.didUpdate = function(v33, _, v35) --[[ Line: 280 ]] --[[ Name: didUpdate ]]
    if v33.props.OnTextChanged and v35.text ~= v33.state.text then
        v33.props.OnTextChanged(v33.state.text);
    end;
end;
if not v16 then
    v23.setStateAndStyleModifier = function(v36, v37, v38) --[[ Line: 291 ]] --[[ Name: setStateAndStyleModifier ]]
        -- upvalues: v8 (copy), v1 (copy), v4 (copy)
        v36:setState(function(v39) --[[ Line: 292 ]]
            -- upvalues: v37 (copy), v8 (ref), v1 (ref)
            local l_isFocused_0 = v37.isFocused;
            if l_isFocused_0 == nil then
                l_isFocused_0 = v39.isFocused;
            end;
            local l_isHovered_0 = v37.isHovered;
            if l_isHovered_0 == nil then
                l_isHovered_0 = v39.isHovered;
            end;
            if l_isFocused_0 or l_isHovered_0 then
                v37.StyleModifier = v8.Hover;
            else
                v37.StyleModifier = v1.None;
            end;
            return v37;
        end, if v4.isRoact17(v1) then v38 else nil);
    end;
end;
v23.getDerivedStateFromProps = function(v42, v43) --[[ Line: 314 ]] --[[ Name: getDerivedStateFromProps ]]
    local l_SearchTerm_0 = v42.SearchTerm;
    if l_SearchTerm_0 ~= (v43.lastSearchTermAsProp or "") then
        return {
            text = l_SearchTerm_0, 
            lastSearchTermAsProp = l_SearchTerm_0
        };
    else
        return {};
    end;
end;
v23.onFocusLost = function(v45, v46) --[[ Line: 337 ]] --[[ Name: onFocusLost ]]
    -- upvalues: v16 (copy)
    if v16 then
        v45:setState({
            isFocused = false, 
            shouldFocus = false
        });
    else
        v45:setStateAndStyleModifier({
            isFocused = false, 
            shouldFocus = false
        });
    end;
    if v46 then
        v45.requestSearch();
    end;
end;
v23.didMount = function(v47) --[[ Line: 355 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    v47.isMounted = true;
    if v20() and v47.props.ShouldFocusOnMount then
        v47:setState({
            shouldFocus = true
        });
    end;
end;
v23.willUnmount = function(v48) --[[ Line: 367 ]] --[[ Name: willUnmount ]]
    v48.isMounted = false;
end;
v23.render = function(v49) --[[ Line: 371 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v15 (copy), v17 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), l_prioritize_0 (copy), v1 (copy), v12 (copy), v21 (copy), v11 (copy), v14 (copy), v10 (copy), v18 (copy), v13 (copy)
    local l_props_0 = v49.props;
    local l_state_0 = v49.state;
    local l_Localization_0 = v49.props.Localization;
    local v53 = if v16 then l_props_0[v15.Tag] else nil;
    local v54 = if v16 then l_props_0.Style or {} else l_props_0.Stylizer;
    if v16 and typeof(v54) == "string" then
        v53 = v17(v53, v54);
        v54 = {};
    end;
    local l_ButtonWidth_0 = l_props_0.ButtonWidth;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Disabled_0 = l_props_0.Disabled;
    local v58 = l_props_0.PlaceholderText or l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "SearchBar", "Search");
    local l_ShowSearchButton_0 = l_props_0.ShowSearchButton;
    local l_ShowSearchIcon_0 = l_props_0.ShowSearchIcon;
    local l_OnInputBegan_0 = l_props_0.OnInputBegan;
    local l_OnInputEnded_0 = l_props_0.OnInputEnded;
    local l_ShowFilterButton_0 = l_props_0.ShowFilterButton;
    local l_SearchIsFiltered_0 = l_props_0.SearchIsFiltered;
    local l_shouldFocus_0 = l_state_0.shouldFocus;
    local l_text_0 = l_state_0.text;
    local v67 = #l_text_0 > 0;
    local l_isFocused_1 = l_state_0.isFocused;
    local l_isHovered_1 = l_state_0.isHovered;
    local v70 = l_prioritize_0(l_props_0.Size, v54.Size, UDim2.fromScale(1, 1));
    local v71 = l_prioritize_0(l_props_0.Width, v54.Width);
    if typeof(v71) == "number" then
        v70 = UDim2.new(UDim.new(0, v71), v70.Y);
    elseif typeof(v71) == "UDim" then
        v70 = UDim2.new(v71, v70.Y);
    end;
    local v72 = (if v67 then l_ButtonWidth_0 else 0) + (if l_ShowSearchButton_0 then l_ButtonWidth_0 + 1 else 0) + if l_ShowFilterButton_0 then l_ButtonWidth_0 else 0;
    local v73 = UDim2.new(0, l_ButtonWidth_0, 1, 0);
    if v16 then
        return v1.createElement(v12, {
            AnchorPoint = l_props_0.AnchorPoint, 
            AutomaticSize = if v21 then l_props_0.AutomaticSize else nil, 
            LayoutOrder = l_LayoutOrder_0, 
            LeadingComponent = if l_ShowSearchIcon_0 then v11 else nil, 
            LeadingComponentProps = if l_ShowSearchIcon_0 then {
                Size = UDim2.fromOffset(16, 16), 
                [v15.Tag] = "SearchIcon Icon16 Primary"
            } else nil, 
            OnInputBegan = l_OnInputBegan_0, 
            OnInputEnded = l_OnInputEnded_0, 
            OnTextChanged = v49.onTextChanged, 
            OnFocused = v49.onTextBoxFocusGained, 
            OnFocusLost = v49.onTextBoxFocusLost, 
            Position = l_props_0.Position, 
            Text = l_text_0, 
            TrailingComponent = v14, 
            TrailingComponentProps = {
                Disabled = l_Disabled_0, 
                OnClear = v49.onClearButtonClicked, 
                OnSearch = v49.onSearchButtonClicked, 
                OnSearchOptionsToggled = v49.props.OnSearchOptionsToggled, 
                ShowClearButton = v67, 
                ShowFilterButton = l_ShowFilterButton_0, 
                ShowSearchButton = l_ShowSearchButton_0, 
                SearchIsFiltered = l_SearchIsFiltered_0, 
                Size = UDim2.new(0, v72, 1, 0)
            }, 
            PlaceholderText = v58, 
            Width = v71, 
            [v15.Tag] = v17("Component-SearchBar", v53)
        });
    else
        local l_Padding_0 = v54.Padding;
        local v75 = type(l_Padding_0) == "table" and l_Padding_0.Left or l_Padding_0;
        local v76 = type(l_Padding_0) == "table" and l_Padding_0.Top or l_Padding_0;
        local v77 = if v54.Hover then if l_isFocused_1 or l_isHovered_1 then v54.Hover.BorderColor else nil else nil;
        local l_IconWidth_0 = v54.IconWidth;
        local l_IconColor_0 = v54.IconColor;
        local l_IconOffset_0 = v54.IconOffset;
        local l_TextSize_0 = v54.TextSize;
        return v1.createElement(v10, {
            Size = v70, 
            AutomaticSize = if v21 then l_props_0.AutomaticSize else nil, 
            ClipsDescendants = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            BorderColor = v77, 
            Style = "InputBox", 
            Position = l_props_0.Position, 
            AnchorPoint = l_props_0.AnchorPoint, 
            [v1.Event.MouseEnter] = v49.mouseEnter, 
            [v1.Event.MouseLeave] = v49.mouseLeave, 
            [v1.Event.InputBegan] = v49.onBackgroundInputBegan, 
            [v1.Event.InputEnded] = v49.onBackgroundFocusLost
        }, {
            Input = v1.createElement(v10, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Spacing = l_IconOffset_0, 
                Padding = if v18() then {
                    Bottom = 0, 
                    Left = l_IconOffset_0, 
                    Right = l_IconOffset_0, 
                    Top = 0
                } else l_IconOffset_0
            }, {
                SearchIcon = l_ShowSearchIcon_0 and v1.createElement(v10, {
                    Size = UDim2.fromOffset(l_IconWidth_0, l_IconWidth_0), 
                    ScaleType = Enum.ScaleType.Fit, 
                    LayoutOrder = 1, 
                    Style = {
                        Image = v54.SearchIcon, 
                        Background = l_IconColor_0
                    }
                }), 
                TextInput = v1.createElement(v13, {
                    Enabled = not l_Disabled_0, 
                    Position = UDim2.new(0, v75, 0.5, 0), 
                    Size = UDim2.new(1, -(v72 + v75 * 2), 1, -2 * v76), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    LayoutOrder = 2, 
                    PlaceholderText = v58, 
                    Text = l_text_0, 
                    TextSize = l_TextSize_0, 
                    OnInputBegan = l_OnInputBegan_0, 
                    OnInputEnded = l_OnInputEnded_0, 
                    OnTextChanged = v49.onTextChanged, 
                    OnFocusGained = v49.onTextBoxFocusGained, 
                    OnFocusLost = v49.onTextBoxFocusLost, 
                    ShouldFocus = l_shouldFocus_0
                })
            }), 
            Buttons = v1.createElement(v14, {
                ButtonSize = v73, 
                Disabled = l_Disabled_0, 
                OnClear = v49.onClearButtonClicked, 
                OnSearch = v49.onSearchButtonClicked, 
                OnSearchOptionsToggled = v49.props.OnSearchOptionsToggled, 
                ShowClearButton = v67, 
                ShowFilterButton = l_ShowFilterButton_0, 
                ShowSearchButton = l_ShowSearchButton_0, 
                SearchIsFiltered = l_SearchIsFiltered_0, 
                Size = UDim2.new(0, v72, 1, 0), 
                Style = v54.Buttons
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = v2.Localization, 
    Stylizer = if v16 then nil else v2.Stylizer
})(v23));