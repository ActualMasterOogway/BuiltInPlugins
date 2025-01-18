local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.ExplorerNodeChildrenMutable);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Networking.createSession.RootStateUpdating);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v6 = require(l_script_FirstAncestor_0.Networking.createSession.SessionChildren);
local v7 = require(l_script_FirstAncestor_0.Util.concatList);
local v8 = require(l_script_FirstAncestor_0.Util.createDebugLogger);
local _ = require(l_script_FirstAncestor_0.Networking.createSession.createSessionTypes);
local v10 = require(l_script_FirstAncestor_0.Util.instanceIdsToSet);
local v11 = require(l_script_FirstAncestor_0.Util.isExpanded);
local v12 = require(l_script_FirstAncestor_0.Util.validateExplorerNodeSanity);
local v13 = v8("createSessionHoverTracker");
local function v15(v14) --[[ Line: 18 ]] --[[ Name: markExpanded ]]
    -- upvalues: v11 (copy)
    if v11(v14) then
        return;
    elseif v14.uiState == nil then
        v14.uiState = table.freeze({
            isExpanded = true
        });
        return;
    else
        v14.uiState = table.clone(v14.uiState);
        v14.uiState.isExpanded = true;
        table.freeze(v14.uiState);
        return;
    end;
end;
local function v17(v16) --[[ Line: 40 ]] --[[ Name: createSearchState ]]
    return {
        id = v16, 
        foundIds = {}, 
        foundIdsArray = {}
    };
end;
return function(v18, v19, v20) --[[ Line: 48 ]] --[[ Name: createSessionSearching ]]
    -- upvalues: v3 (copy), v12 (copy), v17 (copy), v1 (copy), v15 (copy), v4 (copy), v13 (copy), v7 (copy), v10 (copy), v2 (copy), v6 (copy)
    local v21, v22 = v3.create(nil);
    local v23, v24 = v3.create({});
    local v25, v26 = v3.create(nil);
    local v28 = {
        fireRootChanged = function() --[[ Line: 73 ]] --[[ Name: fireRootChanged ]]
            -- upvalues: v22 (copy), v12 (ref)
            v22(function(v27) --[[ Line: 74 ]]
                -- upvalues: v12 (ref)
                if v27 ~= nil then
                    v12(v27);
                end;
                return v27;
            end);
        end, 
        instanceIdsToNodes = {}, 
        instanceIdsToHiddenChildren = {}
    };
    local v29 = v17(0);
    local v30 = "";
    local function v37(v31, v32) --[[ Line: 90 ]] --[[ Name: setSearch ]]
        -- upvalues: v30 (ref), v29 (ref), v17 (ref), v18 (copy), v22 (copy), v24 (copy), v1 (ref), v15 (ref), v28 (copy), v26 (copy), v20 (copy)
        if v30 == v31 and not v32 then
            return;
        else
            v30 = v31;
            local l_id_0 = v29.id;
            local v34 = l_id_0 + 1;
            v29 = v17(v34);
            if v31 == "" then
                v18.guestRpcInterface.stopSearching(l_id_0);
                v22(nil);
                v18.searchRootState = nil;
                v24({});
                v18.searchClearedSignal:Fire();
                return;
            else
                local v35 = table.clone(v1.emptyDataModelNode);
                v15(v35);
                v22(v35);
                v18.searchRootState = v28;
                table.clear(v28.instanceIdsToHiddenChildren);
                v28.instanceIdsToNodes = {
                    [v1.rootId] = v35
                };
                task.spawn(function() --[[ Line: 121 ]]
                    -- upvalues: v26 (ref), v18 (ref), v34 (copy), v31 (copy), v29 (ref), v20 (ref)
                    v26(nil);
                    local v36 = v18.guestRpcInterface.startSearchAsync(v34, v31);
                    while not v36 and v29.id == v34 do
                        v20();
                        v36 = v18.guestRpcInterface.continueSearchAsync(v34);
                    end;
                    if v29.id == v34 then
                        v26(#v29.foundIdsArray);
                    end;
                end);
                return;
            end;
        end;
    end;
    local function v38() --[[ Line: 136 ]] --[[ Name: getSearch ]]
        -- upvalues: v30 (ref)
        return v30;
    end;
    local function v40(v39) --[[ Line: 140 ]] --[[ Name: isInstanceIdSearched ]]
        -- upvalues: v29 (ref)
        return v29.foundIds[v39] or false;
    end;
    local function v42() --[[ Line: 144 ]] --[[ Name: selectAllSearchedIds ]]
        -- upvalues: v29 (ref), v19 (copy)
        local v41 = table.clone(v29.foundIdsArray);
        table.freeze(v41);
        v19(v41);
    end;
    local function v56(v43, v44, v45) --[[ Line: 150 ]] --[[ Name: receiveSearchResults ]]
        -- upvalues: v4 (ref), v18 (copy), v29 (ref), v13 (ref), v21 (copy), v28 (copy), v15 (ref), v7 (ref), v10 (ref)
        for _, v47 in v45 do
            v4.instanceAdded(v18.rootState, v47);
        end;
        if v43 ~= v29.id then
            v13("Received old search results for %d", v43);
            return;
        else
            assert(v21.get() ~= nil, "No search root when receiving search results");
            for _, v49 in v44 do
                local v50 = {};
                local l_v49_0 = v49;
                while l_v49_0 ~= nil and v28.instanceIdsToNodes[l_v49_0] == nil do
                    local v52 = v18.rootState.instanceIdsToNodes[l_v49_0];
                    if v52 == nil then
                        error((("Found node we don't know about, this should've been pre-populated from newDatums: %*"):format(l_v49_0)));
                    end;
                    table.insert(v50, v52);
                    l_v49_0 = v52.parent and v52.parent.datum.id;
                end;
                for v53 = #v50, 1, -1 do
                    local l_datum_0 = v50[v53].datum;
                    if l_datum_0.hasChildren then
                        l_datum_0 = table.clone(l_datum_0);
                        l_datum_0.hasChildren = false;
                        table.freeze(l_datum_0);
                    end;
                    local v55 = v4.instanceAdded(v28, l_datum_0);
                    v15(v55);
                end;
            end;
            v7(v29.foundIdsArray, v44);
            v29.foundIds = v10(v29.foundIdsArray);
            v28.fireRootChanged();
            return;
        end;
    end;
    local function v59(v57, v58) --[[ Line: 210 ]] --[[ Name: receiveSearchSuggestions ]]
        -- upvalues: v29 (ref), v13 (ref), v24 (copy)
        if v57 ~= v29.id then
            v13("Received old search suggestions for %d", v57);
            return;
        else
            v24(v58);
            return;
        end;
    end;
    local function v67(v60) --[[ Line: 219 ]] --[[ Name: processInstanceReplaced ]]
        -- upvalues: v28 (copy), v29 (ref), v4 (ref), v2 (ref), v6 (ref)
        local v61 = v28.instanceIdsToNodes[v60.id];
        if v61 == nil then
            return;
        else
            local v62 = v60.parentId ~= v61.datum.parentId;
            local v63 = {};
            if v62 then
                local l_parent_0 = v61.parent;
                while l_parent_0 ~= nil and v29.foundIds[l_parent_0.datum.id] == nil do
                    table.insert(v63, l_parent_0);
                    l_parent_0 = l_parent_0.parent;
                end;
            end;
            v4.instanceReplaced(v28, v60);
            for _, v66 in v63 do
                if v2.isEmpty(v66.children) then
                    v6.remove(v28, v66);
                else
                    break;
                end;
            end;
            v28.fireRootChanged();
            return;
        end;
    end;
    return {
        setSearch = v37, 
        getSearch = v38, 
        receiveSearchResults = v56, 
        receiveSearchSuggestions = v59, 
        searchRootObservable = v21, 
        searchSuggestionsObservable = v23, 
        searchResultCountObservable = v25, 
        isInstanceIdSearched = v40, 
        selectAllSearchedIds = v42, 
        processInstanceReplaced = v67
    };
end;