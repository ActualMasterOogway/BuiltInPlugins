local l_script_FirstAncestor_0 = script:FindFirstAncestor("FindReplaceAll");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_IconButton_0 = v2.UI.IconButton;
local l_SearchBar_0 = v2.UI.SearchBar;
local l_TextInput_0 = v2.UI.TextInput;
local v6 = require(l_script_FirstAncestor_0.Src.Components.CheckButton);
local v7 = v2.Util.LayoutOrderIterator.new();
local l_Localization_0 = v2.ContextServices.Localization;
local l_joinTags_0 = v2.Styling.joinTags;
local v10 = require(l_script_FirstAncestor_0.Src.Resources.StyleConstants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v12) --[[ Line: 35 ]] --[[ Name: WidgetHeader ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v10 (copy), l_joinTags_0 (copy), v7 (copy), v6 (copy), l_SearchBar_0 (copy), l_TextInput_0 (copy), l_IconButton_0 (copy)
    local v13 = l_Localization_0:use();
    local v14, v15 = v1.useState(false);
    local v16, v17 = v1.useState(false);
    local v18, v19 = v1.useState(v12.DefaultSearchTerm or "");
    local v20, v21 = v1.useState(v12.DefaultReplaceTerm or "");
    local v22, v23 = v1.useState(false);
    local v24, v25 = v1.useState(false);
    local v26, v27 = v1.useState(false);
    local v28, v29 = v1.useState(v12.DefaultFilterPath or "");
    local v30, v31 = v1.useState(v10.widgetHeaderHeight);
    local v32 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v10 (ref), v14 (copy), v16 (copy), v31 (copy)
        local l_widgetHeaderHeight_0 = v10.widgetHeaderHeight;
        if not v14 then
            l_widgetHeaderHeight_0 = l_widgetHeaderHeight_0 - v10.widgetHeaderLineHeight;
        end;
        if not v16 then
            l_widgetHeaderHeight_0 = l_widgetHeaderHeight_0 - 2 * v10.widgetHeaderLineHeight;
        end;
        v31(l_widgetHeaderHeight_0);
    end, {
        v14, 
        v16
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0(v12[v1.Tag], "Component-WidgetHeader", "X-Column"), 
        LayoutOrder = v12.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v30)
    }, {
        FindLine = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("FindLine", "X-Transparent"), 
            LayoutOrder = v7:getNextOrder()
        }, {
            ToggleShowReplaceButton = v1.createElement(v6, {
                [v1.Tag] = "ToggleButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = v14, 
                onClick = function(v34) --[[ Line: 75 ]] --[[ Name: onClick ]]
                    -- upvalues: v15 (copy)
                    print("Expand Replace clicked");
                    v15(v34);
                end, 
                tooltipText = v13:getText("WidgetHeader", "ToggleReplaceTooltip")
            }), 
            FindInput = v1.createElement(l_SearchBar_0, {
                [v1.Tag] = "SearchBar", 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                LayoutOrder = v7:getNextOrder(), 
                SearchTerm = v18, 
                OnTextChanged = function(v35) --[[ Line: 87 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v19 (copy), v12 (copy)
                    print((("Search Text changed: %*"):format(v35)));
                    v19(v35);
                    v12.OnFindExpressionUpdated(v35);
                end, 
                OnSearchRequested = function(v36) --[[ Line: 92 ]] --[[ Name: OnSearchRequested ]]
                    -- upvalues: v18 (copy), v12 (copy), v20 (copy), v28 (copy), v22 (copy), v24 (copy), v26 (copy), v14 (copy), v16 (copy)
                    print((("Search requested searchTerm=%* findExpression=%*"):format(v36, v18)));
                    v12.OnFindTriggered({
                        FindExpression = v18, 
                        ReplaceExpression = v20, 
                        FilterExpression = v28, 
                        IsMatchCase = v22, 
                        IsMatchWholeWord = v24, 
                        IsUseRegex = v26, 
                        IsReplaceMode = v14, 
                        IsFilterMode = v16
                    });
                end, 
                PlaceholderText = v13:getText("WidgetHeader", "FindElpPlaceholder"), 
                ref = v32
            }), 
            MatchCaseCheckButton = v1.createElement(v6, {
                [v1.Tag] = "CheckButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = v22, 
                onClick = function(v37) --[[ Line: 113 ]] --[[ Name: onClick ]]
                    -- upvalues: v23 (copy)
                    print("Match case toggle clicked");
                    v23(v37);
                end, 
                tooltipText = v13:getText("WidgetHeader", "MatchCaseTooltip")
            }), 
            MatchWholeWordCheckButton = v1.createElement(v6, {
                [v1.Tag] = "CheckButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = v24, 
                onClick = function(v38) --[[ Line: 123 ]] --[[ Name: onClick ]]
                    -- upvalues: v25 (copy)
                    print("Match word toggle clicked");
                    v25(v38);
                end, 
                tooltipText = v13:getText("WidgetHeader", "MatchWholeWordTooltip")
            }), 
            MatchRegExCheckButton = v1.createElement(v6, {
                [v1.Tag] = "CheckButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = v26, 
                onClick = function(v39) --[[ Line: 133 ]] --[[ Name: onClick ]]
                    -- upvalues: v27 (copy)
                    print("Match regex toggle clicked");
                    v27(v39);
                end, 
                tooltipText = v13:getText("WidgetHeader", "RegExTooltip")
            }), 
            FindPreviousButton = v1.createElement(v6, {
                [v1.Tag] = "PushButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = false, 
                onClick = function(_) --[[ Line: 144 ]] --[[ Name: onClick ]]
                    -- upvalues: v12 (copy), v18 (copy), v20 (copy), v28 (copy), v22 (copy), v24 (copy), v26 (copy), v14 (copy), v16 (copy)
                    print("Find previous clicked");
                    v12.OnFindPreviousTriggered({
                        FindExpression = v18, 
                        ReplaceExpression = v20, 
                        FilterExpression = v28, 
                        IsMatchCase = v22, 
                        IsMatchWholeWord = v24, 
                        IsUseRegex = v26, 
                        IsReplaceMode = v14, 
                        IsFilterMode = v16
                    });
                end, 
                tooltipText = v13:getText("WidgetHeader", "FindPreviousTooltip")
            }), 
            FindNextButton = v1.createElement(v6, {
                [v1.Tag] = "PushButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = false, 
                onClick = function(_) --[[ Line: 163 ]] --[[ Name: onClick ]]
                    -- upvalues: v12 (copy), v18 (copy), v20 (copy), v28 (copy), v22 (copy), v24 (copy), v26 (copy), v14 (copy), v16 (copy)
                    print("Find next clicked");
                    v12.OnFindNextTriggered({
                        FindExpression = v18, 
                        ReplaceExpression = v20, 
                        FilterExpression = v28, 
                        IsMatchCase = v22, 
                        IsMatchWholeWord = v24, 
                        IsUseRegex = v26, 
                        IsReplaceMode = v14, 
                        IsFilterMode = v16
                    });
                end, 
                tooltipText = v13:getText("WidgetHeader", "FindNextTooltip")
            }), 
            ToggleFilterButton = v1.createElement(v6, {
                [v1.Tag] = "CheckButton", 
                LayoutOrder = v7:getNextOrder(), 
                isChecked = v16, 
                onClick = function(v42) --[[ Line: 183 ]] --[[ Name: onClick ]]
                    -- upvalues: v17 (copy)
                    print("Filter toggle clicked", v42);
                    v17(v42);
                end, 
                tooltipText = v13:getText("WidgetHeader", "FilterTooltip")
            })
        }), 
        ReplaceLine = if v14 then v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("ReplaceLine", "X-Transparent"), 
            LayoutOrder = v7:getNextOrder()
        }, {
            ReplaceInput = v1.createElement(l_TextInput_0, {
                [v1.Tag] = "ReplaceInput", 
                LayoutOrder = v7:getNextOrder(), 
                Text = v20, 
                PlaceholderText = v13:getText("WidgetHeader", "ReplaceElpPlaceholder"), 
                OnTextChanged = function(v43) --[[ Line: 201 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v21 (copy), v12 (copy)
                    print((("Replace Text changed: %*"):format(v43)));
                    v21(v43);
                    v12.OnReplaceExpressionUpdated(v43);
                end
            }), 
            ReplaceButton = v1.createElement(l_IconButton_0, {
                [v1.Tag] = "ReplaceButton Compact", 
                LayoutOrder = v7:getNextOrder(), 
                Text = v13:getText("WidgetHeader", "Replace"), 
                OnClick = function() --[[ Line: 212 ]] --[[ Name: OnClick ]]
                    -- upvalues: v12 (copy), v18 (copy), v20 (copy), v28 (copy), v22 (copy), v24 (copy), v26 (copy), v14 (copy), v16 (copy)
                    print("Replace clicked");
                    v12.OnReplaceTriggered({
                        FindExpression = v18, 
                        ReplaceExpression = v20, 
                        FilterExpression = v28, 
                        IsMatchCase = v22, 
                        IsMatchWholeWord = v24, 
                        IsUseRegex = v26, 
                        IsReplaceMode = v14, 
                        IsFilterMode = v16
                    });
                end, 
                Tooltip = v13:getText("WidgetHeader", "ReplaceTooltip")
            }), 
            ReplaceAllButton = v1.createElement(l_IconButton_0, {
                [v1.Tag] = "ReplaceAllButton Compact", 
                LayoutOrder = v7:getNextOrder(), 
                Text = v13:getText("WidgetHeader", "ReplaceAll"), 
                OnClick = function() --[[ Line: 231 ]] --[[ Name: OnClick ]]
                    -- upvalues: v12 (copy), v18 (copy), v20 (copy), v28 (copy), v22 (copy), v24 (copy), v26 (copy), v14 (copy), v16 (copy)
                    print("Replace All clicked");
                    v12.OnReplaceAllTriggered({
                        FindExpression = v18, 
                        ReplaceExpression = v20, 
                        FilterExpression = v28, 
                        IsMatchCase = v22, 
                        IsMatchWholeWord = v24, 
                        IsUseRegex = v26, 
                        IsReplaceMode = v14, 
                        IsFilterMode = v16
                    });
                end, 
                Tooltip = v13:getText("WidgetHeader", "ReplaceAllTooltip")
            })
        }) else nil, 
        FilterLine = if v16 then v1.createElement("Frame", {
            [v1.Tag] = "FilterLine X-Transparent", 
            LayoutOrder = v7:getNextOrder()
        }, {
            FilterLabel = v1.createElement("TextLabel", {
                [v1.Tag] = "FilterLabel X-Transparent", 
                LayoutOrder = v7:getNextOrder(), 
                Text = v13:getText("WidgetHeader", "FilterLabel")
            }), 
            FilterInput = v1.createElement(l_TextInput_0, {
                [v1.Tag] = "FilterInput", 
                LayoutOrder = v7:getNextOrder(), 
                PlaceholderText = v13:getText("WidgetHeader", "FilterPlaceholder"), 
                Text = v28, 
                OnTextChanged = function(v44) --[[ Line: 264 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: v29 (copy)
                    print((("Filter Text changed: %*"):format(v44)));
                    v29(v44);
                end
            })
        }) else nil
    });
end;