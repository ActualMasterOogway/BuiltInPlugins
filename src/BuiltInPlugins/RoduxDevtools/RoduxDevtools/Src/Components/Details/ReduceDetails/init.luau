local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_pretty_0 = require(l_Parent_0.Packages.Dash).pretty;
local v5 = require(l_Parent_0.Src.Util.diff);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Separator_0 = l_UI_0.Separator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Tabs_0 = l_UI_0.Tabs;
local v19 = require(script.Parent.Parent.LongText);
local v20 = require(script.Parent.Parent.Parent.Util.counter)();
local function v24(v21) --[[ Line: 51 ]] --[[ Name: TextPlaceholder ]]
    -- upvalues: v2 (copy)
    local v22 = {};
    for v23 = 1, v21.LineCount or 5 do
        v22[v23] = v2.createElement("Frame", {
            Size = UDim2.fromOffset(math.random(50, 400), 16), 
            BackgroundTransparency = 0.85, 
            BackgroundColor3 = Color3.new(0, 0, 0)
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.Name, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 8)
        }), 
        Placeholders = v2.createElement(v2.Fragment, nil, v22)
    });
end;
local function v26(v25) --[[ Line: 82 ]] --[[ Name: ActionSectionHeader ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_IconButton_0 (copy)
    return v2.createElement(l_Pane_0, {
        Size = v25.Size, 
        Position = v25.Position, 
        LayoutOrder = v25.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        ToggleAction = v2.createElement(l_IconButton_0, {
            Size = UDim2.fromScale(0, 1), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundStyle = "None", 
            LeftIcon = v25.IsUndone and "rbxasset://textures/RoduxDevtools/Redo.png" or "rbxasset://textures/RoduxDevtools/Undo.png", 
            Text = if v25.IsUndone then v25.Localization:getText("ReduceDetails", "ToggleAction.RedoText") else v25.Localization:getText("ReduceDetails", "ToggleAction.UndoText"), 
            TooltipText = if v25.IsDevtools then v25.Localization:getText("ReduceDetails", "ToggleAction.IsDevtools") else if v25.IsUndone then v25.Localization:getText("ReduceDetails", "ToggleAction.RedoTooltip") else v25.Localization:getText("ReduceDetails", "ToggleAction.UndoTooltip"), 
            Disabled = v25.IsDevtools, 
            OnClick = v25.OnToggleActionClick
        })
    });
end;
local function v28(v27) --[[ Line: 111 ]] --[[ Name: StateSectionHeader ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), l_Tabs_0 (copy)
    return v2.createElement(l_Pane_0, {
        Size = v27.Size, 
        Position = v27.Position, 
        LayoutOrder = v27.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        SetState = v2.createElement(l_IconButton_0, {
            LayoutOrder = -1, 
            Size = UDim2.fromScale(0, 1), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundStyle = "None", 
            LeftIcon = "rbxasset://textures/RoduxDevtools/SetState.png", 
            Text = v27.Localization:getText("ReduceDetails", "SetState.Text"), 
            TooltipText = v27.Localization:getText("ReduceDetails", "SetState.Tooltip"), 
            OnClick = v27.OnSetStateClick
        }), 
        Tabs = v2.createElement(l_Tabs_0, {
            Tabs = v27.Tabs, 
            SelectedTab = v27.Selected, 
            OnTabSelected = v27.OnTabSelected
        })
    });
end;
local v29 = v2.PureComponent:extend("ReduceDetails");
v29.init = function(v30) --[[ Line: 140 ]] --[[ Name: init ]]
    v30.stateTabs = {
        {
            Icon = "rbxasset://textures/RoduxDevtools/StateTabs/Diff.png", 
            Label = "Diff", 
            Tooltip = "The changes in state as a result of the reduced action"
        }, 
        {
            Icon = "rbxasset://textures/RoduxDevtools/StateTabs/Full.png", 
            Label = "Full", 
            Tooltip = "The full state after the action was reduced"
        }
    };
    v30.setStateTab = function(v31) --[[ Line: 154 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            selectedStateTab = v31
        });
    end;
    v30:setState({
        summaryExpanded = true, 
        actionExpanded = true, 
        stateExpanded = true, 
        selectedStateTab = v30.stateTabs[1], 
        diffText = nil, 
        fullText = nil, 
        actionText = nil
    });
end;
v29.didMount = function(v32) --[[ Line: 172 ]] --[[ Name: didMount ]]
    v32.stateTabs[1].Label = v32.props.Localization:getText("ReduceDetails", "StateTab.Diff.Label");
    v32.stateTabs[1].Tooltip = v32.props.Localization:getText("ReduceDetails", "StateTab.Diff.Tooltip");
    v32.stateTabs[2].Label = v32.props.Localization:getText("ReduceDetails", "StateTab.Full.Label");
    v32.stateTabs[2].Tooltip = v32.props.Localization:getText("ReduceDetails", "StateTab.Full.Tooltip");
    task.defer(function() --[[ Line: 179 ]]
        -- upvalues: v32 (copy)
        v32:computeText();
    end);
end;
v29.computeText = function(v33) --[[ Line: 184 ]] --[[ Name: computeText ]]
    -- upvalues: l_pretty_0 (copy), v5 (copy)
    local l_props_0 = v33.props;
    local l_state_0 = v33.state;
    local l_Event_0 = l_props_0.Event;
    if not l_Event_0 then
        return;
    elseif l_Event_0.isStub then
        return;
    else
        local l_props_1 = l_Event_0.props;
        local v38 = {};
        if l_state_0.selectedStateTab == v33.stateTabs[1] then
            v38[1] = "diff";
            v38[2] = "full";
        else
            v38[1] = "full";
            v38[2] = "diff";
        end;
        if l_state_0.actionExpanded then
            table.insert(v38, 1, "action");
        else
            v38[3] = "action";
        end;
        for _, v40 in v38 do
            if v33.props.Event ~= l_Event_0 then
                return;
            else
                if v40 == "action" then
                    v33:setState({
                        actionText = l_pretty_0(l_props_1.action, {
                            depth = 100, 
                            multiline = true, 
                            maxLineLength = 100, 
                            indent = "  "
                        })
                    });
                elseif v40 == "diff" then
                    v33:setState({
                        diffText = if l_props_1.lastState ~= nil then v5(l_props_1.lastState, l_props_1.state) else v33.props.Localization:getText("ReduceDetails", "NoPriorState")
                    });
                elseif v40 == "full" then
                    v33:setState({
                        fullText = l_pretty_0(l_props_1.state, {
                            depth = 100, 
                            multiline = true, 
                            maxLineLength = 100, 
                            indent = "  "
                        })
                    });
                end;
                task.wait(0.03333333333333333);
            end;
        end;
        return;
    end;
end;
v29.didUpdate = function(v41, v42) --[[ Line: 253 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    if v41.props.Event ~= v42.Event then
        v41:setState({
            diffText = v2.None, 
            fullText = v2.None, 
            actionText = v2.None
        });
        task.defer(function() --[[ Line: 262 ]]
            -- upvalues: v41 (copy)
            v41:computeText();
        end);
    end;
end;
v29.render = function(v43) --[[ Line: 268 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy), l_ExpandablePane_0 (copy), v20 (copy), l_TextLabel_0 (copy), l_Separator_0 (copy), v26 (copy), v19 (copy), v24 (copy), v28 (copy)
    local l_Event_1 = v43.props.Event;
    if not l_Event_1 then
        return nil;
    else
        local l_props_2 = l_Event_1.props;
        local v46 = if v43.state.selectedStateTab == v43.stateTabs[1] then v43.state.diffText else v43.state.fullText;
        local l_actionText_0 = v43.state.actionText;
        local v48 = false;
        if l_Event_1.altered ~= nil then
            v48 = l_Event_1.altered.skipped == true;
        end;
        local v49 = l_props_2.isDevtools == true;
        return v2.createElement(l_Pane_0, nil, {
            ReduceDetails = v2.createElement(l_ScrollingFrame_0, {
                Size = UDim2.fromScale(1, 1), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = UDim.new(0, 5)
            }, {
                SummaryInfo = v2.createElement(l_ExpandablePane_0, {
                    Style = "Section", 
                    LayoutOrder = v20(), 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Text = v43.props.Localization:getText("ReduceDetails", "SummaryTitle"), 
                    ContentPadding = 5, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Expanded = v43.state.summaryExpanded, 
                    OnExpandedChanged = function() --[[ Line: 300 ]] --[[ Name: OnExpandedChanged ]]
                        -- upvalues: v43 (copy)
                        v43:setState(function(v50) --[[ Line: 301 ]]
                            return {
                                summaryExpanded = not v50.summaryExpanded
                            };
                        end);
                    end
                }, {
                    SummaryLabel = v2.createElement(l_TextLabel_0, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Text = if l_Event_1.isStub then v43.props.Localization:getText("Common", "LoadingStub") else v43.props.Localization:getText("ReduceDetails", "Summary", {
                            action = l_props_2.action.type, 
                            elapsed = l_props_2.elapsedMs, 
                            timestamp = DateTime.fromUnixTimestampMillis(l_Event_1.timestamp):FormatLocalTime("h:mm:ss.SSS a", "en-us"), 
                            source = l_Event_1.source
                        })
                    })
                }), 
                SummarySeparator = v2.createElement(l_Separator_0, {
                    LayoutOrder = v20()
                }), 
                ActionInfo = v2.createElement(l_ExpandablePane_0, {
                    Style = "Section", 
                    LayoutOrder = v20(), 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Text = v43.props.Localization:getText("ReduceDetails", "ActionTitle"), 
                    ContentPadding = 5, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Expanded = v43.state.actionExpanded, 
                    OnExpandedChanged = function() --[[ Line: 336 ]] --[[ Name: OnExpandedChanged ]]
                        -- upvalues: v43 (copy)
                        v43:setState(function(v51) --[[ Line: 337 ]]
                            return {
                                actionExpanded = not v51.actionExpanded
                            };
                        end);
                    end, 
                    HeaderComponent = v26, 
                    HeaderComponentProps = {
                        Localization = v43.props.Localization, 
                        IsUndone = v48, 
                        IsDevtools = v49, 
                        OnToggleActionClick = function() --[[ Line: 349 ]] --[[ Name: OnToggleActionClick ]]
                            -- upvalues: v49 (copy), v48 (copy), v43 (copy)
                            if v49 then
                                return;
                            elseif v48 then
                                if not v43.props.OnRedoAction then
                                    return;
                                else
                                    v43.props.OnRedoAction(v43.props.SelectedIndex);
                                    return;
                                end;
                            elseif not v43.props.OnUndoAction then
                                return;
                            else
                                v43.props.OnUndoAction(v43.props.SelectedIndex);
                                return;
                            end;
                        end
                    }
                }, {
                    ActionLabel = if l_actionText_0 ~= nil then v2.createElement(v19, {
                        MaxHeight = 300, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Font = Enum.Font.RobotoMono, 
                        Text = l_actionText_0
                    }) else v2.createElement(v24, {
                        LineCount = 5
                    })
                }), 
                ActionSeparator = v2.createElement(l_Separator_0, {
                    LayoutOrder = v20()
                }), 
                StateInfo = v2.createElement(l_ExpandablePane_0, {
                    Style = "Section", 
                    LayoutOrder = v20(), 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Text = v43.props.Localization:getText("ReduceDetails", "StateTitle"), 
                    ContentPadding = 5, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Expanded = v43.state.stateExpanded, 
                    OnExpandedChanged = function() --[[ Line: 390 ]] --[[ Name: OnExpandedChanged ]]
                        -- upvalues: v43 (copy)
                        v43:setState(function(v52) --[[ Line: 391 ]]
                            return {
                                stateExpanded = not v52.stateExpanded
                            };
                        end);
                    end, 
                    HeaderComponent = v28, 
                    HeaderComponentProps = {
                        Localization = v43.props.Localization, 
                        Tabs = v43.stateTabs, 
                        Selected = v43.state.selectedStateTab, 
                        OnTabSelected = v43.setStateTab, 
                        OnSetStateClick = function() --[[ Line: 404 ]] --[[ Name: OnSetStateClick ]]
                            -- upvalues: v43 (copy)
                            if not v43.props.OnSetState then
                                return;
                            else
                                v43.props.OnSetState(v43.props.SelectedIndex);
                                return;
                            end;
                        end
                    }
                }, {
                    StateLabel = if v46 ~= nil then v2.createElement(v19, {
                        MaxHeight = 400, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Font = Enum.Font.RobotoMono, 
                        Text = v46, 
                        RichText = true
                    }) else v2.createElement(v24, {
                        LineCount = v43.state.selectedStateTab == v43.stateTabs[1] and 10 or 30
                    })
                })
            })
        });
    end;
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v29));