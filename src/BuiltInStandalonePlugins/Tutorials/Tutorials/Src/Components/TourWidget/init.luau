local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Src.Flags.getFFlagTutorialsFixTextLayout)();
local v4 = require(l_Parent_0.Src.Flags.getFFlagTutorialsHideNavInPlaytest)();
local v5 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseFinishTextOnLastStep)();
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local _ = require(l_Parent_0.Src.Util.TutorialTypes);
local l_UI_0 = v6.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_IconButton_0 = l_UI_0.IconButton;
local l_PaginationDots_0 = l_UI_0.PaginationDots;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v20 = require(l_Parent_0.Src.Components.Compliment);
local v21 = require(l_Parent_0.Src.Components.HintKeys);
local v22 = require(l_Parent_0.Src.Util.counter);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local l_insert_0 = table.insert;
local v25 = v2.PureComponent:extend("TourWidget");
v25.init = function(v26) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_join_0 (copy)
    v26.state = {
        showTopics = false, 
        jumpToTopic = nil
    };
    v26.windowRef = v2.createRef();
    v26.complimentRef = v2.createRef();
    v26.lastSize = nil;
    v26.onToggleTopics = function() --[[ Line: 63 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            showTopics = not v26.state.showTopics
        });
    end;
    v26.onSelectTopic = function(v27) --[[ Line: 68 ]]
        -- upvalues: v26 (copy), v2 (ref)
        if v27 < v26.props.StepData.topic then
            v26.props.OnSelectTopic(v27);
            v26:setState({
                showTopics = false, 
                jumpToTopic = v2.None
            });
            return;
        else
            v26:setState({
                jumpToTopic = v27
            });
            return;
        end;
    end;
    v26.onJumpDialogAction = function(v28) --[[ Line: 81 ]]
        -- upvalues: v26 (copy), v2 (ref)
        if v28 == "accept" then
            local l_jumpToTopic_0 = v26.state.jumpToTopic;
            v26.props.OnSelectTopic(l_jumpToTopic_0);
            v26:setState({
                showTopics = false, 
                jumpToTopic = v2.None
            });
            return;
        else
            v26:setState({
                jumpToTopic = v2.None
            });
            return;
        end;
    end;
    v26.onAbsoluteSizeChanged = function() --[[ Line: 96 ]]
        -- upvalues: v26 (copy), l_join_0 (ref)
        local v30 = nil;
        local v31 = 0;
        if v26.complimentRef.current ~= nil then
            v30 = v26.complimentRef;
        else
            v30 = v26.windowRef;
            v31 = 275;
        end;
        if not v30.current then
            return;
        else
            if v26.lastSize ~= v30.current.AbsoluteSize then
                local l_AbsoluteSize_0 = v30.current.AbsoluteSize;
                l_AbsoluteSize_0 = Vector2.new(math.max(v31, l_AbsoluteSize_0.X), l_AbsoluteSize_0.Y);
                local l_props_0 = v26.props;
                local l_Plugin_0 = l_props_0.Plugin;
                local l_l_Plugin_0_Uri_0 = l_Plugin_0:GetUri();
                local l_Widget_0 = l_props_0.Widget;
                local v37 = l_join_0(l_l_Plugin_0_Uri_0, {
                    Category = "Panels", 
                    ItemId = l_Widget_0.Name
                });
                l_Plugin_0:GetPluginComponent("Panels"):SetSizeAsync(v37, l_AbsoluteSize_0);
            end;
            return;
        end;
    end;
end;
v25.getTopicList = function(v38, v39) --[[ Line: 125 ]] --[[ Name: getTopicList ]]
    -- upvalues: v22 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_IconButton_0 (copy), l_insert_0 (copy)
    local l_props_1 = v38.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local v43 = {};
    local v44 = v22();
    local l_StepData_0 = l_props_1.StepData;
    for v46, v47 in l_StepData_0.topics do
        local v48 = v46 == v39;
        local v49 = if v48 then l_Stylizer_1.SelectedTopicTextColor else l_Stylizer_1.TopicTextColor;
        l_insert_0(v43, v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = l_Stylizer_1.PaddingSmall, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.CircleSize + l_Stylizer_1.PaddingSmall)
        }, {
            Number = v2.createElement(l_Pane_0, {
                BackgroundColor3 = l_Stylizer_1.CircleColor, 
                Padding = l_Stylizer_1.PaddingSmall, 
                Size = UDim2.fromOffset(l_Stylizer_1.CircleSize, l_Stylizer_1.CircleSize)
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Stylizer_1.CircleSize)
                }), 
                Text = v2.createElement(l_TextLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Font = Enum.Font.SourceSansBold, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Text = ("%d"):format(v46), 
                    TextColor = v49
                })
            }), 
            Title = v2.createElement(l_IconButton_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Cursor = if v48 then nil else "PointingHand", 
                Disabled = v48, 
                DisabledTextColor = v49, 
                OnClick = function() --[[ Line: 167 ]] --[[ Name: OnClick ]]
                    -- upvalues: v38 (copy), v46 (copy)
                    v38.onSelectTopic(v46);
                end, 
                LayoutOrder = v44(), 
                Style = "IconOnly", 
                Text = l_Localization_1:getText(l_StepData_0.id, "topic_" .. v47), 
                TextColor = v49
            })
        }));
    end;
    return v43;
end;
v25.render = function(v50) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), v2 (copy), l_DockWidget_0 (copy), v20 (copy), l_StyledDialog_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_2 = v50.props;
    local l_state_0 = v50.state;
    local v53 = v22();
    local l_Stylizer_2 = l_props_2.Stylizer;
    local l_Localization_2 = l_props_2.Localization;
    local l_StepData_1 = l_props_2.StepData;
    if not l_StepData_1 then
        return nil;
    else
        local l_step_0 = l_StepData_1.step;
        if not l_step_0 then
            return nil;
        else
            local v58 = l_step_0.kind == "Completed";
            local v59 = l_step_0.kind == "Skipped";
            local v60 = v58 or v59;
            return v2.createElement(l_DockWidget_0, {
                ShouldRestore = true, 
                Title = l_props_2.Widget.Name, 
                Widget = l_props_2.Widget
            }, {
                Window = if v60 then v2.createElement(v20, {
                    IconSize = l_Stylizer_2.IconSize, 
                    Image = l_Stylizer_2.CheckmarkImage, 
                    LayoutOrder = v53(), 
                    Text = if v59 then l_step_0.description else l_Localization_2:getText(l_StepData_1.id, ("%s_Compliment"):format(l_step_0.id)), 
                    PaneRef = v50.complimentRef, 
                    [v2.Change.AbsoluteSize] = v50.onAbsoluteSizeChanged
                }) else v50:renderWindow(), 
                Dialog = v2.createElement(l_StyledDialog_0, {
                    Buttons = {
                        {
                            Key = "accept", 
                            Text = l_Localization_2:getText("Tutorial", "Skip")
                        }, 
                        {
                            Key = "cancel", 
                            Text = l_Localization_2:getText("Tutorial", "Back")
                        }
                    }, 
                    Enabled = l_state_0.jumpToTopic ~= nil, 
                    MinContentSize = Vector2.new(450, 100), 
                    Modal = true, 
                    OnClose = v50.onJumpDialogAction, 
                    OnButtonPressed = v50.onJumpDialogAction, 
                    Size = UDim2.fromOffset(450, 100), 
                    Style = "AcceptCancel", 
                    Title = l_Localization_2:getText(l_StepData_1.id, "Title")
                }, {
                    Content = v2.createElement(l_Pane_0, {
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Layout = Enum.FillDirection.Vertical, 
                        Spacing = 20
                    }, {
                        Title = v2.createElement(l_TextLabel_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            LayoutOrder = v53(), 
                            Style = "Title", 
                            Text = l_Localization_2:getText("SkipDialog", "Title"), 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        Text = v2.createElement(l_TextLabel_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = v53(), 
                            Size = UDim2.fromScale(1, 0), 
                            Text = l_Localization_2:getText("SkipDialog", "Text"), 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    })
                })
            });
        end;
    end;
end;
v25.renderWindow = function(v61) --[[ Line: 258 ]] --[[ Name: renderWindow ]]
    -- upvalues: v22 (copy), v2 (copy), l_Pane_0 (copy), v3 (copy), l_TextLabel_0 (copy), l_RunService_0 (copy), v4 (copy), l_IconButton_0 (copy), l_Separator_0 (copy), v21 (copy), l_PaginationDots_0 (copy), v5 (copy)
    local l_props_3 = v61.props;
    local l_state_1 = v61.state;
    local v64 = v22();
    local l_StepData_2 = l_props_3.StepData;
    local l_step_1 = l_StepData_2.step;
    local l_Stylizer_3 = l_props_3.Stylizer;
    local l_Localization_3 = l_props_3.Localization;
    local v69 = l_Localization_3:getText(l_StepData_2.id, "topic_" .. l_StepData_2.topics[l_StepData_2.topic]);
    local v70 = l_Localization_3:getText("Tutorial", "TopicNumber"):format(l_StepData_2.topic, #l_StepData_2.topics);
    local l_PressedKeys_0 = l_props_3.PressedKeys;
    local l_showNext_0 = l_StepData_2.showNext;
    local v73 = false;
    if l_StepData_2.topic == #l_StepData_2.topics then
        v73 = l_StepData_2.topicStep == l_StepData_2.topicStepCount;
    end;
    local v74 = false;
    if l_StepData_2.topic == 1 then
        v74 = l_StepData_2.topicStep == 1;
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = l_Stylizer_3.Padding, 
        Spacing = l_Stylizer_3.Padding, 
        Style = "Box", 
        ref = v61.windowRef, 
        [v2.Change.AbsoluteSize] = v61.onAbsoluteSizeChanged
    }, {
        Header = if v3 then v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_Stylizer_3.PaddingSmall, 
            LayoutOrder = v64()
        }, {
            Topbar = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v64()
            }, {
                TopicNumber = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromOffset(0, l_Stylizer_3.IconSize.Y.Offset + l_Stylizer_3.PaddingSmall), 
                    Text = v70, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Label"
                }), 
                Controls = v2.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromOffset(0, l_Stylizer_3.IconSize.Y.Offset + l_Stylizer_3.PaddingSmall), 
                    Position = UDim2.fromScale(1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Layout = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Spacing = l_Stylizer_3.PaddingSmall
                }, {
                    List = if not l_RunService_0:IsEdit() and v4 then nil else v2.createElement(l_IconButton_0, {
                        Cursor = "PointingHand", 
                        OnClick = v61.onToggleTopics, 
                        LayoutOrder = v64(), 
                        LeftIcon = if l_state_1.showTopics then l_Stylizer_3.ListSelectedImage else l_Stylizer_3.ListImage, 
                        Size = l_Stylizer_3.IconSize, 
                        Style = "IconOnly"
                    }), 
                    Close = v2.createElement(l_IconButton_0, {
                        Cursor = "PointingHand", 
                        OnClick = v61.props.OnQuit, 
                        LayoutOrder = v64(), 
                        LeftIcon = l_Stylizer_3.CloseImage, 
                        Size = l_Stylizer_3.IconSize, 
                        Style = "IconOnly"
                    })
                })
            }), 
            TopicName = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                LayoutOrder = v64(), 
                Text = v69, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Style = "Semibold"
            })
        }) else v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v64(), 
            Size = UDim2.fromScale(1, 0), 
            Spacing = l_Stylizer_3.PaddingSmall
        }, {
            CurrentTopic = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v64(), 
                Layout = Enum.FillDirection.Vertical, 
                Size = UDim2.new(1, -60, 0, 0), 
                Spacing = l_Stylizer_3.PaddingSmall
            }, {
                TopicNumber = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v64(), 
                    Text = v70, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Label"
                }), 
                TopicName = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v64(), 
                    Text = v69, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Semibold"
                })
            }), 
            List = if not l_RunService_0:IsEdit() and v4 then nil else v2.createElement(l_IconButton_0, {
                Cursor = "PointingHand", 
                OnClick = v61.onToggleTopics, 
                LayoutOrder = v64(), 
                LeftIcon = if l_state_1.showTopics then l_Stylizer_3.ListSelectedImage else l_Stylizer_3.ListImage, 
                Size = l_Stylizer_3.IconSize, 
                Style = "IconOnly"
            }), 
            Close = v2.createElement(l_IconButton_0, {
                Cursor = "PointingHand", 
                OnClick = v61.props.OnQuit, 
                LayoutOrder = v64(), 
                LeftIcon = l_Stylizer_3.CloseImage, 
                Size = l_Stylizer_3.IconSize, 
                Style = "IconOnly"
            })
        }), 
        Separator = v2.createElement(l_Separator_0, {
            LayoutOrder = v64()
        }), 
        Scroller = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v64(), 
            Padding = 0, 
            Spacing = UDim.new(0, l_Stylizer_3.Padding)
        }, if l_state_1.showTopics then v61:getTopicList(l_StepData_2.topic) else {
            StepTitle = if l_step_1.title then v2.createElement(l_TextLabel_0, {
                AutomaticSize = if v3 then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
                TextXAlignment = if v3 then Enum.TextXAlignment.Left else nil, 
                TextWrapped = v3 and true or nil, 
                Size = if v3 then UDim2.fromScale(1, 0) else nil, 
                LayoutOrder = v64(), 
                Style = "Title", 
                Text = l_step_1.title
            }) else nil, 
            StepDescription = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v64(), 
                RichText = true, 
                Size = UDim2.fromScale(1, 0), 
                Text = l_step_1.description, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Keys = if l_PressedKeys_0 then v2.createElement(v21, {
                LayoutOrder = v64(), 
                PressedKeys = l_PressedKeys_0
            }) else nil
        }), 
        NavigationRow = if not l_RunService_0:IsEdit() and v4 then nil else v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v64()
        }, {
            Back = if not v74 then v2.createElement(l_IconButton_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Cursor = "PointingHand", 
                OnClick = l_props_3.OnBack, 
                LayoutOrder = v64(), 
                Style = "Link", 
                Text = l_Localization_3:getText("Tutorial", "Back")
            }) else nil, 
            PaginationDots = v2.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Layout = Enum.FillDirection.Horizontal, 
                Position = UDim2.fromScale(0.5, 0.5), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                Child = v2.createElement(l_PaginationDots_0, {
                    Count = l_StepData_2.topicStepCount, 
                    OnSelected = function() --[[ Line: 468 ]] --[[ Name: OnSelected ]]

                    end, 
                    SelectedIndex = l_StepData_2.topicStep
                })
            }), 
            Next = v2.createElement(l_IconButton_0, {
                AnchorPoint = Vector2.new(1, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Cursor = "PointingHand", 
                LayoutOrder = v64(), 
                OnClick = l_props_3.OnNext, 
                Position = UDim2.fromScale(1, 0), 
                Style = (v73 and v5 or l_showNext_0) and "Primary" or "Link", 
                Text = if v73 and v5 then l_Localization_3:getText("Plugin", "Finish") else if l_showNext_0 then l_Localization_3:getText("Plugin", "Next") else l_Localization_3:getText("Tutorial", "Skip")
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v25));