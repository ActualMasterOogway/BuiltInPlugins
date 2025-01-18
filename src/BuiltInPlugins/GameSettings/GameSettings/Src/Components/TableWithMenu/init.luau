local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.TableWithMenuItem);
local v8 = v1.PureComponent:extend("TableWithMenu");
v8.createHeaderLabels = function(_, v10, v11, v12) --[[ Line: 39 ]] --[[ Name: createHeaderLabels ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v13 = {
        HeaderLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v10.table.textPadding), 
            PaddingRight = UDim.new(0, v10.table.textPadding)
        })
    };
    local v14 = #v11;
    for v15 = 1, #v11 do
        v13[v15] = v1.createElement("TextLabel", v2.Dictionary.join(v10.fontStyle.Normal, {
            Size = UDim2.new(1 / v14, 0, 1, 0), 
            LayoutOrder = v15, 
            Text = v11[v15], 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }));
    end;
    if v12 then
        local v16 = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = #v11 + 1, 
            Size = UDim2.new(0, 0, 1, 0)
        }, {
            v12
        });
        v13[#v11 + 1] = v16;
    end;
    return v13;
end;
v8.createDataLabels = function(v17, v18, v19, v20, v21) --[[ Line: 86 ]] --[[ Name: createDataLabels ]]
    -- upvalues: v1 (copy), v7 (copy)
    local v22 = {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v1.Ref] = v17.layoutRef
        })
    };
    local v23 = 0;
    for v24, v25 in pairs(v18) do
        local v26 = nil;
        if v21 then
            v26 = {
                unpack(v19)
            };
            v21(v25, v26);
        else
            v26 = v19;
        end;
        v22[v24] = v1.createElement(v7, {
            RowData = v25.row, 
            MenuItems = v26, 
            OnItemClicked = function(v27) --[[ Line: 112 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v20 (copy), v24 (copy)
                v20(v27, v24);
            end, 
            LayoutOrder = v25.index, 
            Icon = v25.icon or nil
        });
        v23 = v23 + 1;
    end;
    return v22, v23;
end;
v8.init = function(v28) --[[ Line: 126 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v28.layoutRef = v1.createRef();
end;
v8.render = function(v29) --[[ Line: 130 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_ScrollingFrame_0 (copy), v2 (copy)
    local l_props_0 = v29.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Headers_0 = l_props_0.Headers;
    local l_Data_0 = l_props_0.Data;
    local l_MenuItems_0 = l_props_0.MenuItems;
    local l_OnItemClicked_0 = l_props_0.OnItemClicked;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v37 = l_props_0.NextPageFunc or function() --[[ Line: 139 ]]

    end;
    local l_MenuItemsFilterFunc_0 = l_props_0.MenuItemsFilterFunc;
    local l_ScrollingFrameNextPageRequestDistance_0 = l_props_0.ScrollingFrameNextPageRequestDistance;
    local l_HeaderButton_0 = l_props_0.HeaderButton;
    local v41 = l_props_0.TableHeight or l_Stylizer_0.table.height;
    local l_ShowTableBackground_0 = l_props_0.ShowTableBackground;
    local v43 = v29:createHeaderLabels(l_Stylizer_0, l_Headers_0, l_HeaderButton_0);
    local v44, v45 = v29:createDataLabels(l_Data_0, l_MenuItems_0, l_OnItemClicked_0, l_MenuItemsFilterFunc_0);
    local v46 = v45 == 0 and l_props_0.EmptyText or nil;
    local v47 = l_ShowTableBackground_0 and l_Stylizer_0.table.item.background or nil;
    local v48 = UDim2.new(1, 0, 1, -l_Stylizer_0.table.header.height);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v41), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        HeaderFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.table.header.height), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v43), 
        ScrollingContainer = not v46 and v1.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Size = v48, 
            NextPageFunc = v37, 
            NextPageRequestDistance = l_ScrollingFrameNextPageRequestDistance_0, 
            LayoutOrder = 2
        }, v44), 
        EmptyTextBox = v46 and v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Smaller, {
            Size = v48, 
            LayoutOrder = 2, 
            Text = v46, 
            BackgroundTransparency = l_ShowTableBackground_0 and 0 or 1, 
            BackgroundColor3 = v47, 
            BorderColor3 = v47, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {})
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));