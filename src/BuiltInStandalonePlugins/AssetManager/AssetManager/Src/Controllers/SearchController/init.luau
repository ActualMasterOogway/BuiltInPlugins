local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local v5 = l_ContextItem_0:extend("SearchController");
v5.new = function(v6, v7, v8, v9) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Signal_0 (copy), v5 (copy)
    local v10 = {
        _isMock = v9, 
        _networking = v8, 
        _pluginController = v6, 
        _explorerController = v7, 
        _searchTerm = "", 
        _searchOptions = {
            AssetType = v4.AssetType.Model, 
            Source = v7:getSelection()
        }, 
        _sourceList = {}, 
        _sourceFilter = "", 
        _showSearchOptions = false, 
        _isDefaultSearchState = true, 
        OnSearchRequested = l_Signal_0.new(), 
        OnSearchTermChanged = l_Signal_0.new(), 
        OnSearchOptionsChanged = l_Signal_0.new(), 
        OnSourceListChanged = l_Signal_0.new(), 
        OnShowSearchOptionsChanged = l_Signal_0.new(), 
        OnIsDefaultSearchStateChanged = l_Signal_0.new(), 
        OnSearchClosed = l_Signal_0.new()
    };
    v10._updateSourceList = function() --[[ Line: 42 ]]
        -- upvalues: v10 (copy), v4 (ref)
        v10._sourceList = {};
        for _, v12 in (v10._explorerController:getExplorerItems()) do
            local v13 = true;
            if v12.Scope ~= v4.Scope.User then
                v13 = v12.Scope == v4.Scope.Group;
            end;
            local v14 = string.find(v12.Name:lower(), v10._sourceFilter:lower());
            if v13 and v14 then
                v10._sourceList[v12.Id] = v12;
            end;
        end;
        v10.OnSourceListChanged:Fire(table.clone(v10._sourceList));
        return v10._sourceList;
    end;
    v10._explorerItemsChangedConnection = v10._explorerController.OnExplorerItemsChanged:Connect(function() --[[ Line: 56 ]]
        -- upvalues: v10 (copy)
        v10._updateSourceList();
    end);
    v10._explorerSelectionConnection = v10._pluginController.OnSelectionChanged:Connect(function(v15) --[[ Line: 62 ]]
        -- upvalues: v10 (copy)
        v10._searchOptions.Source = v15;
    end);
    setmetatable(v10, v5);
    return v10;
end;
v5.mock = function(v16, v17, v18) --[[ Line: 72 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy)
    return v5.new(v16, v17, v18, true);
end;
v5.destroy = function(v19) --[[ Line: 76 ]] --[[ Name: destroy ]]
    v19.OnSearchTermChanged = nil;
    v19.OnSearchOptionsChanged = nil;
    v19.OnSearchClosed = nil;
    v19.OnSearchRequested = nil;
    v19.OnSourceListChanged = nil;
    v19._explorerItemsChangedConnection:Disconnect();
    v19._explorerItemsChangedConnection = nil;
    v19._explorerSelectionConnection:Disconnect();
    v19._explorerSelectionConnection = nil;
end;
v5.getSearchTerm = function(v20) --[[ Line: 89 ]] --[[ Name: getSearchTerm ]]
    return v20._searchTerm;
end;
v5.setSearchTerm = function(v21, v22) --[[ Line: 93 ]] --[[ Name: setSearchTerm ]]
    v21._searchTerm = v22;
    if v21._searchTerm == "" then
        v21._isDefaultSearchState = true;
        v21.OnIsDefaultSearchStateChanged:Fire(v21._isDefaultSearchState);
    end;
    v21.OnSearchTermChanged:Fire(v21._searchTerm);
end;
v5.requestSearch = function(v23) --[[ Line: 102 ]] --[[ Name: requestSearch ]]
    if v23._searchTerm == "" then
        return;
    else
        v23._isDefaultSearchState = false;
        v23.OnIsDefaultSearchStateChanged:Fire(v23._isDefaultSearchState);
        v23.OnSearchRequested:Fire();
        return;
    end;
end;
v5.getSearchOptions = function(v24) --[[ Line: 111 ]] --[[ Name: getSearchOptions ]]
    return table.clone(v24._searchOptions);
end;
v5.setSearchOptions = function(v25, v26) --[[ Line: 115 ]] --[[ Name: setSearchOptions ]]
    v25._searchOptions = v26;
    if v25._searchTerm ~= "" then
        v25.OnSearchOptionsChanged:Fire(table.clone(v25._searchOptions));
        v25.OnSearchRequested:Fire();
    end;
end;
v5.setSource = function(v27, v28) --[[ Line: 123 ]] --[[ Name: setSource ]]
    if v28 ~= v27._searchOptions.Source.Id then
        local v29 = v27._sourceList[v28];
        if v29 == nil then
            return;
        else
            v27._searchOptions.Source = v29;
            if v27._searchTerm ~= "" then
                v27.OnSearchOptionsChanged:Fire(table.clone(v27._searchOptions));
                v27.OnSearchRequested:Fire();
            end;
        end;
    end;
end;
v5.setSourceFilter = function(v30, v31) --[[ Line: 138 ]] --[[ Name: setSourceFilter ]]
    v30._sourceFilter = v31;
    v30._updateSourceList();
end;
v5.getSourceList = function(v32) --[[ Line: 143 ]] --[[ Name: getSourceList ]]
    return v32._sourceList;
end;
v5.setAssetTypeFilter = function(v33, v34) --[[ Line: 147 ]] --[[ Name: setAssetTypeFilter ]]
    v33._searchOptions.AssetType = v34;
    v33.OnSearchOptionsChanged:Fire(table.clone(v33._searchOptions));
    if v33._searchTerm ~= "" then
        v33.OnSearchRequested:Fire();
    end;
end;
v5.getIsDefaultSearchState = function(v35) --[[ Line: 155 ]] --[[ Name: getIsDefaultSearchState ]]
    return v35._isDefaultSearchState;
end;
v5.getShowSearchOptions = function(v36) --[[ Line: 159 ]] --[[ Name: getShowSearchOptions ]]
    return v36._showSearchOptions;
end;
v5.showSearchOptions = function(v37) --[[ Line: 163 ]] --[[ Name: showSearchOptions ]]
    if v37._showSearchOptions ~= true then
        v37._showSearchOptions = true;
        v37._isDefaultSearchState = true;
        v37.OnIsDefaultSearchStateChanged:Fire(v37._isDefaultSearchState);
        v37.OnShowSearchOptionsChanged:Fire(true);
    end;
end;
v5.hideSearchOptions = function(v38) --[[ Line: 172 ]] --[[ Name: hideSearchOptions ]]
    -- upvalues: v4 (copy)
    if v38._showSearchOptions ~= false then
        v38._showSearchOptions = false;
        v38.OnShowSearchOptionsChanged:Fire(false);
        v38:setSourceFilter("");
        v38:setSearchTerm("");
        v38._searchOptions = {
            AssetType = v4.AssetType.Model, 
            Source = v38._explorerController:getSelection()
        };
        v38.OnSearchOptionsChanged:Fire(table.clone(v38._searchOptions));
        v38.OnSearchClosed:Fire();
    end;
end;
return v5;