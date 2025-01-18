local l_Packages_0 = script.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Framework);
local l_LinkText_0 = v2.UI.LinkText;
local l_Pane_0 = v2.UI.Pane;
local v5 = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v2.Wrappers.withAbsoluteSize;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = v1.PureComponent:extend("SectionHeader");
v10.defaultProps = {
    Title = "", 
    ShowSeeAllText = true
};
v10.init = function(v11) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v11.hostRef = v1.createRef();
    v11.seeAllRef = v1.createRef();
    v11.frameRef = v1.createRef();
end;
v10.render = function(v12) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_LinkText_0 (copy), l_Pane_0 (copy), v5 (copy)
    local l_props_0 = v12.props;
    local l_AbsoluteSize_0 = l_props_0.AbsoluteSize;
    local l_IsResponsive_0 = l_props_0.IsResponsive;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnClickSeeAll_0 = l_props_0.OnClickSeeAll;
    local l_Position_0 = l_props_0.Position;
    local l_Localization_0 = l_props_0.Localization;
    local v20 = l_props_0.SeeAllText or l_Localization_0:getText("HomeView", "SeeAll") .. " >";
    local l_ShowSeeAllText_0 = l_props_0.ShowSeeAllText;
    local l_sectionHeader_0 = l_props_0.Stylizer.sectionHeader;
    local l_Title_0 = l_props_0.Title;
    local l_WrapperProps_0 = l_props_0.WrapperProps;
    local v25 = if l_AbsoluteSize_0 then l_IsResponsive_0 and l_AbsoluteSize_0.X < 300 else nil;
    local v26 = v25 and 0 or 1;
    local v27 = if v12.seeAllRef.current and v12.hostRef.current then UDim2.new(0, v12.hostRef.current.AbsoluteSize.X - v12.seeAllRef.current.AbsoluteSize.X, v26, 0) else UDim2.new(0.6, 0, v26, 0);
    local v28 = l_LayoutOrderIterator_0.new();
    local v29 = {
        Title = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Font = l_sectionHeader_0.font, 
            LayoutOrder = v28:getNextOrder(), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v27, 
            Text = l_Title_0, 
            TextColor3 = l_sectionHeader_0.textColor, 
            TextSize = l_sectionHeader_0.textSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v1.Ref] = v12.hostRef
        }), 
        SeeAll = l_ShowSeeAllText_0 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = v28:getNextOrder(), 
            Position = UDim2.new(1, 0, 0, 0)
        }, {
            SeeAllButton = v1.createElement(l_LinkText_0, {
                OnClick = l_OnClickSeeAll_0, 
                Style = "Unobtrusive", 
                Text = v20, 
                TextSize = l_props_0.SeeAllTextSize
            })
        })
    };
    return v1.createElement(l_Pane_0, v5.join({
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        HorizontalAlignment = if v25 then Enum.HorizontalAlignment.Left else nil, 
        Layout = if v25 then Enum.FillDirection.Vertical else nil, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        Spacing = v25 and 5 or 0, 
        Position = l_Position_0, 
        [v1.Change.AbsoluteSize] = v12.onAbsoluteSizeChange, 
        [v1.Ref] = v12.frameRef
    }, l_WrapperProps_0), v29);
end;
return l_withAbsoluteSize_0((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10)));