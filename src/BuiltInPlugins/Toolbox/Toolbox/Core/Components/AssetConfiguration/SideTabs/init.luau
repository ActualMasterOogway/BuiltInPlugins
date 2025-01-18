local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.Images);
local v8 = require(l_Parent_0.Core.Localization.getLocalizedSideTabsMap);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = v2.PureComponent:extend("SideTabs");
v11.init = function(v12, _) --[[ Line: 44 ]] --[[ Name: init ]]
    v12.state = {
        hoveredIndex = 0
    };
    v12.onItemEntered = function(v14) --[[ Line: 49 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            hoveredIndex = v14
        });
    end;
    v12.onItemLeft = function(_) --[[ Line: 55 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            hoveredIndex = 0
        });
    end;
end;
v11.createSideButtons = function(v16, v17, v18, v19, v20, v21, v22) --[[ Line: 62 ]] --[[ Name: createSideButtons ]]
    -- upvalues: v2 (copy), v8 (copy), v6 (copy), v7 (copy)
    local v23 = v19 * 0.4;
    local v24 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        })
    };
    local l_current_0 = v21.current;
    local v26 = 0;
    if l_current_0 then
        v26 = l_current_0.AbsoluteSize.X;
    end;
    for v27, v28 in pairs(v17) do
        local v29 = v8(v16.props.Localization)[v28.name];
        local v30 = v28 == v18;
        local l_contentColor_0 = v20.sideTab.contentColor;
        v24[v29] = v2.createElement("Frame", {
            Size = UDim2.new(0.5, 0, 0, v19), 
            BackgroundTransparency = 1, 
            LayoutOrder = v27
        }, {
            Icon = v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Size = UDim2.new(0, v23, 0, v23), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_contentColor_0, 
                Image = v28.image, 
                [v2.Event.Activated] = function(_) --[[ Line: 101 ]]
                    -- upvalues: v16 (copy), v27 (copy), v28 (copy)
                    v16.props.ItemClickCallBack(v27, v28);
                end, 
                LayoutOrder = 1
            }), 
            Text = v2.createElement("TextButton", {
                Position = UDim2.new(0, v23 * 2, 0, 0), 
                Size = UDim2.new(1, -v23, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v29, 
                Font = v6.FONT, 
                TextSize = v6.FONT_SIZE_LARGE, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v20.sideTab.textColor, 
                [v2.Event.Activated] = function(_) --[[ Line: 119 ]]
                    -- upvalues: v16 (copy), v27 (copy), v28 (copy)
                    v16.props.ItemClickCallBack(v27, v28);
                end, 
                LayoutOrder = 2
            }), 
            Selection = v30 and v2.createElement("Frame", {
                Position = UDim2.new(-0.5, 0, 0, 0), 
                Size = UDim2.new(0, v26, 1, 0), 
                BackgroundTransparency = v22.selecteBarTrans, 
                BackgroundColor3 = v22.selecteBarColor, 
                BorderSizePixel = 0, 
                ZIndex = v22.selecteBarZindex, 
                LayoutOrder = 0
            }, {
                Indicator = v2.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(0, 4, 1, 0), 
                    BackgroundTransparency = v22.selecteIndicatorTrans, 
                    BackgroundColor3 = v22.selecteIndicatorColor, 
                    BorderSizePixel = 0
                })
            }), 
            Error = v16.props.tabHasErrors(v28.name) and v2.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 20, 0, 20), 
                Position = UDim2.new(1, -20, 0.5, -10), 
                Image = v7.ERROR_ICON, 
                [v2.Event.Activated] = function(_) --[[ Line: 154 ]]
                    -- upvalues: v16 (copy), v27 (copy), v28 (copy)
                    v16.props.ItemClickCallBack(v27, v28);
                end, 
                LayoutOrder = 3
            })
        });
    end;
    return v24;
end;
v11.render = function(v35) --[[ Line: 166 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_props_0 = v35.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_Items_0 = l_props_0.Items;
    local l_ItemHeight_0 = l_props_0.ItemHeight;
    local v43 = v35:createSideButtons(l_Items_0, l_props_0.CurrentTab, l_ItemHeight_0, l_Stylizer_0, l_props_0.SelectParentRef, l_Stylizer_0.sideTab);
    return v2.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, v43);
end;
local function v50(v44, _) --[[ Line: 193 ]] --[[ Name: mapStateToProps ]]
    v44 = v44 or {};
    return {
        tabHasErrors = function(v46) --[[ Line: 196 ]] --[[ Name: tabHasErrors ]]
            -- upvalues: v44 (ref)
            if v44.tabErrors then
                local v47 = v44.tabErrors[v46];
                if v47 then
                    for _, v49 in pairs(v47) do
                        if v49 == true then
                            return true;
                        end;
                    end;
                end;
            end;
            return false;
        end
    };
end;
v11 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11);
return v3.connect(v50)(v11);