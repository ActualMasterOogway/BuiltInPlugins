local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v1.util.inspect;
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_console_0 = require(l_Parent_0.Shared).console;
local v9 = require(script.Parent.Parent.events);
local v10 = require(script.Parent.Parent.constants);
local l_TREE_OPERATION_ADD_0 = v10.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v10.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v10.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v10.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local l_ElementTypeRoot_0 = require(script.Parent.Parent.types).ElementTypeRoot;
local v16 = require(script.Parent.Parent.utils);
local l_getSavedComponentFilters_0 = v16.getSavedComponentFilters;
local l_saveComponentFilters_0 = v16.saveComponentFilters;
local l_separateDisplayNameAndHOCs_0 = v16.separateDisplayNameAndHOCs;
local l_shallowDiffers_0 = v16.shallowDiffers;
local v21 = require(script.Parent.Parent.storage);
local l_localStorageGetItem_0 = v21.localStorageGetItem;
local l_localStorageSetItem_0 = v21.localStorageSetItem;
local l___DEBUG___0 = v10.__DEBUG__;
local v25 = require(script.Parent.ProfilerStore);
local _ = require(script.Parent.Parent.devtools.views.Components.types);
local _ = require(script.Parent.Parent.types);
local _ = require(script.Parent.Parent.bridge);
local _ = require(script.Parent.types);
local function v31(v30, ...) --[[ Line: 63 ]]
    -- upvalues: l___DEBUG___0 (copy)
    if l___DEBUG___0 then
        print("Store", v30, ...);
    end;
end;
local v32 = setmetatable({}, {
    __index = v9
});
local v33 = {
    __index = v32
};
v32.new = function(v34, v35) --[[ Line: 96 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v33 (copy), l_Map_0 (copy), l___DEBUG___0 (copy), v31 (copy), l_localStorageGetItem_0 (copy), l_getSavedComponentFilters_0 (copy), v25 (copy)
    local v36 = setmetatable(v9.new(), v33);
    v35 = v35 or {};
    v36._bridge = v34;
    v36._collapseNodesByDefault = true;
    v36._componentFilters = {};
    v36._hasOwnerMetadata = false;
    v36._idToElement = l_Map_0.new();
    v36._isNativeStyleEditorSupported = false;
    v36._isBackendStorageAPISupported = false;
    v36._nativeStyleEditorValidAttributes = nil;
    v36._ownersMap = l_Map_0.new();
    v36._recordChangeDescriptions = false;
    v36._revision = 0;
    v36._roots = {};
    v36._rootIDToCapabilities = l_Map_0.new();
    v36._rootIDToRendererID = l_Map_0.new();
    v36._supportsNativeInspection = true;
    v36._supportsProfiling = false;
    v36._supportsReloadAndProfile = false;
    v36._supportsTraceUpdates = false;
    v36._unsupportedRendererVersionDetected = false;
    v36._weightAcrossRoots = 0;
    if l___DEBUG___0 then
        v31("constructor", "subscribing to Bridge");
    end;
    v36._collapseNodesByDefault = l_localStorageGetItem_0("React::DevTools::collapseNodesByDefault") == "true";
    v36._recordChangeDescriptions = l_localStorageGetItem_0("React::DevTools::recordChangeDescriptions") == "true";
    v36._componentFilters = l_getSavedComponentFilters_0();
    local v37 = false;
    if v35 ~= nil then
        v37 = v35.isProfiling == true;
        local l_supportsNativeInspection_0 = v35.supportsNativeInspection;
        local l_supportsProfiling_0 = v35.supportsProfiling;
        local l_supportsReloadAndProfile_0 = v35.supportsReloadAndProfile;
        local l_supportsTraceUpdates_0 = v35.supportsTraceUpdates;
        v36._supportsNativeInspection = l_supportsNativeInspection_0 ~= false;
        if l_supportsProfiling_0 then
            v36._supportsProfiling = true;
        end;
        if l_supportsReloadAndProfile_0 then
            v36._supportsReloadAndProfile = true;
        end;
        if l_supportsTraceUpdates_0 then
            v36._supportsTraceUpdates = true;
        end;
    end;
    v36._profilerStore = v25.new(v34, v36, v37);
    v36._onBridgeOperations = v36.onBridgeOperations;
    v36.onBridgeOperations = function(...) --[[ Line: 196 ]]
        -- upvalues: v36 (copy)
        v36:_onBridgeOperations(...);
    end;
    v36._onBridgeOverrideComponentFilters = v36.onBridgeOverrideComponentFilters;
    v36.onBridgeOverrideComponentFilters = function(...) --[[ Line: 200 ]]
        -- upvalues: v36 (copy)
        v36:_onBridgeOverrideComponentFilters(...);
    end;
    v36._onBridgeShutdown = v36.onBridgeShutdown;
    v36.onBridgeShutdown = function(...) --[[ Line: 204 ]]
        -- upvalues: v36 (copy)
        v36:_onBridgeShutdown(...);
    end;
    v36._onBridgeStorageSupported = v36.onBridgeStorageSupported;
    v36.onBridgeStorageSupported = function(...) --[[ Line: 208 ]]
        -- upvalues: v36 (copy)
        v36:_onBridgeStorageSupported(...);
    end;
    v36._onBridgeNativeStyleEditorSupported = v36.onBridgeNativeStyleEditorSupported;
    v36.onBridgeNativeStyleEditorSupported = function(...) --[[ Line: 212 ]]
        -- upvalues: v36 (copy)
        v36:_onBridgeNativeStyleEditorSupported(...);
    end;
    v36._onBridgeUnsupportedRendererVersion = v36.onBridgeUnsupportedRendererVersion;
    v36.onBridgeUnsupportedRendererVersion = function(...) --[[ Line: 216 ]]
        -- upvalues: v36 (copy)
        v36:_onBridgeUnsupportedRendererVersion(...);
    end;
    v34:addListener("operations", v36.onBridgeOperations);
    v34:addListener("overrideComponentFilters", v36.onBridgeOverrideComponentFilters);
    v34:addListener("shutdown", v36.onBridgeShutdown);
    v34:addListener("isBackendStorageAPISupported", v36.onBridgeStorageSupported);
    v34:addListener("isNativeStyleEditorSupported", v36.onBridgeNativeStyleEditorSupported);
    v34:addListener("unsupportedRendererVersion", v36.onBridgeUnsupportedRendererVersion);
    return v36;
end;
v32.assertExpectedRootMapSizes = function(v42) --[[ Line: 237 ]] --[[ Name: assertExpectedRootMapSizes ]]
    if #v42._roots == 0 then
        v42:assertMapSizeMatchesRootCount(v42._idToElement, "_idToElement");
        v42:assertMapSizeMatchesRootCount(v42._ownersMap, "_ownersMap");
    end;
    v42:assertMapSizeMatchesRootCount(v42._rootIDToCapabilities, "_rootIDToCapabilities");
    v42:assertMapSizeMatchesRootCount(v42._rootIDToRendererID, "_rootIDToRendererID");
end;
v32.assertMapSizeMatchesRootCount = function(v43, v44, v45) --[[ Line: 253 ]] --[[ Name: assertMapSizeMatchesRootCount ]]
    -- upvalues: l_Error_0 (copy), l_inspect_0 (copy)
    local v46 = #v43._roots;
    if v44.size ~= v46 then
        error(l_Error_0.new(string.format("Expected %s to contain %s items, but it contains %s items\n\n%s", v45, tostring(v46), tostring(v44.size), l_inspect_0(v44, {
            depth = 20
        }))));
    end;
end;
v32.getCollapseNodesByDefault = function(v47) --[[ Line: 271 ]] --[[ Name: getCollapseNodesByDefault ]]
    return v47._collapseNodesByDefault;
end;
v32.setCollapseNodesByDefault = function(v48, v49) --[[ Line: 275 ]] --[[ Name: setCollapseNodesByDefault ]]
    -- upvalues: l_localStorageSetItem_0 (copy)
    v48._collapseNodesByDefault = v49;
    l_localStorageSetItem_0("React::DevTools::collapseNodesByDefault", v49 and "true" or "false");
    v48:emit("collapseNodesByDefault");
end;
v32.getComponentFilters = function(v50) --[[ Line: 284 ]] --[[ Name: getComponentFilters ]]
    return v50._componentFilters;
end;
v32.setComponentFilters = function(v51, v52) --[[ Line: 288 ]] --[[ Name: setComponentFilters ]]
    -- upvalues: l_Array_0 (copy), l_shallowDiffers_0 (copy), l_saveComponentFilters_0 (copy)
    if v51._profilerStore:isProfiling() then
        error("Cannot modify filter preferences while profiling");
    end;
    local v54 = l_Array_0.filter(v51._componentFilters, function(v53) --[[ Line: 299 ]]
        return v53.isEnabled;
    end);
    local v56 = l_Array_0.filter(v52, function(v55) --[[ Line: 303 ]]
        return v55.isEnabled;
    end);
    local v57 = #v54 ~= #v56;
    if not v57 then
        for v58 = 1, #v56 do
            local v59 = v54[v58];
            local v60 = v56[v58];
            if l_shallowDiffers_0(v59, v60) then
                v57 = true;
                break;
            end;
        end;
    end;
    v51._componentFilters = v52;
    l_saveComponentFilters_0(v52);
    if v57 then
        v51._bridge:send("updateComponentFilters", v52);
    end;
    v51:emit("componentFilters");
end;
v32.getHasOwnerMetadata = function(v61) --[[ Line: 336 ]] --[[ Name: getHasOwnerMetadata ]]
    return v61._hasOwnerMetadata;
end;
v32.getNativeStyleEditorValidAttributes = function(v62) --[[ Line: 339 ]] --[[ Name: getNativeStyleEditorValidAttributes ]]
    return v62._nativeStyleEditorValidAttributes;
end;
v32.getNumElements = function(v63) --[[ Line: 342 ]] --[[ Name: getNumElements ]]
    return v63._weightAcrossRoots;
end;
v32.getProfilerStore = function(v64) --[[ Line: 345 ]] --[[ Name: getProfilerStore ]]
    return v64._profilerStore;
end;
v32.getRecordChangeDescriptions = function(v65) --[[ Line: 348 ]] --[[ Name: getRecordChangeDescriptions ]]
    return v65._recordChangeDescriptions;
end;
v32.setRecordChangeDescriptions = function(v66, v67) --[[ Line: 351 ]] --[[ Name: setRecordChangeDescriptions ]]
    -- upvalues: l_localStorageSetItem_0 (copy)
    v66._recordChangeDescriptions = v67;
    l_localStorageSetItem_0("React::DevTools::recordChangeDescriptions", v67 and "true" or "false");
    v66:emit("recordChangeDescriptions");
end;
v32.getRevision = function(v68) --[[ Line: 360 ]] --[[ Name: getRevision ]]
    return v68._revision;
end;
v32.getRootIDToRendererID = function(v69) --[[ Line: 363 ]] --[[ Name: getRootIDToRendererID ]]
    return v69._rootIDToRendererID;
end;
v32.getRoots = function(v70) --[[ Line: 366 ]] --[[ Name: getRoots ]]
    return v70._roots;
end;
v32.getSupportsNativeInspection = function(v71) --[[ Line: 369 ]] --[[ Name: getSupportsNativeInspection ]]
    return v71._supportsNativeInspection;
end;
v32.getSupportsNativeStyleEditor = function(v72) --[[ Line: 372 ]] --[[ Name: getSupportsNativeStyleEditor ]]
    return v72._isNativeStyleEditorSupported;
end;
v32.getSupportsProfiling = function(v73) --[[ Line: 375 ]] --[[ Name: getSupportsProfiling ]]
    return v73._supportsProfiling;
end;
v32.getSupportsReloadAndProfile = function(v74) --[[ Line: 378 ]] --[[ Name: getSupportsReloadAndProfile ]]
    return v74._supportsReloadAndProfile and v74._isBackendStorageAPISupported;
end;
v32.getSupportsTraceUpdates = function(v75) --[[ Line: 381 ]] --[[ Name: getSupportsTraceUpdates ]]
    return v75._supportsTraceUpdates;
end;
v32.getUnsupportedRendererVersionDetected = function(v76) --[[ Line: 384 ]] --[[ Name: getUnsupportedRendererVersionDetected ]]
    return v76._unsupportedRendererVersionDetected;
end;
v32.containsElement = function(v77, v78) --[[ Line: 387 ]] --[[ Name: containsElement ]]
    return v77._idToElement:get(v78) ~= nil;
end;
v32.getElementAtIndex = function(v79, v80) --[[ Line: 390 ]] --[[ Name: getElementAtIndex ]]
    -- upvalues: l_console_0 (copy)
    if v80 < 0 or v79:getNumElements() <= v80 then
        l_console_0.warn(string.format("Invalid index %d specified; store contains %d items.", v80, v79:getNumElements()));
        return nil;
    else
        local v81 = nil;
        local v82 = nil;
        local v83 = 0;
        for v84 = 1, #v79._roots do
            v81 = v79._roots[v84];
            v82 = v79._idToElement:get(v81);
            if #v82.children ~= 0 then
                if v80 >= v83 + v82.weight then
                    v83 = v83 + v82.weight;
                else
                    break;
                end;
            end;
        end;
        local l_v82_0 = v82;
        local v86 = v83 - 1;
        while v80 ~= v86 do
            for v87 = 1, #l_v82_0.children do
                local v88 = l_v82_0.children[v87];
                local v89 = v79._idToElement:get(v88);
                local v90 = v89.isCollapsed and 1 or v89.weight;
                if v80 <= v86 + v90 then
                    v86 = v86 + 1;
                    l_v82_0 = v89;
                    break;
                else
                    v86 = v86 + v90;
                end;
            end;
        end;
        return l_v82_0 or nil;
    end;
end;
v32.getElementIDAtIndex = function(v91, v92) --[[ Line: 445 ]] --[[ Name: getElementIDAtIndex ]]
    local v93 = v91:getElementAtIndex(v92);
    if v93 == nil then
        return nil;
    else
        return v93.id;
    end;
end;
v32.getElementByID = function(v94, v95) --[[ Line: 455 ]] --[[ Name: getElementByID ]]
    -- upvalues: l_console_0 (copy)
    local v96 = v94._idToElement:get(v95);
    if v96 == nil then
        l_console_0.warn(string.format("No element found with id \"%s\"", (tostring(v95))));
        return nil;
    else
        return v96;
    end;
end;
v32.getIndexOfElementID = function(v97, v98) --[[ Line: 465 ]] --[[ Name: getIndexOfElementID ]]
    local v99 = v97:getElementByID(v98);
    if v99 == nil or v99.parentID == 0 then
        return nil;
    else
        local l_v98_0 = v98;
        local l_parentID_0 = v99.parentID;
        local v102 = 0;
        while true do
            local v103 = v97._idToElement:get(l_parentID_0);
            local l_children_0 = v103.children;
            for v105 = 1, #l_children_0 do
                local v106 = l_children_0[v105];
                if v106 ~= l_v98_0 then
                    local v107 = v97._idToElement:get(v106);
                    v102 = v102 + (v107.isCollapsed and 1 or v107.weight);
                else
                    break;
                end;
            end;
            if v103.parentID ~= 0 then
                v102 = v102 + 1;
                l_v98_0 = v103.id;
                l_parentID_0 = v103.parentID;
            else
                break;
            end;
        end;
        for v108 = 1, #v97._roots do
            local v109 = v97._roots[v108];
            if v109 ~= l_parentID_0 then
                v102 = v102 + v97._idToElement:get(v109).weight;
            else
                break;
            end;
        end;
        return v102;
    end;
end;
v32.getOwnersListForElement = function(v110, v111) --[[ Line: 518 ]] --[[ Name: getOwnersListForElement ]]
    -- upvalues: l_Object_0 (copy), l_Map_0 (copy), l_Array_0 (copy)
    local v112 = {};
    local v113 = v110._idToElement:get(v111);
    if v113 ~= nil then
        table.insert(v112, l_Object_0.assign({}, v113, {
            depth = 0
        }));
        local v114 = v110._ownersMap:get(v111);
        if v114 ~= nil then
            local v115 = l_Map_0.new({
                {
                    v111, 
                    0
                }
            });
            for _, v119 in (l_Array_0.sort(l_Array_0.from(v114), function(v116, v117) --[[ Line: 539 ]]
                -- upvalues: v110 (copy)
                return (v110:getIndexOfElementID(v116) or 0) - (v110:getIndexOfElementID(v117) or 0);
            end)) do
                local v120 = v110._idToElement:get(v119);
                if v120 ~= nil then
                    local l_parentID_1 = v120.parentID;
                    local v122 = 0;
                    while l_parentID_1 > 0 do
                        if l_parentID_1 == v111 or v114:has(l_parentID_1) then
                            v122 = v115:get(l_parentID_1) + 1;
                            v115:set(v119, v122);
                            break;
                        else
                            local v123 = v110._idToElement:get(l_parentID_1);
                            if v123 ~= nil then
                                l_parentID_1 = v123.parentID;
                            else
                                break;
                            end;
                        end;
                    end;
                    if v122 == 0 then
                        error("Invalid owners list");
                    end;
                    table.insert(v112, l_Object_0.assign({}, v120, {
                        depth = v122
                    }));
                end;
            end;
        end;
    end;
    return v112;
end;
v32.getRendererIDForElement = function(v124, v125) --[[ Line: 585 ]] --[[ Name: getRendererIDForElement ]]
    local v126 = v124._idToElement:get(v125);
    while true do
        if v126 ~= nil then
            if v126.parentID == 0 then
                local v127 = v124._rootIDToRendererID:get(v126.id);
                if v127 == nil then
                    return nil;
                else
                    return v127;
                end;
            else
                v126 = v124._idToElement:get(v126.parentID);
            end;
        else
            return nil;
        end;
    end;
end;
v32.getRootIDForElement = function(v128, v129) --[[ Line: 603 ]] --[[ Name: getRootIDForElement ]]
    local v130 = v128._idToElement:get(v129);
    while true do
        if v130 ~= nil then
            if v130.parentID == 0 then
                return v130.id;
            else
                v130 = v128._idToElement:get(v130.parentID);
            end;
        else
            return nil;
        end;
    end;
end;
v32.isInsideCollapsedSubTree = function(v131, v132) --[[ Line: 615 ]] --[[ Name: isInsideCollapsedSubTree ]]
    local v133 = v131._idToElement:get(v132);
    while true do
        if v133 ~= nil then
            if v133.parentID == 0 then
                return false;
            else
                v133 = v131._idToElement:get(v133.parentID);
                if v133 ~= nil and v133.isCollapsed then
                    return true;
                end;
            end;
        else
            return false;
        end;
    end;
end;
v32.toggleIsCollapsed = function(v134, v135, v136) --[[ Line: 631 ]] --[[ Name: toggleIsCollapsed ]]
    -- upvalues: l_ElementTypeRoot_0 (copy)
    local v137 = false;
    local v138 = v134:getElementByID(v135);
    if v138 ~= nil then
        if v136 then
            if v138.type == l_ElementTypeRoot_0 then
                error("Root nodes cannot be collapsed");
            end;
            if not v138.isCollapsed then
                v137 = true;
                v138.isCollapsed = true;
                local v139 = 1 - v138.weight;
                local v140 = v134._idToElement:get(v138.parentID);
                while v140 ~= nil do
                    v140.weight = v140.weight + v139;
                    v140 = v134._idToElement:get(v140.parentID);
                end;
            end;
        else
            local l_v138_0 = v138;
            while l_v138_0 ~= nil do
                local v142 = l_v138_0.isCollapsed and 1 or l_v138_0.weight;
                if l_v138_0.isCollapsed then
                    v137 = true;
                    l_v138_0.isCollapsed = false;
                    local v143 = (l_v138_0.isCollapsed and 1 or l_v138_0.weight) - v142;
                    local v144 = v134._idToElement:get(l_v138_0.parentID);
                    while v144 ~= nil do
                        v144.weight = v144.weight + v143;
                        if not v144.isCollapsed then
                            v144 = v134._idToElement:get(v144.parentID);
                        else
                            break;
                        end;
                    end;
                end;
                if l_v138_0.parentID ~= 0 then
                    l_v138_0 = v134:getElementByID(l_v138_0.parentID);
                else
                    l_v138_0 = nil;
                end;
            end;
        end;
        if v137 then
            local v145 = 0;
            for _, v147 in v134._roots do
                v145 = v145 + v134:getElementByID(v147).weight;
            end;
            v134._weightAcrossRoots = v145;
            v134:emit("mutated", {
                {}, 
                {}
            });
        end;
    end;
end;
v32._adjustParentTreeWeight = function(v148, v149, v150) --[[ Line: 718 ]] --[[ Name: _adjustParentTreeWeight ]]
    local v151 = false;
    while v149 ~= nil do
        v149.weight = v149.weight + v150;
        if v149.isCollapsed then
            v151 = true;
            break;
        else
            v149 = v148._idToElement:get(v149.parentID);
        end;
    end;
    if not v151 then
        v148._weightAcrossRoots = v148._weightAcrossRoots + v150;
    end;
end;
v32.onBridgeNativeStyleEditorSupported = function(v152, v153) --[[ Line: 740 ]] --[[ Name: onBridgeNativeStyleEditorSupported ]]
    local l_isSupported_0 = v153.isSupported;
    local l_validAttributes_0 = v153.validAttributes;
    v152._isNativeStyleEditorSupported = l_isSupported_0;
    v152._nativeStyleEditorValidAttributes = l_validAttributes_0 or nil;
    v152:emit("supportsNativeStyleEditor");
end;
v32.onBridgeOperations = function(v156, v157) --[[ Line: 752 ]] --[[ Name: onBridgeOperations ]]
    -- upvalues: l___DEBUG___0 (copy), l_console_0 (copy), v31 (copy), l_TREE_OPERATION_ADD_0 (copy), l_Error_0 (copy), l_ElementTypeRoot_0 (copy), l_Array_0 (copy), l_separateDisplayNameAndHOCs_0 (copy), l_Set_0 (copy), l_TREE_OPERATION_REMOVE_0 (copy), l_TREE_OPERATION_REORDER_CHILDREN_0 (copy), l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 (copy)
    if l___DEBUG___0 then
        l_console_0.groupCollapsed("onBridgeOperations");
        v31("onBridgeOperations", table.concat(v157, ","));
    end;
    local v158 = false;
    local v159 = v157[1];
    local v160 = {};
    local v161 = {};
    local v162 = 3;
    local v163 = {
        ""
    };
    local function _() --[[ Line: 774 ]] --[[ Name: POSTFIX_INCREMENT ]]
        -- upvalues: v162 (ref)
        local l_v162_0 = v162;
        v162 = v162 + 1;
        return l_v162_0;
    end;
    local l_v162_1 = v162;
    v162 = v162 + 1;
    local v167 = v162 + v157[l_v162_1];
    while v162 < v167 do
        local l_v162_2 = v162;
        v162 = v162 + 1;
        table.insert(v163, v157[l_v162_2]);
    end;
    while #v157 >= v162 do
        l_v162_1 = v157[v162];
        if l_v162_1 == l_TREE_OPERATION_ADD_0 then
            local v169 = v157[v162 + 1];
            local v170 = v157[v162 + 2];
            v162 = v162 + 3;
            if v156._idToElement:has(v169) then
                error(l_Error_0.new(("Cannot add node %s because a node with that id is already in the Store."):format((tostring(v169)))));
            end;
            local v171 = 0;
            local v172 = nil;
            if v170 == l_ElementTypeRoot_0 then
                if l___DEBUG___0 then
                    v31("Add", string.format("new root node %s", (tostring(v169))));
                end;
                local v173 = v157[v162] > 0;
                v162 = v162 + 1;
                local v174 = v157[v162] > 0;
                v162 = v162 + 1;
                v156._roots = l_Array_0.concat(v156._roots, v169);
                v156._rootIDToRendererID:set(v169, v159);
                v156._rootIDToCapabilities:set(v169, {
                    hasOwnerMetadata = v174, 
                    supportsProfiling = v173
                });
                v156._idToElement:set(v169, {
                    children = {}, 
                    depth = -1, 
                    displayName = nil, 
                    hocDisplayNames = nil, 
                    id = v169, 
                    isCollapsed = false, 
                    key = nil, 
                    ownerID = 0, 
                    parentID = 0, 
                    type = v170, 
                    weight = 0
                });
                v158 = true;
            else
                v172 = v157[v162];
                v162 = v162 + 1;
                v171 = v157[v162];
                v162 = v162 + 1;
                local v175 = v163[v157[v162] + 1];
                v162 = v162 + 1;
                local v176 = v163[v157[v162] + 1];
                v162 = v162 + 1;
                if l___DEBUG___0 then
                    v31("Add", string.format("node %s (%s) as child of %s", tostring(v169), v175 or "null", (tostring(v172))));
                end;
                if not v156._idToElement:has(v172) then
                    error(l_Error_0.new(("Cannot add child %s to parent %s because parent node was not found in the Store."):format(tostring(v169), (tostring(v172)))));
                end;
                local v177 = v156._idToElement:get(v172);
                table.insert(v177.children, v169);
                local v178, v179 = l_separateDisplayNameAndHOCs_0(v175, v170);
                local v180 = {
                    children = {}, 
                    depth = v177.depth + 1, 
                    displayName = v178, 
                    hocDisplayNames = v179, 
                    id = v169, 
                    isCollapsed = v156._collapseNodesByDefault, 
                    key = v176, 
                    ownerID = v171, 
                    parentID = v177.id, 
                    type = v170, 
                    weight = 1
                };
                v156._idToElement:set(v169, v180);
                table.insert(v160, v169);
                v156:_adjustParentTreeWeight(v177, 1);
                if v171 > 0 then
                    local v181 = v156._ownersMap:get(v171);
                    if v181 == nil then
                        v181 = l_Set_0.new();
                        v156._ownersMap:set(v171, v181);
                    end;
                    v181:add(v169);
                end;
            end;
        elseif l_v162_1 == l_TREE_OPERATION_REMOVE_0 then
            local v182 = v157[v162 + 1];
            v162 = v162 + 2;
            for _ = 1, v182 do
                local v184 = v157[v162];
                if not v156._idToElement:has(v184) then
                    error(l_Error_0.new(("Cannot remove node %s because no matching node was found in the Store."):format((tostring(v184)))));
                end;
                v162 = v162 + 1;
                local v185 = v156._idToElement:get(v184);
                local l_children_1 = v185.children;
                local l_ownerID_0 = v185.ownerID;
                local l_parentID_2 = v185.parentID;
                local l_weight_0 = v185.weight;
                if #l_children_1 > 0 then
                    error(l_Error_0.new(string.format("Node %s was removed before its children.", (tostring(v184)))));
                end;
                v156._idToElement:delete(v184);
                local v190 = nil;
                if l_parentID_2 == 0 then
                    if l___DEBUG___0 then
                        v31("Remove", string.format("node %s root", (tostring(v184))));
                    end;
                    v156._roots = l_Array_0.filter(v156._roots, function(v191) --[[ Line: 969 ]]
                        -- upvalues: v184 (copy)
                        return v191 ~= v184;
                    end);
                    v156._rootIDToRendererID:delete(v184);
                    v156._rootIDToCapabilities:delete(v184);
                    v158 = true;
                else
                    if l___DEBUG___0 then
                        v31("Remove", string.format("node %s from parent %s", tostring(v184), (tostring(l_parentID_2))));
                    end;
                    v190 = v156._idToElement:get(l_parentID_2);
                    if v190 == nil then
                        error(("Cannot remove node %s from parent %s because no matching node was found in the Store."):format(tostring(v184), (tostring(l_parentID_2))));
                    end;
                    local v192 = l_Array_0.indexOf(v190.children, v184);
                    l_Array_0.splice(v190.children, v192, 1);
                end;
                v156:_adjustParentTreeWeight(v190, -l_weight_0);
                v161[v184] = l_parentID_2;
                v156._ownersMap:delete(v184);
                if l_ownerID_0 > 0 then
                    local v193 = v156._ownersMap:get(l_ownerID_0);
                    if v193 ~= nil then
                        v193:delete(v184);
                    end;
                end;
            end;
        elseif l_v162_1 == l_TREE_OPERATION_REORDER_CHILDREN_0 then
            local v194 = v157[v162 + 1];
            local v195 = v157[v162 + 2];
            v162 = v162 + 3;
            if not v156._idToElement:has(v194) then
                error(l_Error_0.new(("Cannot reorder children for node %s because no matching node was found in the Store."):format((tostring(v194)))));
            end;
            local l_children_2 = v156._idToElement:get(v194).children;
            if #l_children_2 ~= v195 then
                error("Children cannot be added or removed during a reorder operation.");
            end;
            for v197 = 1, v195 do
                local v198 = v157[v162 + v197 - 1];
                l_children_2[v197] = v198;
                if _G.__DEV__ then
                    local v199 = v156._idToElement:get(v198);
                    if v199 == nil or v199.parentID ~= v194 then
                        l_console_0.error("Children cannot be added or removed during a reorder operation.");
                    end;
                end;
            end;
            v162 = v162 + v195;
            if _G.__DEBUG__ then
                v31("Re-order", string.format("Node %s children %s", tostring(v194), l_Array_0.join(l_children_2, ",")));
            end;
        elseif l_v162_1 == l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 then
            v162 = v162 + 3;
        else
            error("Unsupported Bridge operation " .. tostring(l_v162_1));
        end;
    end;
    v156._revision = v156._revision + 1;
    if v158 then
        l_v162_1 = v156._supportsProfiling;
        v156._hasOwnerMetadata = false;
        v156._supportsProfiling = false;
        for _, v201 in v156._rootIDToCapabilities do
            local l_hasOwnerMetadata_0 = v201.hasOwnerMetadata;
            local l_supportsProfiling_1 = v201.supportsProfiling;
            if l_hasOwnerMetadata_0 then
                v156._hasOwnerMetadata = true;
            end;
            if l_supportsProfiling_1 then
                v156._supportsProfiling = true;
            end;
        end;
        v156:emit("roots");
        if v156._supportsProfiling ~= l_v162_1 then
            v156:emit("supportsProfiling");
        end;
    end;
    if l___DEBUG___0 then
        local l_printStore_0 = require(script.Parent.utils).printStore;
        l_console_0.log(l_printStore_0(v156, true));
        l_console_0.groupEnd();
    end;
    v156:emit("mutated", {
        v160, 
        v161
    });
end;
v32.onBridgeOverrideComponentFilters = function(v205, v206) --[[ Line: 1117 ]] --[[ Name: onBridgeOverrideComponentFilters ]]
    -- upvalues: l_saveComponentFilters_0 (copy)
    v205._componentFilters = v206;
    l_saveComponentFilters_0(v206);
end;
v32.onBridgeShutdown = function(v207) --[[ Line: 1125 ]] --[[ Name: onBridgeShutdown ]]
    -- upvalues: l___DEBUG___0 (copy), v31 (copy)
    if l___DEBUG___0 then
        v31("onBridgeShutdown", "unsubscribing from Bridge");
    end;
    v207._bridge:removeListener("operations", v207.onBridgeOperations);
    v207._bridge:removeListener("shutdown", v207.onBridgeShutdown);
    v207._bridge:removeListener("isBackendStorageAPISupported", v207.onBridgeStorageSupported);
end;
v32.onBridgeStorageSupported = function(v208, v209) --[[ Line: 1138 ]] --[[ Name: onBridgeStorageSupported ]]
    v208._isBackendStorageAPISupported = v209;
    v208:emit("supportsReloadAndProfile");
end;
v32.onBridgeUnsupportedRendererVersion = function(v210) --[[ Line: 1143 ]] --[[ Name: onBridgeUnsupportedRendererVersion ]]
    v210._unsupportedRendererVersionDetected = true;
    v210:emit("unsupportedRendererVersionDetected");
end;
return v32;