local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Table_0 = l_UI_0.Table;
local l_StatusTableData_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).StatusTableData;
local v13 = v3.PureComponent:extend("StatusTable");
local v14 = v3.PureComponent:extend("CellComponent");
v14.render = function(v15) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_StatusTableData_0 (copy), v3 (copy), l_Pane_0 (copy), v4 (copy), l_TextLabel_0 (copy), l_Image_0 (copy)
    local l_props_0 = v15.props;
    local l_Width_0 = l_props_0.Width;
    local l_Row_0 = l_props_0.Row;
    local l_Style_0 = l_props_0.Style;
    local l_ColumnIndex_0 = l_props_0.ColumnIndex;
    local v21 = if l_props_0.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v22 = {
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        LayoutOrder = l_ColumnIndex_0, 
        Style = "Box", 
        BackgroundColor = v21, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0)
    };
    if l_ColumnIndex_0 == l_StatusTableData_0.TEXT_COLUMN_INDEX then
        return v3.createElement(l_Pane_0, v4.Dictionary.join(v22, {
            Padding = {
                Left = 24
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), {
            Text = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                Text = l_Row_0.text
            })
        });
    else
        return v3.createElement(l_Pane_0, v4.Dictionary.join(v22, {
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), {
            Image = v3.createElement(l_Image_0, {
                Size = UDim2.fromOffset(16, 16), 
                Image = l_Row_0.complete and "rbxasset://textures/R15Migrator/Icon_Checkmark.png" or "rbxasset://textures/R15Migrator/Icon_Error_Checkmark.png"
            })
        });
    end;
end;
v13.init = function(v23) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: l_Selection_0 (copy), l_showContextMenu_0 (copy)
    v23.showMenu = function(v24) --[[ Line: 79 ]]
        -- upvalues: v23 (copy), l_Selection_0 (ref), l_showContextMenu_0 (ref)
        local l_props_1 = v23.props;
        local l_Localization_0 = l_props_1.Localization;
        local v27 = l_props_1.Plugin:get();
        local v28 = {
            {
                Text = l_Localization_0:getText("StatusTable", "RevealInExplorer"), 
                Enabled = v24.target ~= nil, 
                OnItemClicked = function() --[[ Line: 88 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_Selection_0 (ref), v24 (copy)
                    l_Selection_0:Set({
                        v24.target
                    });
                end
            }
        };
        l_showContextMenu_0(v27, v28);
    end;
end;
v13.render = function(v29) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Table_0 (copy), l_StatusTableData_0 (copy), v14 (copy)
    local l_props_2 = v29.props;
    local l_Rows_0 = l_props_2.Rows;
    local l_Title_0 = l_props_2.Title;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_OnClick_0 = l_props_2.OnClick;
    local l_HeaderCellComponent_0 = l_props_2.HeaderCellComponent;
    local l_Localization_1 = l_props_2.Localization;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_RowHeight_0 = l_Stylizer_0.RowHeight;
    local l_MaxTableHeight_0 = l_Stylizer_0.MaxTableHeight;
    local l_ColumnOffset_0 = l_Stylizer_0.ColumnOffset;
    local v41 = (#l_Rows_0 + 1) * l_RowHeight_0;
    return v3.createElement(l_Table_0, {
        Size = UDim2.new(1, 0, 0, (math.min(l_MaxTableHeight_0, v41))), 
        Scroll = l_MaxTableHeight_0 < v41, 
        Rows = l_Rows_0, 
        RowHeight = l_RowHeight_0, 
        ColumnHeaderHeight = l_RowHeight_0, 
        Columns = {
            [l_StatusTableData_0.TEXT_COLUMN_INDEX] = {
                Name = l_Title_0, 
                Width = UDim.new(1, -l_ColumnOffset_0)
            }, 
            [l_StatusTableData_0.STATUS_COLUMN_INDEX] = {
                Name = l_Localization_1:getText("StatusTable", "Status"), 
                Width = UDim.new(0, l_ColumnOffset_0)
            }
        }, 
        HeaderCellComponent = l_HeaderCellComponent_0, 
        CellComponent = v14, 
        LayoutOrder = l_LayoutOrder_0, 
        OnSelectRow = l_OnClick_0, 
        OnSortChange = l_OnClick_0, 
        OnRightClickRow = v29.showMenu
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v13));