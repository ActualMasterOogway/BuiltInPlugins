local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v5 = require(script.Tile);
local l_UI_0 = v1.UI;
local l_Grid_0 = l_UI_0.Grid;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useToolbar);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_TextService_0 = game:GetService("TextService");
return function(v14) --[[ Line: 29 ]]
    -- upvalues: l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v10 (copy), v11 (copy), l_TextService_0 (copy), v2 (copy), l_Pane_0 (copy), l_Tabs_0 (copy), l_Grid_0 (copy), v5 (copy)
    local v15 = l_Stylizer_0:use("Toolbar");
    local v16 = l_LayoutOrderIterator_0.new();
    local v17 = v10.use();
    local v18 = v11(v17);
    local v19 = {};
    for v20, v21 in v18.Tools do
        v19[v20] = {
            icon = {
                Image = string.format(v21.icon.Image, v15.StudioTheme), 
                Size = v15.IconSize
            }, 
            name = v21.name
        };
    end;
    local function v23(v22) --[[ Line: 47 ]] --[[ Name: setAbsoluteSize ]]
        -- upvalues: v14 (copy)
        v14.OnAbsoluteSizeChanged(v22.AbsoluteSize);
    end;
    local function v31(v24, v25, v26, v27) --[[ Line: 51 ]] --[[ Name: getCellProps ]]
        -- upvalues: v15 (copy), l_TextService_0 (ref), v17 (copy), v18 (copy)
        local v28 = Vector2.new(v15.CellSize.X.Offset, v15.CellSize.Y.Offset);
        local v29 = if l_TextService_0:GetTextSize(v24.name, v15.TextSize, Enum.Font.SourceSans, v28).X > v15.OverflowThreshold then v15.OverflowTextSize else v15.TextSize;
        return {
            Icon = v24.icon, 
            Key = v25, 
            Name = v24.name, 
            OnClick = function(v30) --[[ Line: 60 ]] --[[ Name: OnClick ]]
                -- upvalues: v17 (ref)
                v17:setToolIndex(v30);
            end, 
            Position = v26, 
            Selected = v18.ToolIndex, 
            Size = v27, 
            TextSize = v29
        };
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v14.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v2.Change.AbsoluteSize] = v23
    }, {
        Category = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor = v15.TabBackgroundColor, 
            LayoutOrder = v16:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        }, {
            Tabs = v2.createElement(l_Tabs_0, {
                LayoutOrder = v16:getNextOrder(), 
                OnTabSelected = function(v32) --[[ Line: 70 ]] --[[ Name: onTabSelected ]]
                    -- upvalues: v17 (copy)
                    v17:setTabIndex(v32.Key);
                end, 
                SelectedTab = v18.TabIndex, 
                Tabs = v18.Tabs
            })
        }), 
        Tools = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v16:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        }, {
            Grid = v2.createElement(l_Grid_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Cells = v19, 
                CellComponent = v5, 
                CellPadding = v15.CellPadding, 
                CellSize = v15.CellSize, 
                GetCellProps = v31, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Size = UDim2.fromScale(1, 0)
            })
        })
    });
end;