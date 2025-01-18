local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_copy_0 = v3.copy;
local l_join_0 = v3.join;
local l_keys_0 = v3.keys;
local l_Signal_0 = v1.Util.Signal;
local v8 = require(l_script_FirstAncestor_0.Src.Util.getAssetInfosSlice);
local v9 = require(l_script_FirstAncestor_0.Src.Util.insertItems);
local v10 = require(l_script_FirstAncestor_0.Src.Types);
local l_AssetInfoField_0 = v10.AssetInfoField;
local v12 = require(l_script_FirstAncestor_0.Src.Util.renderContextMenu);
local v13 = require(l_script_FirstAncestor_0.Src.Util.compareInfoField);
local v14 = require(l_script_FirstAncestor_0.Src.Util.applyInfoFieldFilter);
local v15 = require(l_script_FirstAncestor_0.Src.Analytics);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrAnalytics);
local v18 = UDim.new(0, 150);
local v19 = {
    Key = v10.AssetInfoField.Modified, 
    IsAscending = false
};
local v20 = l_ContextItem_0:extend("ItemsController");
local function _(v21) --[[ Line: 41 ]] --[[ Name: isDefaultSort ]]
    -- upvalues: v19 (copy)
    if #v21 ~= 1 then
        return false;
    else
        local v22 = v21[1];
        local v23 = false;
        if v22.Key == v19.Key then
            v23 = v22.IsAscending == v19.IsAscending;
        end;
        return v23;
    end;
end;
local function v29(v25, v26) --[[ Line: 49 ]] --[[ Name: passesFilters ]]
    -- upvalues: v14 (copy)
    for v27, v28 in v26 do
        assert(v14[v27], (("No filter function for field %*"):format(v27)));
        if not v14[v27](v25, v28) then
            return false;
        end;
    end;
    return true;
end;
local function v35(v30, v31) --[[ Line: 59 ]] --[[ Name: getFilteredItemsList ]]
    -- upvalues: v3 (copy), v29 (copy)
    if next(v31, nil) == nil then
        return v3.values(v30);
    else
        local v32 = {};
        for _, v34 in v30 do
            if v29(v34, v31) then
                table.insert(v32, v34);
            end;
        end;
        return v32;
    end;
end;
local _ = function(v36, v37) --[[ Line: 76 ]] --[[ Name: sortItems ]]
    -- upvalues: v13 (copy)
    local function v43(v38, v39) --[[ Line: 77 ]] --[[ Name: compare ]]
        -- upvalues: v37 (copy), v13 (ref)
        if #v37 == 0 and v38.SearchRank and v39.SearchRank and v38.SearchRank ~= v39.SearchRank then
            return v38.SearchRank < v39.SearchRank;
        else
            for _, v41 in v37 do
                local v42 = v13[v41.Key](v38, v39, v41.IsAscending);
                if v42 ~= 0 then
                    return v42 == 1;
                end;
            end;
            return false;
        end;
    end;
    table.sort(v36, v43);
end;
local _ = function(v45, v46, v47) --[[ Line: 97 ]] --[[ Name: generateRenderItems ]]
    -- upvalues: v35 (copy), v13 (copy)
    local v48 = v35(v45, v47);
    local function v54(v49, v50) --[[ Line: 77 ]] --[[ Name: compare ]]
        -- upvalues: v46 (copy), v13 (ref)
        if #v46 == 0 and v49.SearchRank and v50.SearchRank and v49.SearchRank ~= v50.SearchRank then
            return v49.SearchRank < v50.SearchRank;
        else
            for _, v52 in v46 do
                local v53 = v13[v52.Key](v49, v50, v52.IsAscending);
                if v53 ~= 0 then
                    return v53 == 1;
                end;
            end;
            return false;
        end;
    end;
    table.sort(v48, v54);
    return v48;
end;
v20.new = function(v56, v57, v58, v59) --[[ Line: 103 ]] --[[ Name: new ]]
    -- upvalues: l_AssetInfoField_0 (copy), v10 (copy), v19 (copy), v15 (copy), l_Signal_0 (copy), v20 (copy), l_copy_0 (copy), v35 (copy), v13 (copy), v18 (copy), l_join_0 (copy), v16 (copy), v3 (copy), v17 (copy)
    local v60 = {
        _isMock = v59, 
        _pluginController = v56, 
        _searchController = v57, 
        _networking = v58, 
        _visibleProperties = {
            l_AssetInfoField_0.DisplayName, 
            l_AssetInfoField_0.AssetId, 
            l_AssetInfoField_0.AssetType, 
            l_AssetInfoField_0.Modified, 
            l_AssetInfoField_0.Creator
        }, 
        _scope = v56:getUser(), 
        _layout = {
            GridSize = 100, 
            ViewType = v10.ViewType.List
        }, 
        _columnWidths = {}, 
        _items = {}, 
        _renderItems = {}, 
        _creators = {}, 
        _filters = {}, 
        _sorts = {
            v19
        }, 
        _selection = {}, 
        _prevClickIndex = 1, 
        _usingShift = false, 
        _usingCtrl = false, 
        _fetchProgressInfo = {
            FetchProgress = 0, 
            IsLoading = false
        }, 
        _analyticsState = {
            InsertSource = v15.Enums.InsertSource.SOURCE_INVALID, 
            InsertAction = v15.Enums.InsertAction.ACTION_INVALID
        }, 
        OnFetchProgressInfoChanged = l_Signal_0.new(), 
        OnLayoutChanged = l_Signal_0.new(), 
        OnVisiblePropertiesChanged = l_Signal_0.new(), 
        OnColumnWidthsChanged = l_Signal_0.new(), 
        OnItemsChanged = l_Signal_0.new(), 
        OnItemSelectionChanged = l_Signal_0.new(), 
        OnSortFilterChanged = l_Signal_0.new()
    };
    setmetatable(v60, v20);
    v60._updateProgressInfo = function(v61, v62) --[[ Line: 150 ]]
        -- upvalues: v60 (copy), l_copy_0 (ref)
        local l__fetchProgressInfo_0 = v60._fetchProgressInfo;
        l__fetchProgressInfo_0.FetchProgress = if v61 ~= nil then v61 else l__fetchProgressInfo_0.FetchProgress;
        l__fetchProgressInfo_0.IsLoading = if v62 ~= nil then v62 else l__fetchProgressInfo_0.IsLoading;
        v60.OnFetchProgressInfoChanged:Fire(l_copy_0(l__fetchProgressInfo_0));
    end;
    v60._updateRenderItems = function() --[[ Line: 157 ]]
        -- upvalues: v60 (copy), v35 (ref), v13 (ref)
        local l_v60_0 = v60;
        local l__items_0 = v60._items;
        local l__sorts_0 = v60._sorts;
        local l__filters_0 = v60._filters;
        local v68 = v35(l__items_0, l__filters_0);
        local function v74(v69, v70) --[[ Line: 77 ]] --[[ Name: compare ]]
            -- upvalues: l__sorts_0 (copy), v13 (ref)
            if #l__sorts_0 == 0 and v69.SearchRank and v70.SearchRank and v69.SearchRank ~= v70.SearchRank then
                return v69.SearchRank < v70.SearchRank;
            else
                for _, v72 in l__sorts_0 do
                    local v73 = v13[v72.Key](v69, v70, v72.IsAscending);
                    if v73 ~= 0 then
                        return v73 == 1;
                    end;
                end;
                return false;
            end;
        end;
        table.sort(v68, v74);
        l_v60_0._renderItems = v68;
        v60.OnItemsChanged:Fire(v60._renderItems);
    end;
    v60._inputConnection = v60._pluginController.OnInputChanged:Connect(function(v75) --[[ Line: 163 ]]
        -- upvalues: v60 (copy)
        v60._usingShift = v75[Enum.KeyCode.LeftShift] or v75[Enum.KeyCode.RightShift];
        v60._usingCtrl = v75[Enum.KeyCode.LeftControl] or v75[Enum.KeyCode.RightControl] or v75[Enum.KeyCode.LeftMeta] or v75[Enum.KeyCode.RightMeta];
    end);
    v60._progressConnection = v60._networking.OnFetchProgressChanged:Connect(function(v76) --[[ Line: 173 ]]
        -- upvalues: v60 (copy)
        v60._updateProgressInfo(v76);
    end);
    v60._fetchFinishedConnection = v60._networking.OnFetchFinished:Connect(function() --[[ Line: 177 ]]
        -- upvalues: v60 (copy)
        v60._updateProgressInfo(nil, false);
    end);
    for v77, _ in v60._visibleProperties do
        v60._columnWidths[v77] = v18;
    end;
    v60._clearItems = function() --[[ Line: 186 ]]
        -- upvalues: v60 (copy)
        v60._networking:makeFetchRequestsStale();
        v60._items = {};
        v60._creators = {};
        v60.OnItemsChanged:Fire(v60._items);
        v60._updateProgressInfo(0, false);
    end;
    v60._fetchAssetsCallback = function(v79, v80) --[[ Line: 195 ]]
        -- upvalues: v60 (copy), v10 (ref), l_join_0 (ref), v35 (ref), v13 (ref)
        for _, v82 in v79 do
            if not v60._items[v82.AssetId] or v60._items[v82.AssetId].AssetType ~= v10.AssetType.Package then
                v60._items[v82.AssetId] = v82;
            end;
        end;
        v60._creators = l_join_0(v60._creators, v80);
        local l_v60_1 = v60;
        local l__items_1 = v60._items;
        local l__sorts_1 = v60._sorts;
        local l__filters_1 = v60._filters;
        local v87 = v35(l__items_1, l__filters_1);
        local function v93(v88, v89) --[[ Line: 77 ]] --[[ Name: compare ]]
            -- upvalues: l__sorts_1 (copy), v13 (ref)
            if #l__sorts_1 == 0 and v88.SearchRank and v89.SearchRank and v88.SearchRank ~= v89.SearchRank then
                return v88.SearchRank < v89.SearchRank;
            else
                for _, v91 in l__sorts_1 do
                    local v92 = v13[v91.Key](v88, v89, v91.IsAscending);
                    if v92 ~= 0 then
                        return v92 == 1;
                    end;
                end;
                return false;
            end;
        end;
        table.sort(v87, v93);
        l_v60_1._renderItems = v87;
        v60.OnItemsChanged:Fire(v60._renderItems);
    end;
    v60._fetchAssetsErrorCallback = function(v94, v95) --[[ Line: 213 ]]
        -- upvalues: v16 (ref), v3 (ref)
        if v16() then
            warn((("Error fetching assets: %*"):format((v3.pretty(v94)))));
            if v95 then
                warn((("Status code: %*"):format(v95)));
            end;
        end;
    end;
    local v96 = {
        Id = v60._pluginController:getUser().Id, 
        Scope = v60._pluginController:getUser().Scope
    };
    v60._updateProgressInfo(0, true);
    v60._networking:fetchAssetsAsync(v96, v60._fetchAssetsCallback, v60._fetchAssetsErrorCallback);
    v60._clearAndFetchNewItems = function() --[[ Line: 229 ]]
        -- upvalues: v60 (copy)
        v60._clearItems();
        v60._updateProgressInfo(0, true);
        local v97 = {
            Id = v60._scope.Id, 
            Scope = v60._scope.Scope
        };
        v60._networking:fetchAssetsAsync(v97, v60._fetchAssetsCallback, v60._fetchAssetsErrorCallback);
    end;
    v60._explorerSelectionConnection = v60._pluginController.OnSelectionChanged:Connect(function(v98) --[[ Line: 241 ]]
        -- upvalues: v60 (copy), v17 (ref), v15 (ref)
        if v98.Id == v60._scope.Id then
            return;
        else
            v60._scope = v98;
            v60._clearAndFetchNewItems();
            if v17() then
                v60._analyticsState.InsertSource = v15.Enums.InsertSource.SOURCE_BROWSE;
            end;
            return;
        end;
    end);
    v60._clearAndFetchSearchItems = function() --[[ Line: 255 ]]
        -- upvalues: v60 (copy), l_copy_0 (ref)
        v60._clearItems();
        v60._sorts = {};
        v60._filters = {};
        v60.OnSortFilterChanged:Fire(l_copy_0(v60._sorts), l_copy_0(v60._filters));
        v60._updateProgressInfo(0, true);
        local v99 = v60._searchController:getSearchOptions();
        local v100 = {
            SearchTerm = v60._searchController:getSearchTerm(), 
            AssetType = v99.AssetType, 
            ScopeInfo = v99.Source
        };
        v60._networking:searchAssetsAsync(v100, v60._fetchAssetsCallback, v60._fetchAssetsErrorCallback);
    end;
    v60._searchRequestedConnection = v60._searchController.OnSearchRequested:Connect(function() --[[ Line: 271 ]]
        -- upvalues: v60 (copy)
        v60._clearAndFetchSearchItems();
    end);
    v60._searchShowOptionsConnection = v60._searchController.OnShowSearchOptionsChanged:Connect(function(v101) --[[ Line: 276 ]]
        -- upvalues: v60 (copy), v17 (ref), v15 (ref)
        if v101 then
            v60._clearItems();
            v60:clearFilters();
        else
            v60._clearAndFetchNewItems();
        end;
        if v17() then
            v60._analyticsState.InsertSource = v15.Enums.InsertSource.SOURCE_SEARCH;
        end;
    end);
    v60._searchClosedConnection = v60._searchController.OnSearchClosed:Connect(function() --[[ Line: 289 ]]
        -- upvalues: v60 (copy)
        v60._clearAndFetchNewItems();
    end);
    return v60;
end;
v20.mock = function(v102, v103, v104) --[[ Line: 296 ]] --[[ Name: mock ]]
    -- upvalues: v20 (copy)
    return v20.new(v102, v103, v104, true);
end;
v20.destroy = function(v105) --[[ Line: 300 ]] --[[ Name: destroy ]]
    v105._explorerSelectionConnection:Disconnect();
    v105._explorerSelectionConnection = nil;
    v105._inputConnection:Disconnect();
    v105._inputConnection = nil;
    v105._progressConnection:Disconnect();
    v105._progressConnection = nil;
    v105._fetchFinishedConnection:Disconnect();
    v105._fetchFinishedConnection = nil;
    v105._searchRequestedConnection:Disconnect();
    v105._searchRequestedConnection = nil;
    v105._searchShowOptionsConnection:Disconnect();
    v105._searchShowOptionsConnection = nil;
    v105._visibleProperties = nil;
    v105._columnWidths = nil;
    v105._items = nil;
    v105._creators = nil;
    v105._filters = nil;
    v105._sorts = nil;
    v105._selection = nil;
end;
v20.refreshItems = function(v106) --[[ Line: 322 ]] --[[ Name: refreshItems ]]
    v106._clearAndFetchNewItems();
end;
v20.getLayout = function(v107) --[[ Line: 326 ]] --[[ Name: getLayout ]]
    return v107._layout;
end;
v20.setLayout = function(v108, v109) --[[ Line: 330 ]] --[[ Name: setLayout ]]
    v108._layout = v109;
    v108.OnLayoutChanged:Fire(v108._layout);
end;
v20._addColumnWidth = function(v110) --[[ Line: 335 ]] --[[ Name: _addColumnWidth ]]
    -- upvalues: l_copy_0 (copy), v18 (copy)
    local v111 = l_copy_0(v110._columnWidths);
    table.insert(v111, v18);
    v110._columnWidths = v111;
    v110.OnColumnWidthsChanged:Fire(v111);
end;
v20._removeColumnWidth = function(v112, v113) --[[ Line: 342 ]] --[[ Name: _removeColumnWidth ]]
    -- upvalues: l_copy_0 (copy)
    local v114 = l_copy_0(v112._columnWidths);
    table.remove(v114, v113);
    v112._columnWidths = v114;
    v112.OnColumnWidthsChanged:Fire(v114);
end;
v20.getColumnWidths = function(v115) --[[ Line: 349 ]] --[[ Name: getColumnWidths ]]
    return v115._columnWidths;
end;
v20.setColumnWidths = function(v116, v117) --[[ Line: 355 ]] --[[ Name: setColumnWidths ]]
    v116._columnWidths = v117;
    v116.OnColumnWidthsChanged:Fire(v116._columnWidths);
end;
v20.getVisibleProperties = function(v118) --[[ Line: 360 ]] --[[ Name: getVisibleProperties ]]
    return v118._visibleProperties;
end;
v20.setVisibleProperties = function(v119, v120) --[[ Line: 364 ]] --[[ Name: setVisibleProperties ]]
    -- upvalues: l_copy_0 (copy)
    v119._visibleProperties = v120;
    v119.OnVisiblePropertiesChanged:Fire(l_copy_0(v119._visibleProperties));
end;
v20.getVisiblePropertyIndex = function(v121, v122) --[[ Line: 369 ]] --[[ Name: getVisiblePropertyIndex ]]
    -- upvalues: v3 (copy)
    return v3.findIndex(v121._visibleProperties, function(v123) --[[ Line: 370 ]]
        -- upvalues: v122 (copy)
        return v122 == v123;
    end);
end;
v20.toggleVisibleProperty = function(v124, v125) --[[ Line: 375 ]] --[[ Name: toggleVisibleProperty ]]
    -- upvalues: l_copy_0 (copy)
    local l__visibleProperties_0 = v124._visibleProperties;
    local v127 = v124:getVisiblePropertyIndex(v125);
    if v127 then
        table.remove(l__visibleProperties_0, v127);
        v124:_removeColumnWidth(v127);
    else
        table.insert(l__visibleProperties_0, v125);
        v124:_addColumnWidth();
    end;
    v124.OnVisiblePropertiesChanged:Fire(l_copy_0(v124._visibleProperties));
end;
v20.getItems = function(v128) --[[ Line: 388 ]] --[[ Name: getItems ]]
    return v128._items;
end;
v20.getRenderItems = function(v129) --[[ Line: 392 ]] --[[ Name: getRenderItems ]]
    return v129._renderItems;
end;
v20.getCreators = function(v130) --[[ Line: 396 ]] --[[ Name: getCreators ]]
    -- upvalues: l_keys_0 (copy)
    local v131 = l_keys_0(v130._creators);
    table.sort(v131);
    return v131;
end;
v20._updateSortFilter = function(v132) --[[ Line: 402 ]] --[[ Name: _updateSortFilter ]]
    -- upvalues: l_copy_0 (copy)
    v132:_updateRenderItems();
    v132.OnSortFilterChanged:Fire(l_copy_0(v132._sorts), l_copy_0(v132._filters));
end;
v20.getFilters = function(v133) --[[ Line: 407 ]] --[[ Name: getFilters ]]
    return v133._filters;
end;
v20._addFilter = function(v134, v135, v136) --[[ Line: 411 ]] --[[ Name: _addFilter ]]
    -- upvalues: l_join_0 (copy)
    if v134._filters[v135] then
        v134._filters[v135] = l_join_0(v134._filters[v135], v136);
        return;
    else
        v134._filters[v135] = v136;
        return;
    end;
end;
v20._removeFilter = function(v137, v138, v139) --[[ Line: 419 ]] --[[ Name: _removeFilter ]]
    for _, v141 in v139 do
        v137._filters[v138][v141] = nil;
        if next(v137._filters[v138]) == nil then
            v137._filters[v138] = nil;
        end;
    end;
end;
v20.hasFilter = function(v142, v143, v144) --[[ Line: 428 ]] --[[ Name: hasFilter ]]
    return v142._filters[v143] and v142._filters[v143][v144];
end;
v20.toggleFilter = function(v145, v146, v147) --[[ Line: 433 ]] --[[ Name: toggleFilter ]]
    if v145:hasFilter(v146, v147) then
        v145:_removeFilter(v146, {
            v147
        });
    else
        v145:_addFilter(v146, {
            [v147] = true
        });
    end;
    v145:_updateSortFilter();
end;
v20.clearFilters = function(v148) --[[ Line: 442 ]] --[[ Name: clearFilters ]]
    v148._filters = {};
    v148:_updateSortFilter();
end;
v20.getSorts = function(v149) --[[ Line: 447 ]] --[[ Name: getSorts ]]
    return v149._sorts;
end;
v20.setSorts = function(v150, v151) --[[ Line: 451 ]] --[[ Name: setSorts ]]
    v150._sorts = v151;
    v150:_updateSortFilter();
end;
v20.addSort = function(v152, v153) --[[ Line: 456 ]] --[[ Name: addSort ]]
    local v154 = false;
    for v155, v156 in v152._sorts do
        if v156.Key == v153 then
            v154 = not v156.IsAscending;
            table.remove(v152._sorts, v155);
            break;
        end;
    end;
    local v157 = {
        Key = v153, 
        IsAscending = v154
    };
    table.insert(v152._sorts, 1, v157);
    v152:_updateSortFilter();
end;
v20.getSelection = function(v158) --[[ Line: 470 ]] --[[ Name: getSelection ]]
    return v158._selection;
end;
v20.setSelection = function(v159, v160) --[[ Line: 474 ]] --[[ Name: setSelection ]]
    v159._selection = {};
    for _, v162 in v160 do
        v159._selection[v162] = true;
    end;
    v159.OnItemSelectionChanged:Fire(v159._selection);
end;
v20.modifySelection = function(v163, v164) --[[ Line: 482 ]] --[[ Name: modifySelection ]]
    -- upvalues: l_copy_0 (copy)
    for _, v166 in v164 do
        if v163._selection[v166] then
            v163._selection[v166] = nil;
        else
            v163._selection[v166] = true;
        end;
    end;
    v163.OnItemSelectionChanged:Fire(l_copy_0(v163._selection));
end;
v20.getPrevClickIndex = function(v167) --[[ Line: 493 ]] --[[ Name: getPrevClickIndex ]]
    return v167._prevClickIndex;
end;
v20.handleClick = function(v168, v169, v170, v171, v172) --[[ Line: 498 ]] --[[ Name: handleClick ]]
    -- upvalues: v8 (copy), v17 (copy), v15 (copy), v9 (copy)
    local v173 = v8(v170, v168._prevClickIndex, v171);
    if v172 then
        if v17() then
            v168:setAnalyticsInsertAction(v15.Enums.InsertAction.ACTION_DOUBLECLICK);
        end;
        v9(v168, v168._networking);
        return;
    elseif v168._usingCtrl then
        v168:modifySelection({
            v169
        });
        v168._prevClickIndex = v171;
        return;
    elseif v168._usingShift then
        v168:setSelection(v173);
        return;
    else
        v168:setSelection({
            v169
        });
        v168._prevClickIndex = v171;
        return;
    end;
end;
v20.handleRightClick = function(v174, v175, v176, v177) --[[ Line: 523 ]] --[[ Name: handleRightClick ]]
    -- upvalues: v12 (copy), v10 (copy)
    if not v174._selection[v175] then
        v174:setSelection({
            v175
        });
        v174._prevClickIndex = v176;
    end;
    v12[v10.MenuContext.Asset](v174, v174._networking, v177, v174._isMock);
end;
v20.handleSortRightClick = function(v178, v179) --[[ Line: 531 ]] --[[ Name: handleSortRightClick ]]
    -- upvalues: v12 (copy), v10 (copy)
    v12[v10.MenuContext.Column](v178, v179);
end;
v20.getProgressInfo = function(v180) --[[ Line: 535 ]] --[[ Name: getProgressInfo ]]
    return v180._fetchProgressInfo;
end;
v20.setAnalyticsInsertAction = function(v181, v182) --[[ Line: 539 ]] --[[ Name: setAnalyticsInsertAction ]]
    v181._analyticsState.InsertAction = v182;
end;
v20.sendInsertToAnalytics = function(v183) --[[ Line: 543 ]] --[[ Name: sendInsertToAnalytics ]]
    -- upvalues: v15 (copy), v3 (copy), v19 (copy)
    local v184 = {};
    for v185, _ in v183._selection do
        v184[v183._items[v185].AssetType] = true;
    end;
    local l_sendInsertEvent_0 = v15.sendInsertEvent;
    local v188 = {
        insertSource = v183._analyticsState.InsertSource, 
        insertAction = v183._analyticsState.InsertAction, 
        insertSelectionSize = #v3.keys(v183._selection)
    };
    local v189 = next(v183._filters, nil);
    if not v189 then
        local l__sorts_2 = v183._sorts;
        if #l__sorts_2 ~= 1 then
            v189 = false;
        else
            local v191 = l__sorts_2[1];
            v189 = false;
            if v191.Key == v19.Key then
                v189 = v191.IsAscending == v19.IsAscending;
            end;
        end;
    end;
    v188.appliedFilterOrSort = v189;
    v188.insertedAssetTypes = v3.keys(v184);
    l_sendInsertEvent_0(v188, v183._isMock);
end;
v20.getPlugin = function(v192) --[[ Line: 558 ]] --[[ Name: getPlugin ]]
    return v192._pluginController:getPlugin();
end;
return v20;