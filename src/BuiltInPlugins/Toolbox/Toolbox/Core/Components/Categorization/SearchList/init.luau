local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_TextService_0 = game:GetService("TextService");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v3.ContextServices;
local v6 = require(l_Packages_0.Dash);
local _ = v3.UI.HoverArea;
local l_Pane_0 = v3.UI.Pane;
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local v10 = require(l_script_FirstAncestor_0.Core.Util.multiLanguageUtils);
local v11 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SearchPill);
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = v4.PureComponent:extend("SearchList");
v13.defaultProps = {
    ItemMinWidth = 0, 
    MaxRowCount = 1e999, 
    Size = UDim2.new(1, 0, 0, 0)
};
v13.init = function(v14) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v4 (copy), v11 (copy), l_TextService_0 (copy)
    v14.onRenderItem = function(v15, v16, v17) --[[ Line: 56 ]]
        -- upvalues: v14 (copy), v10 (ref), v4 (ref), v11 (ref)
        local l_props_0 = v14.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_OnClick_0 = l_props_0.OnClick;
        local l_searchPill_0 = l_Stylizer_0.searchPill;
        local v22 = v10.lower(v16);
        return v4.createElement(v11, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v15, 
            OnClick = l_OnClick_0, 
            Size = UDim2.new(0, v17, 0, l_searchPill_0.textSize), 
            Text = v22
        });
    end;
    v14.resizeRowItemsToAvailableSpace = function(v23, v24, v25) --[[ Line: 74 ]]
        if #v23 == 0 then
            return;
        else
            local v26 = v25 - v24;
            local v27 = math.floor(v26 / #v23);
            for _, v29 in ipairs(v23) do
                v29.Width = v29.Width + v27;
            end;
            local v30 = v26 - v27 * #v23;
            local v31 = v23[#v23];
            v31.Width = v31.Width + v30;
            return;
        end;
    end;
    v14.getRowMatrix = function() --[[ Line: 93 ]]
        -- upvalues: v14 (copy), l_TextService_0 (ref)
        local l_props_1 = v14.props;
        local l_Stylizer_1 = l_props_1.Stylizer;
        local l_Items_0 = l_props_1.Items;
        local l_ItemMinWidth_0 = l_props_1.ItemMinWidth;
        local l_MaxRowCount_0 = l_props_1.MaxRowCount;
        local l_X_0 = l_props_1.AbsoluteSize.X;
        local v38 = {};
        local v39 = {};
        local v40 = 0;
        local l_searchList_0 = l_Stylizer_1.searchList;
        local l_searchPill_1 = l_Stylizer_1.searchPill;
        for v43, v44 in ipairs(l_Items_0) do
            local v45 = l_TextService_0:GetTextSize(v44, l_searchPill_1.textSize, l_searchPill_1.font, Vector2.new(l_X_0, 1e999)).X + l_ItemMinWidth_0;
            local v46 = {
                Item = v44, 
                Width = v45
            };
            local l_v40_0 = v40;
            v40 = v40 + v45;
            if v43 ~= 1 then
                v40 = v40 + l_searchList_0.buttonSpacing;
            end;
            if l_X_0 < v40 then
                v14.resizeRowItemsToAvailableSpace(v39, l_v40_0, l_X_0);
                table.insert(v38, v39);
                v40 = v45;
                v39 = {};
            end;
            if #v38 < l_MaxRowCount_0 then
                table.insert(v39, v46);
            else
                break;
            end;
        end;
        if #v39 > 0 then
            table.insert(v38, v39);
            v14.resizeRowItemsToAvailableSpace(v39, v40, l_X_0);
        end;
        return v38;
    end;
end;
v13.render = function(v48) --[[ Line: 155 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), v6 (copy)
    local l_props_2 = v48.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local _ = l_props_2.Items;
    local l_Position_0 = l_props_2.Position;
    local l_Size_0 = l_props_2.Size;
    local l_searchList_1 = l_props_2.Stylizer.searchList;
    local v55 = v48.getRowMatrix();
    local v56 = {};
    for v57, v58 in pairs(v55) do
        local v59 = {};
        for v60, v61 in pairs(v58) do
            table.insert(v59, (v48.onRenderItem(v60, v61.Item, v61.Width)));
        end;
        table.insert(v56, (v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v57, 
            Size = UDim2.new(1, 0, 0, 0), 
            Spacing = l_searchList_1.buttonSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v59)));
    end;
    return v4.createElement(l_Pane_0, v6.join({
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        Spacing = l_searchList_1.buttonSpacing
    }, l_props_2.WrapperProps), v56);
end;
return l_withAbsoluteSizeAndPosition_0((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13)));