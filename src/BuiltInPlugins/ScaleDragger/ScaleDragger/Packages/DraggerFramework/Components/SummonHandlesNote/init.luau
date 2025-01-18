local _ = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = v2.PureComponent:extend("SummonHandlesNote");
v3.didMount = function(v4) --[[ Line: 16 ]] --[[ Name: didMount ]]
    v4.localeChangedConnection = v4.props.DraggerContext.LocaleChangedSignal:Connect(function() --[[ Line: 17 ]]
        -- upvalues: v4 (copy)
        v4:setState({});
    end);
end;
SimplePadding = function(v5) --[[ Line: 22 ]] --[[ Name: SimplePadding ]]
    -- upvalues: v2 (copy)
    return v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, v5.Padding), 
        PaddingRight = UDim.new(0, v5.Padding), 
        PaddingLeft = UDim.new(0, v5.Padding), 
        PaddingTop = UDim.new(0, v5.Padding)
    });
end;
v3.render = function(v6) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_props_0 = v6.props;
    if l_props_0.InView then
        return;
    else
        local v8 = l_props_0.DraggerContext:getViewportSize();
        local v9 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.Tooltip);
        local v10 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.Border);
        local v11 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.MainText);
        local v12 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.DimmedText);
        return v2.createElement(v2.Portal, {
            target = l_props_0.DraggerContext:getGuiParent()
        }, {
            SummonHandlesNoteGui = v2.createElement("ScreenGui", {}, {
                Frame = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundColor3 = v9, 
                    BorderColor3 = v10, 
                    Position = UDim2.new(0, v8.X / 2, 0, 2)
                }, {
                    Padding = v2.createElement(SimplePadding, {
                        Padding = 3
                    }), 
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 3)
                    }), 
                    Tab = v2.createElement("TextLabel", {
                        Text = l_props_0.DraggerContext:getText("SummonPivot", "TabText"), 
                        TextColor3 = v11, 
                        BackgroundColor3 = v12, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1
                    }, {
                        Padding = v2.createElement(SimplePadding, {
                            Padding = 2
                        }), 
                        Corner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        })
                    }), 
                    Text = v2.createElement("TextLabel", {
                        Text = l_props_0.DraggerContext:getText("SummonPivot", "SummonText"), 
                        TextColor3 = v11, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        Padding = v2.createElement(SimplePadding, {
                            Padding = 2
                        })
                    })
                })
            })
        });
    end;
end;
v3.willUnmount = function(v13) --[[ Line: 87 ]] --[[ Name: willUnmount ]]
    v13.localeChangedConnection:Disconnect();
end;
return v3;