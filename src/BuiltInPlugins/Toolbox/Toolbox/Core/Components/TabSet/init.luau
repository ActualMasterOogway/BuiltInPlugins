local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v9 = require(l_Parent_0.Core.Components.Tab);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v12 = v2.PureComponent:extend("TabSet");
v12.init = function(v13) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v13.state = {
        currentWidth = 0
    };
    v13.tabSetRef = v2.createRef();
    v13.onAbsoluteSizeChange = function() --[[ Line: 45 ]]
        -- upvalues: v13 (copy)
        local l_x_0 = v13.tabSetRef.current.AbsoluteSize.x;
        if v13.state.currentWidth ~= l_x_0 then
            v13:setState({
                currentWidth = l_x_0
            });
        end;
    end;
    v13.onTabSelected = function(v15) --[[ Line: 54 ]]
        -- upvalues: v13 (copy)
        if v13.props.onTabSelected then
            v13.props.onTabSelected(v15);
        end;
    end;
end;
v12.resetLayout = function(v16) --[[ Line: 61 ]] --[[ Name: resetLayout ]]
    v16.currentLayout = 0;
end;
v12.nextLayout = function(v17) --[[ Line: 65 ]] --[[ Name: nextLayout ]]
    v17.currentLayout = v17.currentLayout + 1;
    return v17.currentLayout;
end;
v12.createTab = function(v18, v19, v20, v21, v22, v23, v24, v25) --[[ Line: 70 ]] --[[ Name: createTab ]]
    -- upvalues: v2 (copy), v9 (copy), v10 (copy), v11 (copy)
    return v2.createElement(v9, {
        Disabled = v25, 
        LayoutOrder = v18:nextLayout(), 
        Image = v22, 
        Text = v21, 
        Selected = v19 == v20, 
        TabWidth = v23, 
        DisplayText = if v10() and v11(v18.props.IXP) then nil else v24, 
        onClick = function() --[[ Line: 82 ]] --[[ Name: onClick ]]
            -- upvalues: v18 (copy), v19 (copy)
            v18.onTabSelected(v19);
        end
    });
end;
local function _(v26, v27) --[[ Line: 88 ]] --[[ Name: calculateTabWidth ]]
    return #v26 > 0 and v27 / #v26 or 0;
end;
local function _(v29) --[[ Line: 92 ]] --[[ Name: calculateTabHeaderWidth ]]
    -- upvalues: l_GetTextSize_0 (copy), v4 (copy)
    return l_GetTextSize_0(v29, nil, v4.FONT_BOLD, Vector2.new(0, 0)).X + v4.TAB_ICON_SIZE + v4.TAB_INNER_PADDING + v4.TAB_OUTER_PADDING * 2;
end;
local function v36(v31, v32) --[[ Line: 97 ]] --[[ Name: canTextBeDisplayed ]]
    -- upvalues: l_GetTextSize_0 (copy), v4 (copy)
    if #v31 > 0 then
        for _, v34 in ipairs(v31) do
            local l_Text_0 = v34.Text;
            if v32 < l_GetTextSize_0(l_Text_0, nil, v4.FONT_BOLD, Vector2.new(0, 0)).X + v4.TAB_ICON_SIZE + v4.TAB_INNER_PADDING + v4.TAB_OUTER_PADDING * 2 then
                return false;
            end;
        end;
    end;
    return true;
end;
v12.render = function(v37) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v10 (copy), v11 (copy), v36 (copy)
    local l_Stylizer_0 = v37.props.Stylizer;
    local v39 = v37.props.Size or UDim2.new();
    local v40 = v37.props.Position or UDim2.new();
    local v41 = v37.props.Tabs or {};
    local l_CurrentTab_0 = v37.props.CurrentTab;
    local l_Disabled_0 = v37.props.Disabled;
    local l_tabSet_0 = l_Stylizer_0.tabSet;
    local l_currentWidth_0 = v37.state.currentWidth;
    v37:resetLayout();
    local v46 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        LeftPadding = v2.createElement("Frame", {
            LayoutOrder = v37:nextLayout(), 
            Size = UDim2.new(0, 1, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_tabSet_0.tabBackground
        })
    };
    local v47 = #v41 > 0 and l_currentWidth_0 / #v41 or 0;
    local v48 = if v10() and v11(v37.props.IXP) then nil else v36(v41, v47);
    for _, v50 in ipairs(v41) do
        v46[v50.Key] = v37:createTab(v50.Key, l_CurrentTab_0, v50.Text, v50.Image, v47, v48, l_Disabled_0);
    end;
    v46.RightPadding = v2.createElement("Frame", {
        LayoutOrder = v37:nextLayout(), 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_tabSet_0.tabBackground
    }, {
        LowerBorder = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 2), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_tabSet_0.borderColor
        })
    });
    return v2.createElement("Frame", {
        Size = v39, 
        Position = v40, 
        BackgroundColor3 = l_tabSet_0.backgroundColor, 
        BorderSizePixel = 0, 
        [v2.Ref] = v37.tabSetRef, 
        [v2.Change.AbsoluteSize] = v37.onAbsoluteSizeChange
    }, v46);
end;
return (l_withContext_0({
    IXP = if v10() then v5 else nil, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));