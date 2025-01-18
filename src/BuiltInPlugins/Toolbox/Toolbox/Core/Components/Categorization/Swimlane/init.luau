local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Layouter);
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local l_Categorization_0 = l_Parent_0.Core.Components.Categorization;
local v11 = require(l_Categorization_0.SectionHeader);
local v12 = require(l_Categorization_0.HorizontalList);
local v13 = v2.PureComponent:extend("Swimlane");
v13.defaultProps = {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Size = UDim2.new(1, 0, 0, 0), 
    ShowTotal = false
};
v13.init = function(v14) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v4 (copy)
    v14.ref = v2.createRef();
    v14.state = {
        DisplayCount = 0
    };
    v14.onAbsoluteSizeChange = function(v15) --[[ Line: 63 ]]
        -- upvalues: v14 (copy), v4 (ref)
        v14:setState({
            DisplayCount = v4.getAssetsPerRow(v15.AbsoluteSize.X)
        });
    end;
end;
v13.didMount = function(v16) --[[ Line: 70 ]] --[[ Name: didMount ]]
    if v16.ref.current then
        v16.onAbsoluteSizeChange(v16.ref.current);
    end;
end;
v13.render = function(v17) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_LoadingIndicator_0 (copy), v12 (copy), v11 (copy)
    local l_props_0 = v17.props;
    local l_Data_0 = l_props_0.Data;
    local l_AutomaticSize_0 = l_props_0.AutomaticSize;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ShowTotal_0 = l_props_0.ShowTotal;
    local l_SeeAllTextSize_0 = l_props_0.SeeAllTextSize;
    local l_Size_0 = l_props_0.Size;
    local l_Title_0 = l_props_0.Title;
    local l_Total_0 = l_props_0.Total;
    local l_OnClickSeeAll_0 = l_props_0.OnClickSeeAll;
    local l_OnRenderItem_0 = l_props_0.OnRenderItem;
    local l_Localization_0 = l_props_0.Localization;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_IsLoading_0 = l_props_0.IsLoading;
    local l_IsHeaderResponsive_0 = l_props_0.IsHeaderResponsive;
    local l_DisplayCount_0 = v17.state.DisplayCount;
    local v34 = not l_Total_0 or l_DisplayCount_0 < l_Total_0;
    local v35 = nil;
    v35 = if l_IsLoading_0 then v2.createElement("Frame", {
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0.8, 
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0, 100)
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), 
        Loading = v2.createElement(l_LoadingIndicator_0, {
            Size = UDim2.new(0, 90, 0, 30), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
    }) else v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 0, 0)
    }, v2.createElement(v12, {
        Data = l_Data_0, 
        DisplayCount = l_DisplayCount_0, 
        OnRenderItem = l_OnRenderItem_0
    }));
    return v2.createElement("Frame", {
        AutomaticSize = l_AutomaticSize_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        ZIndex = l_ZIndex_0, 
        [v2.Change.AbsoluteSize] = v17.onAbsoluteSizeChange, 
        [v2.Ref] = v17.ref
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v2.createElement(v11, {
            IsResponsive = l_IsHeaderResponsive_0, 
            LayoutOrder = 1, 
            OnClickSeeAll = l_OnClickSeeAll_0, 
            SeeAllText = if l_Total_0 and l_ShowTotal_0 then l_Localization_0:getText("HomeView", "Results", {
                total = tostring(l_Total_0)
            }) else nil, 
            ShowSeeAllText = v34, 
            SeeAllTextSize = l_SeeAllTextSize_0, 
            Title = l_Title_0, 
            Total = l_Total_0
        }), 
        SectionContents = v35
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v13));