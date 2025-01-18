local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.Util.Constants);
local v3 = require(script.Expanding);
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkedRPCInterfaces);
local _ = require(l_script_FirstAncestor_0.Networking.NetworkingTypes);
local v6 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v8 = require(l_script_FirstAncestor_0.Parent.Signal);
local v9 = require(script.createFocusedRootObservable);
local v10 = require(script.createGetIndexOfInstanceId);
local v11 = require(script.createSessionCapabilities);
local v12 = require(script.createSessionContextMenu);
local v13 = require(script.createSessionDataModelUpdating);
local v14 = require(script.createSessionFields);
local v15 = require(script.createSessionHeartbeat);
local v16 = require(script.createSessionHoverTracker);
local v17 = require(script.createSessionInstancePicker);
local v18 = require(script.createSessionSearching);
local v19 = require(script.createSessionSelection);
local _ = require(script.createSessionTypes);
local v21 = require(script.doubleClick);
local v22 = require(script.renameInstance);
local v23 = require(script.shiftClick);
local v24 = require(l_script_FirstAncestor_0.Util.validateExplorerNodeSanity);
return function(v25, v26) --[[ Line: 28 ]] --[[ Name: createSession ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy), v24 (copy), v8 (copy), v11 (copy), v14 (copy), v15 (copy), v19 (copy), v12 (copy), v18 (copy), v9 (copy), v16 (copy), v13 (copy), v17 (copy), v10 (copy), v3 (copy), v22 (copy), v21 (copy), v23 (copy)
    local v27, v28 = v6.create(table.clone(v2.emptyDataModelNode));
    local v29 = {
        [v2.rootId] = v27.get()
    };
    local v30, v31 = v4.createNetworkedHostToGuestRPCInterface(v25);
    local v32 = nil;
    v32 = {
        rootState = {
            fireRootChanged = function() --[[ Line: 49 ]] --[[ Name: fireRootChanged ]]
                -- upvalues: v28 (copy), v24 (ref)
                v28(function(v33) --[[ Line: 50 ]]
                    -- upvalues: v24 (ref)
                    v24(v33);
                    return v33;
                end);
            end, 
            instanceIdsToNodes = v29, 
            instanceIdsToHiddenChildren = {}
        }, 
        searchRootState = nil, 
        getFocusedRootState = function() --[[ Line: 62 ]] --[[ Name: getFocusedRootState ]]
            -- upvalues: v32 (ref)
            return v32.searchRootState or v32.rootState;
        end, 
        guestRpcInterface = v30, 
        searchClearedSignal = v8.new(), 
        analyticsInterface = v26.analyticsInterface
    };
    local v34 = v11(v32);
    local v35 = v14(v32);
    local v36 = v15(v32);
    local v37 = v19(v32, v26.getExpandHierarchySetting);
    local v38 = v12(v32, v37.selectedIdsArrayObservable);
    local v39 = v18(v32, v37.selectIds, v26.waitForNextSearchAsync);
    local v40 = v9(v27, v39.searchRootObservable);
    local v41 = v16(v32, v40);
    local v42 = v13(v32, v39.processInstanceReplaced);
    local v43 = v17(v32);
    local v44 = v10(v32);
    local v45 = v8.new();
    local v46 = {
        instanceAdded = v42.instanceAdded, 
        instanceReplaced = v42.instanceReplaced, 
        selectionChanged = v37.selectionChanged, 
        guestHovered = v41.guestHovered, 
        guestUnhovered = v41.guestUnhovered, 
        updateFieldValue = v35.updateFieldValue, 
        receiveSearchResults = v39.receiveSearchResults, 
        receiveSearchSuggestions = v39.receiveSearchSuggestions, 
        instancePickerActivated = v43.instancePickerActivated, 
        instancePickerDeactivated = v43.instancePickerDeactivated, 
        fireFocusRequested = function() --[[ Line: 94 ]] --[[ Name: fireFocusRequested ]]
            -- upvalues: v45 (copy)
            v45:Fire();
        end
    };
    local v47 = v4.addNetworkLayerToHostRPCInterface(v25, v46);
    local function v48() --[[ Line: 120 ]] --[[ Name: destroy ]]
        -- upvalues: v31 (copy), v47 (copy), v36 (copy)
        v31();
        v47();
        v36.destroy();
    end;
    local function v50(v49) --[[ Line: 126 ]] --[[ Name: expandAsync ]]
        -- upvalues: v3 (ref), v32 (ref)
        v3.expandAsync(v32, v49);
        v32.getFocusedRootState().fireRootChanged();
    end;
    local function v52(v51) --[[ Line: 131 ]] --[[ Name: unexpand ]]
        -- upvalues: v3 (ref), v32 (ref)
        v3.unexpand(v32, v51);
        v32.getFocusedRootState().fireRootChanged();
    end;
    local function v54(v53) --[[ Line: 136 ]] --[[ Name: expandAll ]]
        -- upvalues: v3 (ref), v32 (ref)
        v3.expandAll(v32, v53);
    end;
    local function v56(v55) --[[ Line: 140 ]] --[[ Name: collapseAll ]]
        -- upvalues: v3 (ref), v32 (ref)
        v3.collapseAll(v32, v55);
    end;
    local function v58(v57) --[[ Line: 144 ]] --[[ Name: getExpandState ]]
        -- upvalues: v3 (ref), v32 (ref)
        return v3.getExpandState(v32, v57);
    end;
    task.spawn(function() --[[ Line: 148 ]]
        -- upvalues: v2 (ref), v3 (ref), v32 (ref), v30 (copy)
        local l_rootId_0 = v2.rootId;
        v3.expandAsync(v32, l_rootId_0);
        v32.getFocusedRootState().fireRootChanged();
        v30.requestCurrentSelection();
    end);
    local v60, v61 = v6.create(nil);
    task.spawn(function() --[[ Line: 155 ]]
        -- upvalues: v61 (copy), v30 (copy)
        v61(v30.getPlaceIdAsync());
    end);
    local v62 = nil;
    v62 = {
        focusedRootObservable = v40, 
        getExplorerNodeById = function(v63) --[[ Line: 163 ]] --[[ Name: getExplorerNodeById ]]
            -- upvalues: v32 (ref)
            return v32.getFocusedRootState().instanceIdsToNodes[v63];
        end, 
        expandAsync = v50, 
        unexpand = v52, 
        getExpandState = v58, 
        expandAll = v54, 
        collapseAll = v56, 
        selectIds = v37.selectIds, 
        selectedIdsObservable = v37.selectedIdsObservable, 
        selectedIdsArrayObservable = v37.selectedIdsArrayObservable, 
        selectedWithinIdsObservable = v37.selectedWithinIdsObservable, 
        renameInstance = function(...) --[[ Line: 178 ]] --[[ Name: renameInstance ]]
            -- upvalues: v22 (ref), v32 (ref)
            v22(v32, ...);
        end, 
        openContextMenuAsync = v38.openContextMenuAsync, 
        performContextMenuAction = v38.performContextMenuAction, 
        hoverId = v41.hoverId, 
        hoveredObservable = v41.hoveredObservable, 
        doubleClick = function(...) --[[ Line: 188 ]] --[[ Name: doubleClick ]]
            -- upvalues: v21 (ref), v62 (ref), v32 (ref)
            v21(v62, v32, ...);
        end, 
        shiftClick = function(...) --[[ Line: 192 ]] --[[ Name: shiftClick ]]
            -- upvalues: v23 (ref), v62 (ref), v32 (ref)
            v23(v62, v32, ...);
        end, 
        setViewingInstances = v35.setViewingInstances, 
        addField = v35.addField, 
        requestedFieldsObservable = v35.requestedFieldsObservable, 
        performFieldAction = v30.performFieldAction, 
        dropSelectionOntoAsync = v30.dropSelectionOntoAsync, 
        getIndexOfInstanceId = v44, 
        setSearch = v39.setSearch, 
        getSearch = v39.getSearch, 
        searchSuggestionsObservable = v39.searchSuggestionsObservable, 
        searchResultCountObservable = v39.searchResultCountObservable, 
        isInstanceIdSearched = v39.isInstanceIdSearched, 
        selectAllSearchedIds = v39.selectAllSearchedIds, 
        instancePickerActiveObservable = v43.instancePickerActiveObservable, 
        instancePickerSubmitInstance = v43.instancePickerSubmitInstance, 
        capabilities = v34, 
        placeIdObservable = v60, 
        focusRequestedSignal = v45, 
        setListenForFocus = v30.setListenForFocus, 
        triggerFocus = v30.triggerFocus, 
        destroy = v48
    };
    return v62;
end;