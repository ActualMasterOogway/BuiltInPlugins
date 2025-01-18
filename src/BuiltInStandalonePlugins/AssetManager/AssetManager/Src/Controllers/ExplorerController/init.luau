local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v5 = require(l_script_FirstAncestor_0.Src.Util.renderContextMenu);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v8 = l_ContextItem_0:extend("ExplorerController");
v8.new = function(v9, v10, v11) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v8 (copy)
    local v12 = {
        _isMock = v11, 
        _networking = v10, 
        _pluginController = v9, 
        _explorerItems = {}, 
        _groups = {}, 
        _visibleGroups = {}, 
        _selection = {}, 
        _expansion = {}, 
        _groupOptions = {}, 
        _toggleSet = {}, 
        _showScopeOptions = false, 
        OnExplorerItemsChanged = l_Signal_0.new(), 
        OnExpansionChanged = l_Signal_0.new(), 
        OnGroupOptionsChanged = l_Signal_0.new(), 
        OnShowScopeOptionsChanged = l_Signal_0.new(), 
        OnToggleSetChanged = l_Signal_0.new()
    };
    setmetatable(v12, v8);
    v12._selection = v12._pluginController:getUser();
    v12.populateExplorerItems = function() --[[ Line: 45 ]]
        -- upvalues: v9 (copy), v12 (copy)
        local v13 = {};
        if v9:getGameInfo().Id ~= 0 then
            table.insert(v13, v12._pluginController:getGameInfo());
        end;
        table.insert(v13, v12._pluginController:getUser());
        for _, v15 in v12._visibleGroups do
            table.insert(v13, v12._groups[tostring(v15)]);
        end;
        return v13;
    end;
    v12._explorerItems = v12.populateExplorerItems();
    v12._onGameInfoFetchedConnection = v12._pluginController.OnGameInfoFetched:Connect(function() --[[ Line: 64 ]]
        -- upvalues: v12 (copy)
        v12._explorerItems = v12.populateExplorerItems();
        v12.OnExplorerItemsChanged:Fire(v12._explorerItems);
    end);
    v12:refreshGroups();
    return v12;
end;
v8.mock = function(v16, v17) --[[ Line: 74 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy)
    return v8.new(v16, v17, true);
end;
v8.destroy = function(v18) --[[ Line: 78 ]] --[[ Name: destroy ]]
    v18._explorerItems = nil;
    v18._groups = nil;
    v18._visibleGroups = nil;
    v18._selection = nil;
    v18._expansion = nil;
    v18._onGameInfoFetchedConnection:Disconnect();
    v18._onGameInfoFetchedConnection = nil;
    v18.OnExplorerItemsChanged = nil;
    v18.OnExpansionChanged = nil;
end;
v8.refreshGroups = function(v19) --[[ Line: 91 ]] --[[ Name: refreshGroups ]]
    -- upvalues: v6 (copy), v2 (copy), v7 (copy)
    v19._groups = {};
    v19._visibleGroups = {};
    v19._groupOptions = {};
    v19.OnGroupOptionsChanged:Fire(v19._groups);
    v19._networking:fetchGroupsAsync(function(v20) --[[ Line: 96 ]]
        -- upvalues: v6 (ref), v19 (copy), v2 (ref)
        for _, v22 in v20.data do
            local v23 = {
                Name = v22.name, 
                Id = v22.id, 
                Scope = v6.Scope.Group
            };
            v19._groups[tostring(v22.id)] = v23;
            table.insert(v19._visibleGroups, v22.id);
        end;
        v19._explorerItems = v19.populateExplorerItems();
        v19.OnExplorerItemsChanged:Fire(v19._explorerItems);
        v19._groupOptions = v2.values(v19._groups);
        v19.OnGroupOptionsChanged:Fire(v19._groups);
    end, function(v24) --[[ Line: 111 ]]
        -- upvalues: v7 (ref)
        if v7() then
            warn((("Error fetching groups: %*"):format(v24)));
        end;
    end);
end;
v8.getExplorerItems = function(v25) --[[ Line: 120 ]] --[[ Name: getExplorerItems ]]
    return table.clone(v25._explorerItems);
end;
v8.getExpansion = function(v26) --[[ Line: 124 ]] --[[ Name: getExpansion ]]
    return v26._expansion;
end;
v8.getSelection = function(v27) --[[ Line: 128 ]] --[[ Name: getSelection ]]
    return v27._selection;
end;
v8.setSelection = function(v28, v29) --[[ Line: 132 ]] --[[ Name: setSelection ]]
    v28._selection = v29;
    v28._pluginController.OnSelectionChanged:Fire(v29);
end;
v8.toggleVisibleGroup = function(v30, v31) --[[ Line: 137 ]] --[[ Name: toggleVisibleGroup ]]
    for v32, v33 in v30._visibleGroups do
        if v33 == v31 then
            table.remove(v30._visibleGroups, v32);
            v30._explorerItems = v30.populateExplorerItems();
            v30.OnExplorerItemsChanged:Fire(v30._explorerItems);
            return;
        end;
    end;
    table.insert(v30._visibleGroups, v31);
    v30._explorerItems = v30.populateExplorerItems();
    v30.OnExplorerItemsChanged:Fire(v30._explorerItems);
end;
v8.getShowScopeOptions = function(v34) --[[ Line: 151 ]] --[[ Name: getShowScopeOptions ]]
    return v34._showScopeOptions;
end;
v8.enableScopeOptions = function(v35) --[[ Line: 155 ]] --[[ Name: enableScopeOptions ]]
    v35._showScopeOptions = true;
    v35.OnShowScopeOptionsChanged:Fire(true);
end;
v8._saveGroupOptions = function(v36) --[[ Line: 160 ]] --[[ Name: _saveGroupOptions ]]
    for v37, _ in v36._toggleSet do
        v36:toggleVisibleGroup(v37);
    end;
    v36._explorerItems = v36.populateExplorerItems();
    v36.OnExplorerItemsChanged:Fire(v36._explorerItems);
end;
v8.closeScopeOptions = function(v39, v40) --[[ Line: 168 ]] --[[ Name: closeScopeOptions ]]
    if v40 then
        v39:_saveGroupOptions();
    end;
    v39._showScopeOptions = false;
    v39.OnShowScopeOptionsChanged:Fire(false);
    v39._toggleSet = {};
    v39.OnToggleSetChanged:Fire(table.clone(v39._toggleSet));
    v39._groupOptions = table.clone(v39._groups);
    v39.OnGroupOptionsChanged:Fire(v39._groups);
end;
v8.getGroupOptions = function(v41) --[[ Line: 180 ]] --[[ Name: getGroupOptions ]]
    return table.clone(v41._groupOptions);
end;
v8.toggleGroupOption = function(v42, v43) --[[ Line: 184 ]] --[[ Name: toggleGroupOption ]]
    if v42._toggleSet[v43] then
        v42._toggleSet[v43] = nil;
    else
        v42._toggleSet[v43] = true;
    end;
    v42.OnToggleSetChanged:Fire(table.clone(v42._toggleSet));
end;
v8.setFilter = function(v44, v45) --[[ Line: 193 ]] --[[ Name: setFilter ]]
    -- upvalues: v2 (copy)
    if v45 ~= "" then
        v44._groupOptions = {};
        for _, v47 in v44._groups do
            if string.find(v47.Name:lower(), v45:lower()) then
                table.insert(v44._groupOptions, v47);
            end;
        end;
        v44.OnGroupOptionsChanged:Fire(v44._groupOptions);
        return;
    else
        v44._groupOptions = v2.values(v44._groups);
        v44.OnGroupOptionsChanged:Fire(v44._groupOptions);
        return;
    end;
end;
v8.isGroupOptionChecked = function(v48, v49) --[[ Line: 208 ]] --[[ Name: isGroupOptionChecked ]]
    for _, v51 in v48._visibleGroups do
        if v51 == v49 then
            return v48._toggleSet[v49] ~= true;
        end;
    end;
    return v48._toggleSet[v49] == true;
end;
v8.hasAllOptionsChecked = function(v52) --[[ Line: 217 ]] --[[ Name: hasAllOptionsChecked ]]
    for _, v54 in v52._groupOptions do
        if not v52:isGroupOptionChecked(v54.Id) then
            return false;
        end;
    end;
    return true;
end;
v8.getToggleSet = function(v55) --[[ Line: 226 ]] --[[ Name: getToggleSet ]]
    return v55._toggleSet;
end;
v8.toggleSelectAllOptions = function(v56) --[[ Line: 230 ]] --[[ Name: toggleSelectAllOptions ]]
    local v57 = v56:hasAllOptionsChecked();
    for _, v59 in v56._groupOptions do
        if v57 == v56:isGroupOptionChecked(v59.Id) then
            if v56._toggleSet[v59.Id] then
                v56._toggleSet[v59.Id] = nil;
            else
                v56._toggleSet[v59.Id] = true;
            end;
        end;
    end;
    v56.OnToggleSetChanged:Fire(table.clone(v56._toggleSet));
end;
v8.handleRightClick = function(v60, v61) --[[ Line: 245 ]] --[[ Name: handleRightClick ]]
    -- upvalues: v5 (copy), v6 (copy)
    v5[v6.MenuContext.Sidebar](v61, v60);
end;
v8.handleRowRightClick = function(v62, v63, v64) --[[ Line: 249 ]] --[[ Name: handleRowRightClick ]]
    -- upvalues: v5 (copy), v6 (copy)
    v5[v6.MenuContext.Scope](v63, v64, v62);
end;
v8.getPlugin = function(v65) --[[ Line: 253 ]] --[[ Name: getPlugin ]]
    return v65._pluginController:getPlugin();
end;
return v8;