local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.InstanceGuestRPCInterfaceTypes);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local _ = require(l_script_FirstAncestor_0.Parent.Signal);
local v5 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestContextMenu);
local v6 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestFields);
local v7 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestFocusing);
local v8 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestHoverTracker);
local v9 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestInstancePicker);
local v10 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestOpenInsertObjectMenu);
local v11 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestOpenScript);
local v12 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestSearching);
local v13 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.createGuestSelectionService);
local v14 = require(l_script_FirstAncestor_0.Guest.createGuestServiceVisibility);
local v15 = require(l_script_FirstAncestor_0.Util.createNextNonce);
local v16 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Methods.dropSelectionOntoAsync);
local v17 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Methods.expandAsync);
local v18 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Methods.getPlaceIdAsync);
local v19 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Util.recordChangesThroughChangeHistoryService);
local v20 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Methods.renameInstance);
local v21 = require(l_script_FirstAncestor_0.Guest.InstanceGuestRPCInterface.Methods.stopListening);
return function(v22, v23, v24, v25) --[[ Line: 69 ]] --[[ Name: createInstanceGuestRPCInterface ]]
    -- upvalues: v15 (copy), v1 (copy), v19 (copy), v5 (copy), v14 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v13 (copy), v12 (copy), v17 (copy), v21 (copy), v20 (copy), v16 (copy), v18 (copy)
    local v26 = v25 or {};
    local v27 = {
        root = v22, 
        nextNonce = v15(), 
        hostRpcInterface = v23, 
        instanceIdsToInstance = {
            [v1.rootId] = v22
        }, 
        instancesToInstanceId = {
            root = v1.rootId
        }, 
        expandedInstances = {}, 
        watchingInstanceConnections = {}, 
        instancesInView = {}, 
        trackingFields = {}, 
        isServiceVisible = v26.isServiceVisible, 
        recordChanges = v26.recordChanges or v19
    };
    local v28 = {
        insertObjectButton = v26.openInsertObjectMenu ~= nil, 
        scriptOpening = v26.openScript ~= nil
    };
    local v29 = v5(v24);
    local v30 = if v26.isServiceVisible then v14(v27, v26.isServiceVisible, v26.listenForVisibilityChanges) else nil;
    local v31 = v6(v27);
    local v32 = v7(v27, v26.listenForFocus);
    local v33 = v8(v27);
    local v34 = if v26 and v26.instancePicker then v9(v27, v26.instancePicker) else nil;
    local v35 = v10(v27, v26.openInsertObjectMenu);
    local v36 = v11(v27, v26 and v26.openScript);
    local v37 = v13(v27, v26 and v26.flushSelectionChangedThisFrameSignal);
    local v38 = v12(v27, v26 and v26.createSearchThrottler);
    return {
        getCapabilitiesAsync = function() --[[ Line: 149 ]] --[[ Name: getCapabilitiesAsync ]]
            -- upvalues: v28 (copy)
            return v28;
        end, 
        expandAsync = function(...) --[[ Line: 153 ]] --[[ Name: expandAsync ]]
            -- upvalues: v17 (ref), v27 (copy)
            return v17(v27, ...);
        end, 
        stopListening = function(...) --[[ Line: 157 ]] --[[ Name: stopListening ]]
            -- upvalues: v21 (ref), v27 (copy)
            return v21(v27, ...);
        end, 
        setSelection = v37.setSelection, 
        requestCurrentSelection = v37.sendCurrentSelection, 
        renameInstance = function(...) --[[ Line: 164 ]] --[[ Name: renameInstance ]]
            -- upvalues: v20 (ref), v27 (copy)
            return v20(v27, ...);
        end, 
        hostHovered = v33.hostHovered, 
        openContextMenuAsync = v29.openContextMenuAsync, 
        performContextMenuAction = v29.performContextMenuAction, 
        createFieldAsync = v31.createFieldAsync, 
        deleteField = v31.deleteField, 
        viewInstancesAsync = v31.viewInstancesAsync, 
        stopViewingInstances = v31.stopViewingInstances, 
        performFieldAction = v31.performFieldAction, 
        dropSelectionOntoAsync = function(...) --[[ Line: 179 ]] --[[ Name: dropSelectionOntoAsync ]]
            -- upvalues: v16 (ref), v27 (copy)
            return v16(v27, ...);
        end, 
        startSearchAsync = v38.startSearchAsync, 
        continueSearchAsync = v38.continueSearchAsync, 
        stopSearching = v38.stopSearching, 
        openInsertObjectMenu = v35, 
        openScript = v36, 
        instancePickerSubmitInstance = if v34 then v34.instancePickerSubmitInstance else function() --[[ Line: 192 ]]
            error("instancePickerSubmitInstance called with no instancePicker in config");
        end, 
        getPlaceIdAsync = v18, 
        setListenForFocus = v32.setListenForFocus, 
        triggerFocus = v26.triggerFocus or function() --[[ Line: 199 ]]

        end, 
        getClockAsync = os.clock
    }, function() --[[ Line: 123 ]] --[[ Name: destroy ]]
        -- upvalues: v27 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v37 (copy), v38 (copy), v30 (copy)
        table.clear(v27.instancesToInstanceId);
        for _, v40 in v27.watchingInstanceConnections do
            assert(v40 ~= nil, "Luau");
            for _, v42 in v40 do
                v42:Disconnect();
            end;
        end;
        v31.destroy();
        v32.destroy();
        v33.destroy();
        if v34 ~= nil then
            v34.destroy();
        end;
        v37.destroy();
        v38.destroy();
        if v30 then
            v30.destroy();
        end;
    end;
end;