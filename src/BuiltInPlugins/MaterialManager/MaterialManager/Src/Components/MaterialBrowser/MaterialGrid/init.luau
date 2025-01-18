local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_InfiniteScrollingGrid_0 = l_UI_0.InfiniteScrollingGrid;
local l_IconButton_0 = l_UI_0.IconButton;
local v14 = require(l_Parent_0.Src.Actions.SetMenuHover);
local l_Components_0 = l_Parent_0.Src.Components;
local v16 = require(l_Components_0.MaterialBrowser.MaterialGrid.MaterialItem);
local v17 = v2.PureComponent:extend("MaterialGrid");
v17.init = function(v18) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v16 (copy)
    v18.renderItem = function(v19, v20) --[[ Line: 60 ]]
        -- upvalues: v2 (ref), v16 (ref)
        return v2.createElement(v16, {
            MaterialItem = v20, 
            LayoutOrder = v19
        });
    end;
    v18.onMouseEnter = function() --[[ Line: 67 ]]
        -- upvalues: v18 (copy)
        v18.props.dispatchSetMenuHover(true);
    end;
    v18.onMouseLeave = function() --[[ Line: 73 ]]
        -- upvalues: v18 (copy)
        v18.props.dispatchSetMenuHover(false);
    end;
end;
v17.render = function(v21) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_InfiniteScrollingGrid_0 (copy), l_IconButton_0 (copy)
    local l_props_0 = v21.props;
    local l_MaterialGrid_0 = l_props_0.Stylizer.MaterialGrid;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_MaterialTileSize_0 = l_props_0.MaterialTileSize;
    local l_Size_0 = l_props_0.Size;
    local l_ViewType_0 = l_props_0.ViewType;
    local l_OnShowButtonClicked_0 = l_props_0.OnShowButtonClicked;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = l_MaterialGrid_0.BackgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0
    }, {
        Grid = v2.createElement(l_InfiniteScrollingGrid_0, {
            AbsoluteMax = #l_props_0.MaterialList, 
            CellPadding = if l_ViewType_0 == "Grid" then UDim2.fromOffset(l_MaterialGrid_0.GridPadding, l_MaterialGrid_0.GridPadding) else UDim2.fromOffset(l_MaterialGrid_0.ListPadding, l_MaterialGrid_0.ListPadding), 
            CellSize = if l_ViewType_0 == "Grid" then UDim2.fromOffset(l_MaterialTileSize_0, l_MaterialTileSize_0) else UDim2.new(1, -20, 0, l_MaterialGrid_0.ListHeight), 
            BufferedRows = 2, 
            Items = l_props_0.MaterialList, 
            Loading = false, 
            Padding = l_MaterialGrid_0.Padding, 
            RenderItem = v21.renderItem, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        SidebarButton = if not l_props_0.SideBarVisible then v2.createElement(l_IconButton_0, {
            Size = l_MaterialGrid_0.IconSize, 
            LeftIcon = l_MaterialGrid_0.ChevronRight, 
            IconColor = l_MaterialGrid_0.IconColor, 
            OnClick = l_OnShowButtonClicked_0 or function() --[[ Line: 117 ]]

            end, 
            OnMouseEnter = v21.onMouseEnter, 
            OnMouseLeave = v21.onMouseLeave, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 5, 1, -5), 
            ZIndex = 2
        }) else nil
    });
end;
v17 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17);
return v3.connect(function(v29, _) --[[ Line: 134 ]]
    return {
        MaterialList = v29.MaterialBrowserReducer.MaterialList, 
        MaterialTileSize = v29.MaterialBrowserReducer.MaterialTileSize, 
        ViewType = v29.MaterialBrowserReducer.ViewType
    };
end, function(v31) --[[ Line: 140 ]]
    -- upvalues: v14 (copy)
    return {
        dispatchSetMenuHover = function(v32) --[[ Line: 142 ]] --[[ Name: dispatchSetMenuHover ]]
            -- upvalues: v31 (copy), v14 (ref)
            v31(v14(v32));
        end
    };
end)(v17);