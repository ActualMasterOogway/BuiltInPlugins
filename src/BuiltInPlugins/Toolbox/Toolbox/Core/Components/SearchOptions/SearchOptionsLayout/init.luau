local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.ModalContext);
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v12 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v13 = require(l_Packages_0.Dash);
local l_GetTextSize_0 = v4.Util.GetTextSize;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Button_0 = v4.UI.Button;
local l_HoverArea_0 = v4.UI.HoverArea;
local l_LinkText_0 = v4.UI.LinkText;
local l_Pane_0 = v4.UI.Pane;
local l_ShowOnTop_0 = v4.UI.ShowOnTop;
local l_ScrollingFrame_0 = v4.UI.ScrollingFrame;
local v23 = Vector2.new(17, 6);
local v24 = Color3.fromRGB(0, 0, 0);
local v25 = v7.TAB_WIDGET_HEIGHT + v7.HEADER_HEIGHT;
local v26 = v2.PureComponent:extend("SearchOptionsLayout");
v26.init = function(v27, _) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v27.state = {};
    v27.layoutRef = v2.createRef();
    v27.cancel = function() --[[ Line: 82 ]]
        -- upvalues: v27 (copy)
        v27.props.OnClose();
    end;
    v27.mouseEnter = function() --[[ Line: 87 ]]
        -- upvalues: v27 (copy)
        v27.props.Modal.onSearchOptionsMouse(true);
    end;
    v27.mouseLeave = function() --[[ Line: 92 ]]
        -- upvalues: v27 (copy)
        v27.props.Modal.onSearchOptionsMouse(false);
    end;
    v27.onReset = function() --[[ Line: 97 ]]
        -- upvalues: v27 (copy)
        v27.props.OnReset();
    end;
    v27.onSubmit = function() --[[ Line: 102 ]]
        -- upvalues: v27 (copy)
        local l_props_0 = v27.props;
        v27.search(l_props_0.GetSearchOptions());
    end;
    v27.search = function(v30) --[[ Line: 107 ]]
        -- upvalues: v27 (copy)
        local l_props_1 = v27.props;
        local l_networkInterface_0 = l_props_1.Network.networkInterface;
        local v33 = l_props_1.Settings:get("Plugin");
        l_props_1.searchWithOptions(l_networkInterface_0, v33, v30);
        v27.cancel();
    end;
    v27.updateContentsSize = function(v34) --[[ Line: 115 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            contentSize = v34
        });
    end;
end;
v26.render = function(v35) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), v25 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), l_ShowOnTop_0 (copy), v24 (copy), l_Pane_0 (copy), v13 (copy), v7 (copy), l_ScrollingFrame_0 (copy), l_LinkText_0 (copy), l_Button_0 (copy), v23 (copy), l_HoverArea_0 (copy)
    local l_props_2 = v35.props;
    local l_state_0 = v35.state;
    local l_AbsoluteSize_0 = l_props_2.AbsoluteSize;
    local l_Localization_0 = l_props_2.Localization;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_contentSize_0 = l_state_0.contentSize;
    local l_searchOptions_0 = l_Stylizer_0.searchOptions;
    local v43 = l_Localization_0:getText("General", "SearchOptionsDone");
    local v44 = l_GetTextSize_0(v43, nil, nil, Vector2.new(0, 0));
    local v45 = true;
    local v46 = UDim2.new(1, 0, 1, 0);
    if l_contentSize_0 then
        local v47 = l_AbsoluteSize_0.Y - (v25 + 40);
        local v48 = l_contentSize_0.Y + 42;
        if v48 < v47 then
            v46 = UDim2.new(1, 0, 0, v48);
            v45 = false;
        end;
    end;
    local v49 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_ShowOnTop_0, {
        Priority = 2
    }, {
        ClickEventDetectFrame = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 0.25, 
            BackgroundColor3 = v24, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 10, 
            [v2.Event.Activated] = v35.cancel
        }, {
            MainPositioning = v2.createElement(l_Pane_0, v13.join({
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, -4, 0, v25 + 4), 
                Size = UDim2.new(0, v7.TOOLBOX_MIN_WIDTH, 1, -(v25 + 8 + 42))
            }, l_props_2.WrapperProps), {
                Contents = v2.createElement(l_Pane_0, {
                    BackgroundColor = l_searchOptions_0.background, 
                    OnClick = function() --[[ Line: 177 ]] --[[ Name: OnClick ]]

                    end, 
                    Size = v46, 
                    Style = "BorderBox", 
                    [v2.Event.MouseEnter] = v35.mouseEnter, 
                    [v2.Event.MouseLeave] = v35.mouseLeave
                }, {
                    Container = v2.createElement(l_ScrollingFrame_0, {
                        AutoSizeCanvas = true, 
                        AutoSizeLayoutOptions = {
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }, 
                        Layout = Enum.FillDirection.Vertical, 
                        OnCanvasResize = v35.updateContentsSize, 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, -42)
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10), 
                            PaddingRight = UDim.new(0, 10), 
                            PaddingTop = UDim.new(0, 10), 
                            PaddingBottom = UDim.new(0, 20)
                        }), 
                        Content = v2.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            Layout = Enum.FillDirection.Vertical, 
                            Spacing = 0, 
                            Size = UDim2.fromScale(1, 0)
                        }, v35.props[v2.Children]), 
                        ExtraPadding = v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 10), 
                            LayoutOrder = v49:getNextOrder()
                        })
                    }), 
                    BottomButtonsContainer = v2.createElement(l_Pane_0, {
                        Padding = {
                            Left = 10, 
                            Right = 10
                        }, 
                        Position = UDim2.new(0, 0, 1, -42), 
                        Spacing = 20, 
                        Size = UDim2.new(1, 0, 0, 42), 
                        ZIndex = 3
                    }, {
                        GradientOverlay = v45 and v2.createElement("Frame", {
                            LayoutOrder = v49:getNextOrder(), 
                            Size = UDim2.new(1, -8, 0, 20), 
                            Position = UDim2.new(0, 0, 0, -20), 
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BorderColor3 = Color3.new(1, 1, 1)
                        }, {
                            Gradient = v2.createElement("UIGradient", {
                                Color = ColorSequence.new(l_searchOptions_0.background), 
                                Rotation = 90, 
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 1), 
                                    NumberSequenceKeypoint.new(1, 0.25)
                                })
                            })
                        }), 
                        Footer = v2.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            AnchorPoint = Vector2.new(0, 1), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Layout = Enum.FillDirection.Horizontal, 
                            OnClick = v35.footerButtonClicked, 
                            Padding = {
                                Bottom = 8
                            }, 
                            Position = UDim2.new(0, 0, 1, 0), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Spacing = 20
                        }, {
                            CancelButton = v2.createElement(l_LinkText_0, {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                LayoutOrder = v49:getNextOrder(), 
                                OnClick = v35.onReset, 
                                Text = l_Localization_0:getText("General", "SearchOptionsResetAll")
                            }), 
                            ApplyButton = v2.createElement(l_Button_0, {
                                LayoutOrder = v49:getNextOrder(), 
                                OnClick = v35.onSubmit, 
                                Style = "RoundPrimary", 
                                Size = UDim2.fromOffset(v44.X + v23.X * 2, v44.Y + v23.Y * 2), 
                                Text = v43
                            }, {
                                HoverArea = v2.createElement(l_HoverArea_0, {
                                    Cursor = "PointingHand"
                                })
                            })
                        })
                    })
                })
            })
        })
    });
end;
v26 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Modal = v10, 
    Network = v12, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Settings = v11
})(v26);
return l_withAbsoluteSize_0((v3.connect(nil, function(v50) --[[ Line: 296 ]]
    -- upvalues: v5 (copy)
    return {
        searchWithOptions = function(v51, v52, v53) --[[ Line: 298 ]] --[[ Name: searchWithOptions ]]
            -- upvalues: v50 (copy), v5 (ref)
            v50(v5(v51, v52, v53));
        end
    };
end)(v26)));