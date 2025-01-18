local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.InsertAsset);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_InsertAssetContext_0 = v1.Context.InsertAssetContext;
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v5.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_ComponentSymbols_0 = v5.Style.ComponentSymbols;
local l_UI_0 = v5.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v17 = require(l_Parent_0.Src.Util.Screens);
local v18 = require(l_Parent_0.Src.Util.View);
local v19 = require(l_Parent_0.Src.Components.ListItem);
local v20 = require(l_Parent_0.Src.Components.Tile);
local v21 = require(l_Parent_0.Src.Actions.SetAssets);
local v22 = require(l_Parent_0.Src.Thunks.GetAssets);
local v23 = require(l_Parent_0.Src.Thunks.LoadAllAliases);
local v24 = require(l_Parent_0.Src.Thunks.OnAssetDrag);
local v25 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v26 = require(l_Parent_0.Src.Thunks.OnScreenChange);
local v27 = require(l_Parent_0.Src.Thunks.UpdateSelectedAssets);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_BulkImportService_0 = game:GetService("BulkImportService");
local l_shouldEnableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).shouldEnableAudioImport;
local l_shouldEnableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).shouldEnableVideoImport;
local l_AssetManagerMigrateAliasesEndpoint2_0 = game:GetFastFlag("AssetManagerMigrateAliasesEndpoint2");
local v33 = v2.Component:extend("AssetGridContainer");
local function v36(v34) --[[ Line: 56 ]] --[[ Name: isSupportedBulkImportAssetScreen ]]
    -- upvalues: v17 (copy), l_shouldEnableAudioImport_0 (copy), l_shouldEnableVideoImport_0 (copy)
    local v35 = true;
    if v34.Path ~= v17.IMAGES.Path then
        v35 = true;
        if v34.Path ~= v17.MESHES.Path then
            v35 = l_shouldEnableAudioImport_0() and v34.Path == v17.AUDIO.Path or l_shouldEnableVideoImport_0() and v34.Path == v17.VIDEO.Path or v34.Path == v17.MODELS.Path;
        end;
    end;
    return v35;
end;
local function v44(v37, v38, v39) --[[ Line: 64 ]] --[[ Name: hasItemsToDisplay ]]
    -- upvalues: v17 (copy)
    if v38.Path == v17.MAIN.Path then
        for _, v41 in pairs(v17) do
            if v41.Path ~= v17.MAIN.Path then
                return true;
            end;
        end;
    else
        for _, v43 in pairs(v37) do
            if string.find(string.lower(v43.name), string.lower(v39), 1, true) then
                return true;
            end;
        end;
    end;
    return false;
end;
v33.init = function(v45) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v17 (copy)
    v45.state = {
        currentScreen = "", 
        currentView = ""
    };
    v45.hasItemsToDisplay = false;
    v45.gridLayoutRef = v2.createRef();
    v45.listLayoutRef = v2.createRef();
    v45.bulkImportFinishedConnection = nil;
    v45.importSessionFinishedConnection = nil;
    v45.onClearSelection = function() --[[ Line: 96 ]]
        -- upvalues: v45 (copy)
        if not v45.props.Enabled then
            return;
        else
            v45.props.dispatchUpdateSelectedAssets({});
            return;
        end;
    end;
    v45.onMouseButton2Click = function() --[[ Line: 103 ]]
        -- upvalues: v45 (copy), v17 (ref)
        local l_props_0 = v45.props;
        if not l_props_0.Enabled then
            return;
        else
            v45.props.dispatchUpdateSelectedAssets({});
            local l_CurrentScreen_0 = l_props_0.CurrentScreen;
            if l_CurrentScreen_0.Path == v17.PLACES.Path then
                l_props_0:dispatchOnAssetRightClick({
                    ClassName = "Folder", 
                    Screen = l_CurrentScreen_0
                });
            end;
            return;
        end;
    end;
    v45.onOpenAssetPreview = function(v48) --[[ Line: 120 ]]
        -- upvalues: v45 (copy)
        v45.props.dispatchUpdateSelectedAssets({
            [v48.key] = true
        });
        local v49 = v45.props.AssetsTable.assetPreviewData[v48.id];
        v45.props.OnOpenAssetPreview(v48, v49);
    end;
    v45.onAssetPreviewClose = function() --[[ Line: 128 ]]
        -- upvalues: v45 (copy)
        v45.props.OnAssetPreviewClose();
    end;
    v45.onAssetDrag = function(v50) --[[ Line: 132 ]]
        -- upvalues: v45 (copy)
        local l_props_1 = v45.props;
        local v52 = l_props_1.InsertAsset:get();
        l_props_1.dispatchOnAssetDrag(v52, v50, l_props_1.Analytics);
    end;
    v45.onOpenConfirmRemovePlaceDialog = function() --[[ Line: 138 ]]
        -- upvalues: v45 (copy)
        v45.props.OnOpenConfirmRemovePlaceDialog();
    end;
end;
v33.didMount = function(v53) --[[ Line: 143 ]] --[[ Name: didMount ]]
    -- upvalues: l_BulkImportService_0 (copy), v36 (copy), l_AssetManagerService_0 (copy)
    v53.bulkImportFinishedConnection = l_BulkImportService_0.BulkImportFinished:connect(function(v54) --[[ Line: 144 ]]
        -- upvalues: v53 (copy), v36 (ref)
        local l_props_2 = v53.props;
        local l_CurrentScreen_1 = l_props_2.CurrentScreen;
        if v54 == 1 and v36(l_CurrentScreen_1) then
            local v57 = l_props_2.API:get();
            l_props_2.dispatchSetAssets({
                assets = {}
            });
            l_props_2.dispatchGetAssets(v57, l_CurrentScreen_1.AssetType);
        end;
    end);
    v53.importSessionFinishedConnection = l_AssetManagerService_0.ImportSessionFinished:Connect(function() --[[ Line: 155 ]]
        -- upvalues: v53 (copy), v36 (ref)
        local l_props_3 = v53.props;
        local l_CurrentScreen_2 = l_props_3.CurrentScreen;
        if v36(l_CurrentScreen_2) then
            local v60 = l_props_3.API:get();
            l_props_3.dispatchSetAssets({
                assets = {}
            });
            l_props_3.dispatchGetAssets(v60, l_CurrentScreen_2.AssetType);
        end;
    end);
end;
v33.willUnmount = function(v61) --[[ Line: 166 ]] --[[ Name: willUnmount ]]
    if v61.bulkImportFinishedConnection then
        v61.bulkImportFinishedConnection:disconnect();
    end;
    if v61.importSessionFinishedConnection then
        v61.importSessionFinishedConnection:Disconnect();
    end;
end;
v33.createTiles = function(v62, _, v64, v65, v66, v67, v68, v69, v70, v71) --[[ Line: 176 ]] --[[ Name: createTiles ]]
    -- upvalues: v2 (copy), l_ComponentSymbols_0 (copy), v17 (copy), v20 (copy), l_StyleModifier_0 (copy)
    local v72 = 0;
    local v73 = {
        GridLayout = v2.createElement("UIGridLayout", {
            CellSize = v65[l_ComponentSymbols_0.Tile].Size, 
            CellPadding = v65.AssetGridContainer.CellPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v62.gridLayoutRef
        })
    };
    if v68.Path == v17.MAIN.Path then
        for _, v75 in pairs(v17) do
            if v75.Path ~= v17.MAIN.Path then
                local l_LayoutOrder_0 = v75.LayoutOrder;
                local v77 = v2.createElement(v20, {
                    AssetData = {
                        name = v64:getText("Folders", v75.Path), 
                        ClassName = "Folder", 
                        Screen = v75
                    }, 
                    LayoutOrder = v75.LayoutOrder, 
                    StyleModifier = v70[l_LayoutOrder_0] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v71
                });
                v73[v75.Path] = v77;
            end;
        end;
    else
        for _, v79 in pairs(v66) do
            if string.find(string.lower(v79.name), string.lower(v69), 1, true) then
                v79.key = v79.layoutOrder;
                local v80 = v2.createElement(v20, {
                    AssetData = v79, 
                    ModerationData = v67[v79.id], 
                    LayoutOrder = v79.layoutOrder, 
                    StyleModifier = v70[v79.layoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v71, 
                    OnOpenAssetPreview = v62.onOpenAssetPreview, 
                    OnAssetPreviewClose = v62.onAssetPreviewClose, 
                    OnAssetDrag = v62.onAssetDrag, 
                    OnOpenConfirmRemovePlaceDialog = v62.onOpenConfirmRemovePlaceDialog
                });
                v73[v79.id] = v80;
                v72 = v72 + 1;
            end;
        end;
    end;
    return v73, v72;
end;
v33.createListItems = function(v81, _, v83, _, v85, v86, v87, v88, v89, v90) --[[ Line: 241 ]] --[[ Name: createListItems ]]
    -- upvalues: v2 (copy), v17 (copy), v19 (copy), l_StyleModifier_0 (copy)
    local v91 = 0;
    local v92 = {
        ListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v81.listLayoutRef
        })
    };
    if v87.Path == v17.MAIN.Path then
        for _, v94 in pairs(v17) do
            if v94.Path ~= v17.MAIN.Path then
                local v95 = v2.createElement(v19, {
                    AssetData = {
                        name = v83:getText("Folders", v94.Path), 
                        ClassName = "Folder", 
                        Screen = v94
                    }, 
                    LayoutOrder = v94.LayoutOrder, 
                    StyleModifier = v89[v94.LayoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v90
                });
                v92[v94.Path] = v95;
            end;
        end;
    else
        for _, v97 in pairs(v85) do
            if string.find(string.lower(v97.name), string.lower(v88), 1, true) then
                v97.key = v97.layoutOrder;
                local v98 = v2.createElement(v19, {
                    AssetData = v97, 
                    ModerationData = v86[v97.id], 
                    LayoutOrder = v97.layoutOrder, 
                    StyleModifier = v89[v97.layoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v90, 
                    OnOpenAssetPreview = v81.onOpenAssetPreview, 
                    OnAssetPreviewClose = v81.onAssetPreviewClose, 
                    OnAssetDrag = v81.onAssetDrag, 
                    OnOpenConfirmRemovePlaceDialog = v81.onOpenConfirmRemovePlaceDialog
                });
                v92[v97.id] = v98;
                v91 = v91 + 1;
            end;
        end;
    end;
    return v92, v91;
end;
v33.didUpdate = function(v99) --[[ Line: 305 ]] --[[ Name: didUpdate ]]
    -- upvalues: v44 (copy)
    local l_props_4 = v99.props;
    local l_View_0 = l_props_4.View;
    if l_View_0 ~= v99.state.currentView then
        v99:setState({
            currentView = l_View_0
        });
    end;
    local l_assets_0 = l_props_4.AssetsTable.assets;
    local l_CurrentScreen_3 = l_props_4.CurrentScreen;
    local l_SearchTerm_0 = l_props_4.SearchTerm;
    local v105 = v44(l_assets_0, l_CurrentScreen_3, l_SearchTerm_0);
    if v105 ~= v99.hasItemsToDisplay then
        v99.hasItemsToDisplay = v105;
        if v105 then
            v99:setState({});
        end;
    end;
end;
v33.render = function(v106) --[[ Line: 328 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v17 (copy), l_AssetManagerMigrateAliasesEndpoint2_0 (copy), l_GetTextSize_0 (copy), v2 (copy), l_ScrollingFrame_0 (copy), l_Button_0 (copy), l_HoverArea_0 (copy), l_LoadingIndicator_0 (copy)
    local l_props_5 = v106.props;
    local v108 = l_props_5.API:get();
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Localization_0 = l_props_5.Localization;
    local l_Size_0 = l_props_5.Size;
    local l_LayoutOrder_1 = l_props_5.LayoutOrder;
    local l_Enabled_0 = l_props_5.Enabled;
    local l_AssetsTable_0 = l_props_5.AssetsTable;
    local l_assets_1 = l_AssetsTable_0.assets;
    local l_assetsModerationData_0 = l_AssetsTable_0.assetsModerationData;
    local l_nextPageCursor_0 = l_AssetsTable_0.nextPageCursor;
    local l_pageNumber_0 = l_AssetsTable_0.pageNumber;
    local l_CurrentScreen_4 = l_props_5.CurrentScreen;
    local l_IsFetchingAssets_0 = l_props_5.IsFetchingAssets;
    local l_SearchTerm_1 = l_props_5.SearchTerm;
    local l_SelectedAssets_0 = l_props_5.SelectedAssets;
    local l_dispatchGetAssets_0 = l_props_5.dispatchGetAssets;
    local l_dispatchLoadAllAliases_0 = l_props_5.dispatchLoadAllAliases;
    local l_View_1 = l_props_5.View;
    local v126 = nil;
    local v127 = nil;
    local v128 = nil;
    if l_View_1.Key == v18.LIST.Key then
        local v129, v130 = v106:createListItems(v108, l_Localization_0, l_Stylizer_0, l_assets_1, l_assetsModerationData_0, l_CurrentScreen_4, l_SearchTerm_1, l_SelectedAssets_0, l_Enabled_0);
        v126 = v129;
        v127 = v130;
        v128 = v106.listLayoutRef;
    elseif l_View_1.Key == v18.GRID.Key then
        local v131, v132 = v106:createTiles(v108, l_Localization_0, l_Stylizer_0, l_assets_1, l_assetsModerationData_0, l_CurrentScreen_4, l_SearchTerm_1, l_SelectedAssets_0, l_Enabled_0);
        v126 = v131;
        v127 = v132;
        v128 = v106.gridLayoutRef;
    end;
    local v133 = true;
    if l_CurrentScreen_4.Path ~= v17.MAIN.Path then
        v133 = v127 ~= 0;
    end;
    local v134 = nil;
    v134 = if l_AssetManagerMigrateAliasesEndpoint2_0 then l_nextPageCursor_0 ~= nil else l_pageNumber_0 ~= nil;
    local v135 = l_Localization_0:getText("AssetGrid", "NoResults", {
        assetType = l_Localization_0:getText("Folders", l_CurrentScreen_4.Path)
    });
    local v136 = l_GetTextSize_0(v135, l_Stylizer_0.FontSizeMedium, l_Stylizer_0.Font);
    local v137 = l_Localization_0:getText("AssetGrid", "LoadButton");
    local v138 = l_GetTextSize_0(v137, l_Stylizer_0.FontSizeLarge, l_Stylizer_0.Font);
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_1, 
        BackgroundTransparency = 1
    }, {
        AssetGrid = v133 and v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            NextPageRequestDistance = 100, 
            NextPageFunc = function() --[[ Line: 409 ]] --[[ Name: NextPageFunc ]]
                -- upvalues: l_nextPageCursor_0 (copy), l_dispatchGetAssets_0 (copy), v108 (copy), l_CurrentScreen_4 (copy), l_pageNumber_0 (copy)
                if l_nextPageCursor_0 then
                    l_dispatchGetAssets_0(v108, l_CurrentScreen_4.AssetType, l_nextPageCursor_0);
                    return;
                else
                    if l_pageNumber_0 then
                        l_dispatchGetAssets_0(v108, l_CurrentScreen_4.AssetType, nil, l_pageNumber_0);
                    end;
                    return;
                end;
            end
        }, v126), 
        ActionButton = v133 and v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v2.Event.Activated] = v106.onClearSelection, 
            [v2.Event.MouseButton2Click] = v106.onMouseButton2Click
        }), 
        NoResultsText = not v133 and not l_IsFetchingAssets_0 and not v134 and v2.createElement("TextLabel", {
            Size = UDim2.new(0, v136.X, 0, v136.Y), 
            Position = UDim2.new(0.5, 0, 0.3, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = v135, 
            TextColor3 = l_Stylizer_0.DisabledColor, 
            Font = l_Stylizer_0.Font, 
            TextSize = l_Stylizer_0.FontSizeMedium, 
            BackgroundTransparency = 1
        }), 
        LoadButton = not v133 and not l_IsFetchingAssets_0 and v134 and v2.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = v137, 
            Size = UDim2.new(0, v138.X + l_Stylizer_0.AssetGridContainer.LoadButton.PaddingX, 0, v138.Y + l_Stylizer_0.AssetGridContainer.LoadButton.PaddingY), 
            Position = UDim2.new(0.5, 0, 0.3, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = function() --[[ Line: 459 ]] --[[ Name: OnClick ]]
                -- upvalues: l_dispatchLoadAllAliases_0 (copy), v108 (copy), l_CurrentScreen_4 (copy)
                l_dispatchLoadAllAliases_0(v108, l_CurrentScreen_4.AssetType);
            end
        }, {
            v2.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        LoadingIndicator = l_IsFetchingAssets_0 and v2.createElement(l_LoadingIndicator_0, {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 2
        })
    });
end;
v33 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    InsertAsset = l_InsertAssetContext_0, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v33);
return v3.connect(function(v139, _) --[[ Line: 483 ]] --[[ Name: mapStateToProps ]]
    local l_AssetManagerReducer_0 = v139.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        CurrentScreen = v139.Screen.currentScreen, 
        IsFetchingAssets = l_AssetManagerReducer_0.isFetchingAssets, 
        SearchTerm = l_AssetManagerReducer_0.searchTerm, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets, 
        View = l_AssetManagerReducer_0.view
    };
end, function(v142) --[[ Line: 495 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v23 (copy), v25 (copy), v24 (copy), v26 (copy), v21 (copy), v27 (copy)
    return {
        dispatchGetAssets = function(v143, v144, v145, v146) --[[ Line: 497 ]] --[[ Name: dispatchGetAssets ]]
            -- upvalues: v142 (copy), v22 (ref)
            v142(v22(v143, v144, v145, v146));
        end, 
        dispatchLoadAllAliases = function(v147, v148) --[[ Line: 500 ]] --[[ Name: dispatchLoadAllAliases ]]
            -- upvalues: v142 (copy), v23 (ref)
            v142(v23(v147, v148));
        end, 
        dispatchOnAssetRightClick = function(v149, v150) --[[ Line: 503 ]] --[[ Name: dispatchOnAssetRightClick ]]
            -- upvalues: v142 (copy), v25 (ref)
            v149.AssetData = v150;
            v142(v25(v149));
        end, 
        dispatchOnAssetDrag = function(v151, v152, v153) --[[ Line: 507 ]] --[[ Name: dispatchOnAssetDrag ]]
            -- upvalues: v142 (copy), v24 (ref)
            v142(v24(v151, v152, v153));
        end, 
        dispatchOnScreenChange = function(v154, v155) --[[ Line: 510 ]] --[[ Name: dispatchOnScreenChange ]]
            -- upvalues: v142 (copy), v26 (ref)
            v142(v26(v154, v155));
        end, 
        dispatchSetAssets = function(v156) --[[ Line: 513 ]] --[[ Name: dispatchSetAssets ]]
            -- upvalues: v142 (copy), v21 (ref)
            v142(v21(v156));
        end, 
        dispatchUpdateSelectedAssets = function(v157) --[[ Line: 516 ]] --[[ Name: dispatchUpdateSelectedAssets ]]
            -- upvalues: v142 (copy), v27 (ref)
            v142(v27(v157));
        end
    };
end)(v33);