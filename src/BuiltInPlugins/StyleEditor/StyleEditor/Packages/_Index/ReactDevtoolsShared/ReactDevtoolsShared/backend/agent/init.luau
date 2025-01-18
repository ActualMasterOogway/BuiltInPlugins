local l_Parent_0 = script.Parent.Parent.Parent;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local l_HttpService_0 = game:GetService("HttpService");
local l__G_0 = _G;
local v4 = require(script.Parent.Parent.events);
local _ = function(v5, _) --[[ Line: 23 ]]
    return v5;
end;
local v8 = require(script.Parent.Parent.constants);
local l_SESSION_STORAGE_LAST_SELECTION_KEY_0 = v8.SESSION_STORAGE_LAST_SELECTION_KEY;
local l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 = v8.SESSION_STORAGE_RELOAD_AND_PROFILE_KEY;
local l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 = v8.SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY;
local l___DEBUG___0 = v8.__DEBUG__;
local v13 = require(script.Parent.Parent.storage);
local l_sessionStorageGetItem_0 = v13.sessionStorageGetItem;
local l_sessionStorageRemoveItem_0 = v13.sessionStorageRemoveItem;
local l_sessionStorageSetItem_0 = v13.sessionStorageSetItem;
local _ = function(_, _) --[[ Line: 40 ]]

end;
local _ = function(_) --[[ Line: 45 ]]

end;
local _ = function(_) --[[ Line: 46 ]]

end;
local _ = function(_) --[[ Line: 52 ]]

end;
local function _() --[[ Line: 53 ]]

end;
local _ = require(script.Parent.Parent.bridge);
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.types);
local function v31(v30, ...) --[[ Line: 70 ]]
    -- upvalues: l___DEBUG___0 (copy)
    if l___DEBUG___0 then
        print(v30, ...);
    end;
end;
local v32 = setmetatable({}, {
    __index = v4
});
local v33 = {
    __index = v32
};
v32.new = function(v34) --[[ Line: 221 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v33 (copy), l_sessionStorageGetItem_0 (copy), l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 (copy), l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 (copy), l_sessionStorageRemoveItem_0 (copy), l_SESSION_STORAGE_LAST_SELECTION_KEY_0 (copy), l_HttpService_0 (copy)
    local v35 = setmetatable(v4.new(), v33);
    v35._bridge = v34;
    v35._isProfiling = false;
    v35._recordChangeDescriptions = false;
    v35._rendererInterfaces = {};
    v35._persistedSelection = nil;
    v35._persistedSelectionMatch = nil;
    v35._traceUpdatesEnabled = false;
    if l_sessionStorageGetItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0) == "true" then
        v35._recordChangeDescriptions = l_sessionStorageGetItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0) == "true";
        v35._isProfiling = true;
        l_sessionStorageRemoveItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0);
        l_sessionStorageRemoveItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0);
    end;
    local v36 = l_sessionStorageGetItem_0(l_SESSION_STORAGE_LAST_SELECTION_KEY_0);
    if v36 ~= nil then
        v35._persistedSelection = l_HttpService_0.JSONDecode(v36);
    end;
    local function _(v37) --[[ Line: 250 ]] --[[ Name: wrapSelf ]]
        -- upvalues: v35 (copy)
        return function(...) --[[ Line: 251 ]]
            -- upvalues: v37 (copy), v35 (ref)
            v37(v35, ...);
        end;
    end;
    local v39 = "copyElementPath";
    local l_copyElementPath_0 = v35.copyElementPath;
    local l_l_copyElementPath_0_0 = l_copyElementPath_0 --[[ copy: 8 -> 9 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_0 (copy), v35 (copy)
        l_l_copyElementPath_0_0(v35, ...);
    end);
    v39 = "deletePath";
    l_copyElementPath_0 = v35.deletePath;
    local l_l_copyElementPath_0_1 = l_copyElementPath_0 --[[ copy: 8 -> 10 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_1 (copy), v35 (copy)
        l_l_copyElementPath_0_1(v35, ...);
    end);
    v39 = "getProfilingData";
    l_copyElementPath_0 = v35.getProfilingData;
    local l_l_copyElementPath_0_2 = l_copyElementPath_0 --[[ copy: 8 -> 11 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_2 (copy), v35 (copy)
        l_l_copyElementPath_0_2(v35, ...);
    end);
    v39 = "getProfilingStatus";
    l_copyElementPath_0 = v35.getProfilingStatus;
    local l_l_copyElementPath_0_3 = l_copyElementPath_0 --[[ copy: 8 -> 12 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_3 (copy), v35 (copy)
        l_l_copyElementPath_0_3(v35, ...);
    end);
    v39 = "getOwnersList";
    l_copyElementPath_0 = v35.getOwnersList;
    local l_l_copyElementPath_0_4 = l_copyElementPath_0 --[[ copy: 8 -> 13 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_4 (copy), v35 (copy)
        l_l_copyElementPath_0_4(v35, ...);
    end);
    v39 = "inspectElement";
    l_copyElementPath_0 = v35.inspectElement;
    local l_l_copyElementPath_0_5 = l_copyElementPath_0 --[[ copy: 8 -> 14 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_5 (copy), v35 (copy)
        l_l_copyElementPath_0_5(v35, ...);
    end);
    v39 = "logElementToConsole";
    l_copyElementPath_0 = v35.logElementToConsole;
    local l_l_copyElementPath_0_6 = l_copyElementPath_0 --[[ copy: 8 -> 15 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_6 (copy), v35 (copy)
        l_l_copyElementPath_0_6(v35, ...);
    end);
    v39 = "overrideSuspense";
    l_copyElementPath_0 = v35.overrideSuspense;
    local l_l_copyElementPath_0_7 = l_copyElementPath_0 --[[ copy: 8 -> 16 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_7 (copy), v35 (copy)
        l_l_copyElementPath_0_7(v35, ...);
    end);
    v39 = "overrideValueAtPath";
    l_copyElementPath_0 = v35.overrideValueAtPath;
    local l_l_copyElementPath_0_8 = l_copyElementPath_0 --[[ copy: 8 -> 17 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_8 (copy), v35 (copy)
        l_l_copyElementPath_0_8(v35, ...);
    end);
    v39 = "reloadAndProfile";
    l_copyElementPath_0 = v35.reloadAndProfile;
    local l_l_copyElementPath_0_9 = l_copyElementPath_0 --[[ copy: 8 -> 18 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_9 (copy), v35 (copy)
        l_l_copyElementPath_0_9(v35, ...);
    end);
    v39 = "renamePath";
    l_copyElementPath_0 = v35.renamePath;
    local l_l_copyElementPath_0_10 = l_copyElementPath_0 --[[ copy: 8 -> 19 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_10 (copy), v35 (copy)
        l_l_copyElementPath_0_10(v35, ...);
    end);
    v39 = "setTraceUpdatesEnabled";
    l_copyElementPath_0 = v35.setTraceUpdatesEnabled;
    local l_l_copyElementPath_0_11 = l_copyElementPath_0 --[[ copy: 8 -> 20 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_11 (copy), v35 (copy)
        l_l_copyElementPath_0_11(v35, ...);
    end);
    v39 = "startProfiling";
    l_copyElementPath_0 = v35.startProfiling;
    local l_l_copyElementPath_0_12 = l_copyElementPath_0 --[[ copy: 8 -> 21 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_12 (copy), v35 (copy)
        l_l_copyElementPath_0_12(v35, ...);
    end);
    v39 = "stopProfiling";
    l_copyElementPath_0 = v35.stopProfiling;
    local l_l_copyElementPath_0_13 = l_copyElementPath_0 --[[ copy: 8 -> 22 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_13 (copy), v35 (copy)
        l_l_copyElementPath_0_13(v35, ...);
    end);
    v39 = "storeAsGlobal";
    l_copyElementPath_0 = v35.storeAsGlobal;
    local l_l_copyElementPath_0_14 = l_copyElementPath_0 --[[ copy: 8 -> 23 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_14 (copy), v35 (copy)
        l_l_copyElementPath_0_14(v35, ...);
    end);
    v39 = "syncSelectionFromNativeElementsPanel";
    l_copyElementPath_0 = v35.syncSelectionFromNativeElementsPanel;
    local l_l_copyElementPath_0_15 = l_copyElementPath_0 --[[ copy: 8 -> 24 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_15 (copy), v35 (copy)
        l_l_copyElementPath_0_15(v35, ...);
    end);
    v39 = "shutdown";
    l_copyElementPath_0 = v35.shutdown;
    local l_l_copyElementPath_0_16 = l_copyElementPath_0 --[[ copy: 8 -> 25 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_16 (copy), v35 (copy)
        l_l_copyElementPath_0_16(v35, ...);
    end);
    v39 = "updateConsolePatchSettings";
    l_copyElementPath_0 = v35.updateConsolePatchSettings;
    local l_l_copyElementPath_0_17 = l_copyElementPath_0 --[[ copy: 8 -> 26 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_17 (copy), v35 (copy)
        l_l_copyElementPath_0_17(v35, ...);
    end);
    v39 = "updateComponentFilters";
    l_copyElementPath_0 = v35.updateComponentFilters;
    local l_l_copyElementPath_0_18 = l_copyElementPath_0 --[[ copy: 8 -> 27 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_18 (copy), v35 (copy)
        l_l_copyElementPath_0_18(v35, ...);
    end);
    v39 = "viewAttributeSource";
    l_copyElementPath_0 = v35.viewAttributeSource;
    local l_l_copyElementPath_0_19 = l_copyElementPath_0 --[[ copy: 8 -> 28 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_19 (copy), v35 (copy)
        l_l_copyElementPath_0_19(v35, ...);
    end);
    v39 = "viewElementSource";
    l_copyElementPath_0 = v35.viewElementSource;
    local l_l_copyElementPath_0_20 = l_copyElementPath_0 --[[ copy: 8 -> 29 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_20 (copy), v35 (copy)
        l_l_copyElementPath_0_20(v35, ...);
    end);
    v39 = "overrideContext";
    l_copyElementPath_0 = v35.overrideContext;
    local l_l_copyElementPath_0_21 = l_copyElementPath_0 --[[ copy: 8 -> 30 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_21 (copy), v35 (copy)
        l_l_copyElementPath_0_21(v35, ...);
    end);
    v39 = "overrideHookState";
    l_copyElementPath_0 = v35.overrideHookState;
    local l_l_copyElementPath_0_22 = l_copyElementPath_0 --[[ copy: 8 -> 31 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_22 (copy), v35 (copy)
        l_l_copyElementPath_0_22(v35, ...);
    end);
    v39 = "overrideProps";
    l_copyElementPath_0 = v35.overrideProps;
    local l_l_copyElementPath_0_23 = l_copyElementPath_0 --[[ copy: 8 -> 32 ]];
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_l_copyElementPath_0_23 (copy), v35 (copy)
        l_l_copyElementPath_0_23(v35, ...);
    end);
    v39 = "overrideState";
    l_copyElementPath_0 = v35.overrideState;
    v34:addListener(v39, function(...) --[[ Line: 251 ]]
        -- upvalues: l_copyElementPath_0 (copy), v35 (copy)
        l_copyElementPath_0(v35, ...);
    end);
    if v35._isProfiling then
        v34:send("profilingStatus", true);
    end;
    v34:send("isBackendStorageAPISupported", true);
    return v35;
end;
v32.getRendererInterfaces = function(v65) --[[ Line: 310 ]] --[[ Name: getRendererInterfaces ]]
    return v65._rendererInterfaces;
end;
v32.copyElementPath = function(v66, v67) --[[ Line: 314 ]] --[[ Name: copyElementPath ]]
    -- upvalues: l_console_0 (copy)
    local l_id_0 = v67.id;
    local l_path_0 = v67.path;
    local l_rendererID_0 = v67.rendererID;
    local v71 = v66._rendererInterfaces[l_rendererID_0];
    if v71 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_0, l_id_0));
        return;
    else
        v71.copyElementPath(l_id_0, l_path_0);
        return;
    end;
end;
v32.deletePath = function(v72, v73) --[[ Line: 327 ]] --[[ Name: deletePath ]]
    -- upvalues: l_console_0 (copy)
    local l_hookID_0 = v73.hookID;
    local l_id_1 = v73.id;
    local l_path_1 = v73.path;
    local l_rendererID_1 = v73.rendererID;
    local l_type_0 = v73.type;
    local v79 = v72._rendererInterfaces[l_rendererID_1];
    if v79 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_1, l_id_1));
        return;
    else
        v79.deletePath(l_type_0, l_id_1, l_hookID_0, l_path_1);
        return;
    end;
end;
v32.getInstanceAndStyle = function(v80, v81) --[[ Line: 344 ]] --[[ Name: getInstanceAndStyle ]]
    -- upvalues: l_console_0 (copy)
    local l_id_2 = v81.id;
    local l_rendererID_2 = v81.rendererID;
    local v84 = v80._rendererInterfaces[l_rendererID_2];
    if v84 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\"", l_rendererID_2));
        return nil;
    else
        return v84.getInstanceAndStyle(l_id_2);
    end;
end;
v32.getIDForNode = function(v85, v86) --[[ Line: 358 ]] --[[ Name: getIDForNode ]]
    for _, v88 in v85._rendererInterfaces do
        local l_status_0, l_result_0 = pcall(v88.getFiberIDForNative, v86, true);
        if l_status_0 and l_result_0 ~= nil then
            return l_result_0;
        end;
    end;
    return nil;
end;
v32.getProfilingData = function(v91, v92) --[[ Line: 369 ]] --[[ Name: getProfilingData ]]
    -- upvalues: l_console_0 (copy)
    local l_rendererID_3 = v92.rendererID;
    local v94 = v91._rendererInterfaces[l_rendererID_3];
    if v94 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\"", l_rendererID_3));
    end;
    v91._bridge:send("profilingData", v94.getProfilingData());
end;
v32.getProfilingStatus = function(v95) --[[ Line: 379 ]] --[[ Name: getProfilingStatus ]]
    v95._bridge:send("profilingStatus", v95._isProfiling);
end;
v32.getOwnersList = function(v96, v97) --[[ Line: 382 ]] --[[ Name: getOwnersList ]]
    -- upvalues: l_console_0 (copy)
    local l_id_3 = v97.id;
    local l_rendererID_4 = v97.rendererID;
    local v100 = v96._rendererInterfaces[l_rendererID_4];
    if v100 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_4, l_id_3));
        return;
    else
        local v101 = v100.getOwnersList(l_id_3);
        v96._bridge:send("ownersList", {
            id = l_id_3, 
            owners = v101
        });
        return;
    end;
end;
v32.inspectElement = function(v102, v103) --[[ Line: 399 ]] --[[ Name: inspectElement ]]
    -- upvalues: l_console_0 (copy)
    local l_id_4 = v103.id;
    local l_path_2 = v103.path;
    local l_rendererID_5 = v103.rendererID;
    local v107 = v102._rendererInterfaces[l_rendererID_5];
    if v107 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_5, l_id_4));
        return;
    else
        v102._bridge:send("inspectedElement", v107.inspectElement(l_id_4, l_path_2));
        if v102._persistedSelectionMatch == nil or v102._persistedSelectionMatch.id ~= l_id_4 then
            v102._persistedSelection = nil;
            v102._persistedSelectionMatch = nil;
            v107.setTrackedPath(nil);
            v102:_throttledPersistSelection(l_rendererID_5, l_id_4);
        end;
        return;
    end;
end;
v32.logElementToConsole = function(v108, v109) --[[ Line: 436 ]] --[[ Name: logElementToConsole ]]
    -- upvalues: l_console_0 (copy)
    local l_id_5 = v109.id;
    local l_rendererID_6 = v109.rendererID;
    local v112 = v108._rendererInterfaces[l_rendererID_6];
    if v112 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_6, l_id_5));
        return;
    else
        v112.logElementToConsole(l_id_5);
        return;
    end;
end;
v32.overrideSuspense = function(v113, v114) --[[ Line: 448 ]] --[[ Name: overrideSuspense ]]
    -- upvalues: l_console_0 (copy)
    local l_id_6 = v114.id;
    local l_rendererID_7 = v114.rendererID;
    local l_forceFallback_0 = v114.forceFallback;
    local v118 = v113._rendererInterfaces[l_rendererID_7];
    if v118 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_7, l_id_6));
        return;
    else
        v118.overrideSuspense(l_id_6, l_forceFallback_0);
        return;
    end;
end;
v32.overrideValueAtPath = function(v119, v120) --[[ Line: 463 ]] --[[ Name: overrideValueAtPath ]]
    -- upvalues: l_console_0 (copy)
    local l_hookID_1 = v120.hookID;
    local l_id_7 = v120.id;
    local l_path_3 = v120.path;
    local l_rendererID_8 = v120.rendererID;
    local l_type_1 = v120.type;
    local l_value_0 = v120.value;
    local v127 = v119._rendererInterfaces[l_rendererID_8];
    if v127 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_8, l_id_7));
        return;
    else
        v127.overrideValueAtPath(l_type_1, l_id_7, l_hookID_1, l_path_3, l_value_0);
        return;
    end;
end;
v32.overrideContext = function(v128, v129) --[[ Line: 490 ]] --[[ Name: overrideContext ]]
    local l_id_8 = v129.id;
    local l_path_4 = v129.path;
    local l_rendererID_9 = v129.rendererID;
    local l_wasForwarded_0 = v129.wasForwarded;
    local l_value_1 = v129.value;
    if not l_wasForwarded_0 then
        v128:overrideValueAtPath({
            id = l_id_8, 
            path = l_path_4, 
            rendererID = l_rendererID_9, 
            type = "context", 
            value = l_value_1
        });
    end;
end;
v32.overrideHookState = function(v135, v136) --[[ Line: 513 ]] --[[ Name: overrideHookState ]]
    local l_id_9 = v136.id;
    local _ = v136.hookID;
    local l_path_5 = v136.path;
    local l_rendererID_10 = v136.rendererID;
    local l_wasForwarded_1 = v136.wasForwarded;
    local l_value_2 = v136.value;
    if not l_wasForwarded_1 then
        v135:overrideValueAtPath({
            id = l_id_9, 
            path = l_path_5, 
            rendererID = l_rendererID_10, 
            type = "hooks", 
            value = l_value_2
        });
    end;
end;
v32.overrideProps = function(v143, v144) --[[ Line: 537 ]] --[[ Name: overrideProps ]]
    local l_id_10 = v144.id;
    local l_path_6 = v144.path;
    local l_rendererID_11 = v144.rendererID;
    local l_wasForwarded_2 = v144.wasForwarded;
    local l_value_3 = v144.value;
    if not l_wasForwarded_2 then
        v143:overrideValueAtPath({
            id = l_id_10, 
            path = l_path_6, 
            rendererID = l_rendererID_11, 
            type = "props", 
            value = l_value_3
        });
    end;
end;
v32.overrideState = function(v150, v151) --[[ Line: 560 ]] --[[ Name: overrideState ]]
    local l_id_11 = v151.id;
    local l_path_7 = v151.path;
    local l_rendererID_12 = v151.rendererID;
    local l_wasForwarded_3 = v151.wasForwarded;
    local l_value_4 = v151.value;
    if not l_wasForwarded_3 then
        v150:overrideValueAtPath({
            id = l_id_11, 
            path = l_path_7, 
            rendererID = l_rendererID_12, 
            type = "state", 
            value = l_value_4
        });
    end;
end;
v32.reloadAndProfile = function(v157, v158) --[[ Line: 580 ]] --[[ Name: reloadAndProfile ]]
    -- upvalues: l_sessionStorageSetItem_0 (copy), l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 (copy), l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 (copy)
    l_sessionStorageSetItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0, "true");
    l_sessionStorageSetItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0, v158 and "true" or "false");
    v157._bridge:send("reloadAppForProfiling");
end;
v32.renamePath = function(v159, v160) --[[ Line: 598 ]] --[[ Name: renamePath ]]
    -- upvalues: l_console_0 (copy)
    local l_hookID_3 = v160.hookID;
    local l_id_12 = v160.id;
    local l_newPath_0 = v160.newPath;
    local l_oldPath_0 = v160.oldPath;
    local l_rendererID_13 = v160.rendererID;
    local l_type_2 = v160.type;
    local v167 = v159._rendererInterfaces[l_rendererID_13];
    if v167 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_13, l_id_12));
        return;
    else
        v167.renamePath(l_type_2, l_id_12, l_hookID_3, l_oldPath_0, l_newPath_0);
        return;
    end;
end;
v32.selectNode = function(v168, v169) --[[ Line: 616 ]] --[[ Name: selectNode ]]
    local v170 = v168:getIDForNode(v169);
    if v170 ~= nil then
        v168._bridge:send("selectFiber", v170);
    end;
end;
v32.setRendererInterface = function(v171, v172, v173) --[[ Line: 623 ]] --[[ Name: setRendererInterface ]]
    v171._rendererInterfaces[v172] = v173;
    if v171._isProfiling then
        v173.startProfiling(v171._recordChangeDescriptions);
    end;
    v173.setTraceUpdatesEnabled(v171._traceUpdatesEnabled);
    local l__persistedSelection_0 = v171._persistedSelection;
    if l__persistedSelection_0 ~= nil and l__persistedSelection_0.rendererID == v172 then
        v173.setTrackedPath(l__persistedSelection_0.path);
    end;
end;
v32.setTraceUpdatesEnabled = function(v175, v176) --[[ Line: 647 ]] --[[ Name: setTraceUpdatesEnabled ]]
    v175._traceUpdatesEnabled = v176;
    for _, v178 in v175._rendererInterfaces do
        v178.setTraceUpdatesEnabled(v176);
    end;
end;
v32.syncSelectionFromNativeElementsPanel = function(v179) --[[ Line: 656 ]] --[[ Name: syncSelectionFromNativeElementsPanel ]]
    -- upvalues: l__G_0 (copy)
    local v180 = l__G_0.__REACT_DEVTOOLS_GLOBAL_HOOK__["$0"];
    if v180 == nil then
        return;
    else
        v179:selectNode(v180);
        return;
    end;
end;
v32.shutdown = function(v181) --[[ Line: 665 ]] --[[ Name: shutdown ]]
    v181:emit("shutdown");
end;
v32.startProfiling = function(v182, v183) --[[ Line: 669 ]] --[[ Name: startProfiling ]]
    v182._recordChangeDescriptions = v183;
    v182._isProfiling = true;
    for _, v185 in v182._rendererInterfaces do
        v185.startProfiling(v183);
    end;
    v182._bridge:send("profilingStatus", v182._isProfiling);
end;
v32.stopProfiling = function(v186) --[[ Line: 679 ]] --[[ Name: stopProfiling ]]
    v186._isProfiling = false;
    v186._recordChangeDescriptions = false;
    for _, v188 in v186._rendererInterfaces do
        v188.stopProfiling();
    end;
    v186._bridge:send("profilingStatus", v186._isProfiling);
end;
v32.storeAsGlobal = function(v189, v190) --[[ Line: 690 ]] --[[ Name: storeAsGlobal ]]
    -- upvalues: l_console_0 (copy)
    local l_count_0 = v190.count;
    local l_id_13 = v190.id;
    local l_path_8 = v190.path;
    local l_rendererID_14 = v190.rendererID;
    local v195 = v189._rendererInterfaces[l_rendererID_14];
    if v195 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_14, l_id_13));
        return;
    else
        v195.storeAsGlobal(l_id_13, l_path_8, l_count_0);
        return;
    end;
end;
v32.updateConsolePatchSettings = function(_, v197) --[[ Line: 707 ]] --[[ Name: updateConsolePatchSettings ]]
    local l_appendComponentStack_0 = v197.appendComponentStack;
    local l_breakOnConsoleErrors_0 = v197.breakOnConsoleErrors;
    if l_appendComponentStack_0 or l_breakOnConsoleErrors_0 then
        local _ = {
            appendComponentStack = l_appendComponentStack_0, 
            breakOnConsoleErrors = l_breakOnConsoleErrors_0
        };
        return;
    else
        return;
    end;
end;
v32.updateComponentFilters = function(v201, v202) --[[ Line: 727 ]] --[[ Name: updateComponentFilters ]]
    for _, v204 in v201._rendererInterfaces do
        v204.updateComponentFilters(v202);
    end;
end;
v32.viewAttributeSource = function(v205, v206) --[[ Line: 732 ]] --[[ Name: viewAttributeSource ]]
    -- upvalues: l_console_0 (copy)
    local l_id_14 = v206.id;
    local l_path_9 = v206.path;
    local l_rendererID_15 = v206.rendererID;
    local v210 = v205._rendererInterfaces[l_rendererID_15];
    if v210 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_15, l_id_14));
        return;
    else
        v210.prepareViewAttributeSource(l_id_14, l_path_9);
        return;
    end;
end;
v32.viewElementSource = function(v211, v212) --[[ Line: 745 ]] --[[ Name: viewElementSource ]]
    -- upvalues: l_console_0 (copy)
    local l_id_15 = v212.id;
    local l_rendererID_16 = v212.rendererID;
    local v215 = v211._rendererInterfaces[l_rendererID_16];
    if v215 == nil then
        l_console_0.warn(string.format("Invalid renderer id \"%d\" for element \"%d\"", l_rendererID_16, l_id_15));
        return;
    else
        v215.prepareViewElementSource(l_id_15);
        return;
    end;
end;
v32.onTraceUpdates = function(v216, v217) --[[ Line: 757 ]] --[[ Name: onTraceUpdates ]]
    v216:emit("traceUpdates", v217);
end;
v32.onHookOperations = function(v218, v219) --[[ Line: 760 ]] --[[ Name: onHookOperations ]]
    -- upvalues: l__G_0 (copy), v31 (copy), l_console_0 (copy)
    if l__G_0.__DEBUG__ then
        v31("onHookOperations", v219);
    end;
    v218._bridge:send("operations", v219);
    if v218._persistedSelection ~= nil then
        local v220 = v219[1];
        if v218._persistedSelection.rendererID == v220 then
            local v221 = v218._rendererInterfaces[v220];
            if v221 == nil then
                l_console_0.warn(string.format("Invalid renderer id \"%d\"", v220));
                return;
            else
                local l__persistedSelectionMatch_0 = v218._persistedSelectionMatch;
                local v223 = v221.getBestMatchForTrackedPath();
                v218._persistedSelectionMatch = v223;
                local v224 = if l__persistedSelectionMatch_0 ~= nil then l__persistedSelectionMatch_0.id else nil;
                local v225 = if v223 ~= nil then v223.id else nil;
                if v224 ~= v225 and v225 ~= nil then
                    v218._bridge:send("selectFiber", v225);
                end;
                if v223 ~= nil and v223.isFullMatch then
                    v218._persistedSelection = nil;
                    v218._persistedSelectionMatch = nil;
                    v221.setTrackedPath(nil);
                end;
            end;
        end;
    end;
end;
v32.onUnsupportedRenderer = function(v226, v227) --[[ Line: 823 ]] --[[ Name: onUnsupportedRenderer ]]
    v226._bridge:send("unsupportedRendererVersion", v227);
end;
v32._throttledPersistSelection = function(v228, v229, v230) --[[ Line: 827 ]]
    -- upvalues: l_sessionStorageSetItem_0 (copy), l_SESSION_STORAGE_LAST_SELECTION_KEY_0 (copy), l_HttpService_0 (copy), l_sessionStorageRemoveItem_0 (copy)
    local v231 = v228._rendererInterfaces[v229];
    local v232 = if v231 ~= nil then v231.getPathForElement(v230) else nil;
    if v232 ~= nil then
        l_sessionStorageSetItem_0(l_SESSION_STORAGE_LAST_SELECTION_KEY_0, l_HttpService_0:JSONEncode({
            rendererID = v229, 
            path = v232
        }));
        return;
    else
        l_sessionStorageRemoveItem_0(l_SESSION_STORAGE_LAST_SELECTION_KEY_0);
        return;
    end;
end;
return v32;