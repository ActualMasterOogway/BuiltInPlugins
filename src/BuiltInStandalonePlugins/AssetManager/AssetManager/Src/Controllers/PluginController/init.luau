local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_StudioService_0 = game:GetService("StudioService");
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v7 = l_ContextItem_0:extend("PluginController");
v7.new = function(v8, v9, v10, v11) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: l_StudioService_0 (copy), v4 (copy), l_Signal_0 (copy), v7 (copy), v6 (copy)
    local v12 = {
        _isMock = v11, 
        _networking = v9, 
        _plugin = v8, 
        _pressedKeys = {}, 
        _user = {
            Id = l_StudioService_0:GetUserId(), 
            Name = v10:getText("Plugin", "PlaceholderUsername"), 
            Scope = v4.Scope.User
        }, 
        _gameInfo = {
            Id = v11 and 0 or v8:GetItem("GameId"), 
            Name = v10:getText("Plugin", "PlaceholderGameName"), 
            Scope = v4.Scope.Universe
        }, 
        _pluginWidth = 0, 
        _showSidebar = true, 
        OnUsernameFetched = l_Signal_0.new(), 
        OnGameInfoFetched = l_Signal_0.new(), 
        OnSelectionChanged = l_Signal_0.new(), 
        OnInputChanged = l_Signal_0.new(), 
        OnSidebarToggled = l_Signal_0.new(), 
        OnPluginWidthChanged = l_Signal_0.new(), 
        OnIsCompactChanged = l_Signal_0.new()
    };
    setmetatable(v12, v7);
    if not v11 then
        v12._plugin:OnSetItem("GameId", function(v13) --[[ Line: 53 ]]
            -- upvalues: v12 (copy)
            v12._gameInfo.Id = v13;
            v12.OnGameInfoFetched:Fire(table.clone(v12._gameInfo));
        end);
    end;
    v12._networking:fetchUsername(function(v14, v15) --[[ Line: 59 ]]
        -- upvalues: v6 (ref), v10 (copy), v12 (copy)
        if v15 then
            if v6() then
                warn(v10:getText("PluginErrors", "ErrorFetchUsername"));
            end;
            local v16 = v10:getText("Plugin", "PlaceholderUsername");
            if v12._user.Name ~= v16 then
                v12._user.Name = v16;
                v12.OnUsernameFetched:Fire(v16);
                return;
            end;
        else
            v12._user.Name = v14;
            v12.OnUsernameFetched:Fire(v14);
        end;
    end);
    local v17, v18 = v12._networking:fetchGameName();
    if v17 then
        v12._gameInfo.Name = v18;
        v12.OnGameInfoFetched:Fire(table.clone(v12._gameInfo));
        return v12;
    else
        if v6() then
            warn(v10:getText("PluginErrors", "ErrorFetchGameName"));
        end;
        local v19 = v10:getText("Plugin", "PlaceholderGameName");
        if v12._gameInfo.Name ~= v19 then
            v12._gameInfo.Name = v19;
            v12.OnGameInfoFetched:Fire(table.clone(v19));
        end;
        return v12;
    end;
end;
v7.mock = function(v20, v21, v22) --[[ Line: 93 ]] --[[ Name: mock ]]
    -- upvalues: v7 (copy)
    return v7.new(v20, v21, v22, true);
end;
v7.destroy = function(v23) --[[ Line: 97 ]] --[[ Name: destroy ]]
    v23._pressedKeys = nil;
    v23._user = nil;
    v23.OnUsernameFetched = nil;
    v23.OnSelectionChanged = nil;
    v23.OnInputChanged = nil;
end;
v7.getPlugin = function(v24) --[[ Line: 106 ]] --[[ Name: getPlugin ]]
    return v24._plugin;
end;
v7.setRoot = function(v25, v26) --[[ Line: 110 ]] --[[ Name: setRoot ]]
    v25._root = v26;
end;
v7.getRoot = function(v27) --[[ Line: 114 ]] --[[ Name: getRoot ]]
    return v27._root;
end;
v7.addKeyPress = function(v28, v29) --[[ Line: 118 ]] --[[ Name: addKeyPress ]]
    v28._pressedKeys[v29] = true;
    v28.OnInputChanged:Fire(v28._pressedKeys);
end;
v7.removeKeyPress = function(v30, v31) --[[ Line: 123 ]] --[[ Name: removeKeyPress ]]
    v30._pressedKeys[v31] = nil;
    v30.OnInputChanged:Fire(v30._pressedKeys);
end;
v7.getUser = function(v32) --[[ Line: 128 ]] --[[ Name: getUser ]]
    return v32._user;
end;
v7.getGameInfo = function(v33) --[[ Line: 132 ]] --[[ Name: getGameInfo ]]
    return v33._gameInfo;
end;
v7.launchBulkImport = function(v34) --[[ Line: 136 ]] --[[ Name: launchBulkImport ]]
    if v34._isMock then
        return;
    else
        plugin:Invoke("OnOpenBulkImport");
        return;
    end;
end;
v7.getShowSidebar = function(v35) --[[ Line: 145 ]] --[[ Name: getShowSidebar ]]
    return v35._showSidebar;
end;
v7.toggleSidebar = function(v36) --[[ Line: 149 ]] --[[ Name: toggleSidebar ]]
    v36._showSidebar = not v36._showSidebar;
    v36.OnSidebarToggled:Fire(v36._showSidebar);
end;
v7.setShowSidebar = function(v37, v38) --[[ Line: 154 ]] --[[ Name: setShowSidebar ]]
    v37._showSidebar = v38;
    v37.OnSidebarToggled:Fire(v37._showSidebar);
end;
v7.getIsCompact = function(v39) --[[ Line: 159 ]] --[[ Name: getIsCompact ]]
    if v39._pluginWidth then
        return v39._pluginWidth < 400;
    else
        return false;
    end;
end;
v7.getPluginWidth = function(v40) --[[ Line: 163 ]] --[[ Name: getPluginWidth ]]
    return v40._pluginWidth;
end;
v7.setPluginWidth = function(v41, v42) --[[ Line: 167 ]] --[[ Name: setPluginWidth ]]
    local v43 = v41:getIsCompact();
    local l__pluginWidth_0 = v41._pluginWidth;
    v41._pluginWidth = v42;
    if l__pluginWidth_0 ~= v42 then
        v41.OnPluginWidthChanged:Fire(v42);
    end;
    if v43 ~= v41:getIsCompact() then
        if v41:getIsCompact() then
            v41:setShowSidebar(false);
        else
            v41:setShowSidebar(true);
        end;
        v41.OnIsCompactChanged:Fire(v41:getIsCompact());
    end;
end;
return v7;