local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local l_ViewTypeSelector_0 = l_UI_0.ViewTypeSelector;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Shared.MinimalButton);
local v10 = require(script.BulkImportButton);
local v11 = require(script.FilterDropdown);
local v12 = require(script.SortItem);
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useLayoutInfo);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useSearchInfo);
local v17 = require(script.FilterDropdown.getNestedFilterTable);
local v18 = require(l_script_FirstAncestor_0.Src.Types);
local l_AssetInfoField_0 = v18.AssetInfoField;
local v20 = require(script.styles);
local v21 = require(l_script_FirstAncestor_0.Src.Util.Images);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v23 = {
    l_AssetInfoField_0.DisplayName, 
    l_AssetInfoField_0.Created, 
    l_AssetInfoField_0.Modified, 
    l_AssetInfoField_0.AssetType
};
return function(v24) --[[ Line: 51 ]] --[[ Name: HeaderOptions ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v13 (copy), v14 (copy), v17 (copy), v16 (copy), v1 (copy), v12 (copy), v15 (copy), l_Pane_0 (copy), v9 (copy), v18 (copy), l_SelectInput_0 (copy), v21 (copy), v23 (copy), v20 (copy), v11 (copy), l_ViewTypeSelector_0 (copy), l_Separator_0 (copy), v10 (copy)
    local v25 = l_LayoutOrderIterator_0.new();
    local v26 = l_Localization_0.use();
    local v27 = v13.use();
    local v28 = v14.use();
    local v29 = v17(v27, v26);
    local v30 = v16(v28);
    local function v34(v31, v32, v33) --[[ Line: 60 ]]
        -- upvalues: v1 (ref), v12 (ref)
        return v1.createElement(v12, {
            Item = v31, 
            LayoutOrder = v32, 
            Activated = v33
        });
    end;
    local v35 = v15(v27);
    local function _(v36, v37) --[[ Line: 69 ]] --[[ Name: setLayoutInfoHelper ]]
        -- upvalues: v35 (copy), v27 (copy)
        if not v36 then
            v36 = v35.GridSize;
        end;
        if not v37 then
            v37 = v35.ViewType;
        end;
        v27:setLayout({
            GridSize = v36, 
            ViewType = v37
        });
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v24.LayoutOrder, 
        [v1.Tag] = "HeaderOptions X-Fit X-Right X-Middle X-RowM"
    }, {
        RefreshButton = if not v30.ShowSearchOptions then v1.createElement(v9, {
            LayoutOrder = v25:getNextOrder(), 
            OnClick = function() --[[ Line: 89 ]] --[[ Name: OnClick ]]
                -- upvalues: v27 (copy)
                v27:refreshItems();
            end, 
            Tooltip = v26:getText("Tooltip", "Refresh"), 
            [v1.Tag] = "RefreshIcon"
        }) else nil, 
        GridSortButtonContainer = if v35.ViewType == v18.ViewType.Grid then v1.createElement(l_Pane_0, {
            LayoutOrder = v25:getNextOrder(), 
            [v1.Tag] = "HoverableButton X-Corner X-Middle X-Center"
        }, {
            GridSortButton = if v35.ViewType == v18.ViewType.Grid then v1.createElement(l_SelectInput_0, {
                LayoutOrder = v25:getNextOrder(), 
                ExpandIcon = v21.getImageHelper(v21.AvailableImages.SortIcon), 
                ShowSelection = false, 
                Items = v23, 
                OnItemActivated = function(v39) --[[ Line: 108 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: v27 (copy)
                    v27:addSort(v39);
                end, 
                OnRenderItem = function(v40, v41, v42) --[[ Line: 111 ]] --[[ Name: OnRenderItem ]]
                    -- upvalues: v34 (copy)
                    return v34(v40, v41, v42);
                end, 
                UseAutoWidth = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = v20:GetAttribute("FilterIconSize"), 
                [v1.Tag] = "MinimalButton"
            }) else nil
        }) else nil, 
        FilterDropdown = if not v30.ShowSearchOptions then v1.createElement(v11, {
            LayoutOrder = v25:getNextOrder(), 
            Items = v29
        }) else nil, 
        ViewTypeContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v25:getNextOrder(), 
            [v1.Tag] = "HoverableButton X-Corner X-Middle X-Center"
        }, {
            ViewTypeSelector = v1.createElement(l_ViewTypeSelector_0, {
                LayoutOrder = v25:getNextOrder(), 
                HideSlider = v35.ViewType == v18.ViewType.List, 
                OnGridTileSizeChanged = function(v43) --[[ Line: 135 ]] --[[ Name: OnGridTileSizeChanged ]]
                    -- upvalues: v35 (copy), v27 (copy)
                    local l_v43_0 = v43;
                    local v45 = nil;
                    if not l_v43_0 then
                        l_v43_0 = v35.GridSize;
                    end;
                    if not v45 then
                        v45 = v35.ViewType;
                    end;
                    v27:setLayout({
                        GridSize = l_v43_0, 
                        ViewType = v45
                    });
                end, 
                OnViewTypeSelected = function(v46) --[[ Line: 138 ]] --[[ Name: OnViewTypeSelected ]]
                    -- upvalues: v18 (ref), v35 (copy), v27 (copy)
                    local v47 = nil;
                    local v48 = v18.ViewType.fromRawValue(v46.rawValue());
                    if not v47 then
                        v47 = v35.GridSize;
                    end;
                    if not v48 then
                        v48 = v35.ViewType;
                    end;
                    v27:setLayout({
                        GridSize = v47, 
                        ViewType = v48
                    });
                end, 
                Default = v35.ViewType.rawValue(), 
                DefaultGridTileSize = v35.GridSize, 
                [v1.Tag] = "IconOnly"
            })
        }), 
        Separator = v1.createElement(l_Separator_0, {
            LayoutOrder = v25:getNextOrder(), 
            DominantAxis = Enum.DominantAxis.Height
        }), 
        BulkImportButton = v1.createElement(v10, {
            LayoutOrder = v25:getNextOrder()
        })
    });
end;