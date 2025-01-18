local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(script.NetworkingImpl);
local v5 = require(script.NetworkingMock);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = l_ContextItem_0:extend("Networking");
v7.new = function(v8) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v4 (copy), l_Signal_0 (copy), v7 (copy)
    local v9 = {
        _isMock = v8, 
        _impl = if v8 then v5 else v4, 
        OnFetchFinished = l_Signal_0.new(), 
        OnFetchProgressChanged = l_Signal_0.new()
    };
    setmetatable(v9, v7);
    return v9;
end;
v7.mock = function() --[[ Line: 35 ]] --[[ Name: mock ]]
    -- upvalues: v7 (copy)
    local v10 = v7.new(true);
    v10.ResumeAsync = v10._impl.ResumeAsync;
    return v10;
end;
v7.destroy = function(_) --[[ Line: 41 ]] --[[ Name: destroy ]]

end;
v7.makeFetchRequestsStale = function(v12) --[[ Line: 45 ]] --[[ Name: makeFetchRequestsStale ]]
    v12._impl.incrementFetchSessionId();
end;
v7.fetchUsername = function(v13, v14) --[[ Line: 50 ]] --[[ Name: fetchUsername ]]
    v13._impl.fetchUsername(v14);
end;
v7.fetchGameName = function(v15) --[[ Line: 55 ]] --[[ Name: fetchGameName ]]
    return v15._impl.fetchGameName();
end;
v7.fetchGroupsAsync = function(v16, v17, v18) --[[ Line: 59 ]] --[[ Name: fetchGroupsAsync ]]
    v16._impl.fetchGroupsAsync(v17, v18);
end;
v7.fetchAssetsAsync = function(v19, v20, v21, v22) --[[ Line: 67 ]] --[[ Name: fetchAssetsAsync ]]
    v20.OnFetchFinished = v19.OnFetchFinished;
    v20.OnFetchProgressChanged = v19.OnFetchProgressChanged;
    v19._impl.fetchAssetsAsync(v20, v21, v22);
end;
v7.searchAssetsAsync = function(v23, v24, v25, v26) --[[ Line: 77 ]] --[[ Name: searchAssetsAsync ]]
    v24.OnFetchFinished = v23.OnFetchFinished;
    v24.OnFetchProgressChanged = v23.OnFetchProgressChanged;
    v23._impl.searchAssetsAsync(v24, v25, v26);
end;
v7.grantUniverseUseAssetsPermissions = function(v27, v28) --[[ Line: 84 ]] --[[ Name: grantUniverseUseAssetsPermissions ]]
    return v27._impl.grantUniverseUseAssetsPermissions(v28);
end;
v7.getThumbnailUriForScope = function(v29, v30) --[[ Line: 88 ]] --[[ Name: getThumbnailUriForScope ]]
    return v29._impl.getThumbnailUriForScope(v30);
end;
v7.getThumbnailForScopeAsync = function(v31, v32, v33) --[[ Line: 93 ]] --[[ Name: getThumbnailForScopeAsync ]]
    v31._impl.getThumbnailForScopeAsync(v32, v33);
end;
v7.getThumbnailForItem = function(v34, v35) --[[ Line: 98 ]] --[[ Name: getThumbnailForItem ]]
    return v34._impl.getThumbnailForItem(v35);
end;
v7.getThumbnailForItemAsync = function(v36, v37, v38) --[[ Line: 102 ]] --[[ Name: getThumbnailForItemAsync ]]
    return v36._impl.getThumbnailForItemAsync(v37, v38);
end;
return v7;