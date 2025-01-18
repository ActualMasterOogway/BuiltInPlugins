local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local function _() --[[ Line: 17 ]] --[[ Name: getCoreScriptSyncService ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
        return game:GetService("CoreScriptSyncService");
    end);
    return l_status_0 and l_result_0 or nil;
end;
local v5 = nil;
local v6 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Error_0 = v6.Error;
local l_Object_0 = v6.Object;
local l_Set_0 = v6.Set;
local v11 = require(l_Parent_0.utils);
local l_addExtraLineBreaks_0 = v11.addExtraLineBreaks;
local l_getSnapshotData_0 = v11.getSnapshotData;
local l_keyToTestName_0 = v11.keyToTestName;
local l_removeExtraLineBreaks_0 = v11.removeExtraLineBreaks;
local l_saveSnapshotFile_0 = v11.saveSnapshotFile;
local l_serialize_0 = v11.serialize;
local l_testNameToKey_0 = v11.testNameToKey;
local l_robloxGetParent_0 = v11.robloxGetParent;
local _ = require(l_Parent_0.types);
local v21 = {};
v21.__index = v21;
v21.new = function(v22, v23) --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: l_getSnapshotData_0 (copy), l_Set_0 (copy), l_Object_0 (copy), v21 (copy)
    local v24 = l_getSnapshotData_0(v22, v23.updateSnapshot);
    local l_data_0 = v24.data;
    local l_dirty_0 = v24.dirty;
    return (setmetatable({
        _snapshotPath = v22, 
        _initialData = l_data_0, 
        _snapshotData = l_data_0, 
        _dirty = l_dirty_0, 
        _inlineSnapshots = {}, 
        _uncheckedKeys = l_Set_0.new(l_Object_0.keys(l_data_0)), 
        _counters = {}, 
        _index = 0, 
        expand = v23.expand or false, 
        added = 0, 
        matched = 0, 
        unmatched = 0, 
        _updateSnapshot = v23.updateSnapshot, 
        updated = 0
    }, v21));
end;
v21.markSnapshotsAsCheckedForTest = function(v27, v28) --[[ Line: 145 ]] --[[ Name: markSnapshotsAsCheckedForTest ]]
    -- upvalues: l_keyToTestName_0 (copy)
    for _, v30 in v27._uncheckedKeys:ipairs() do
        if l_keyToTestName_0(v30) == v28 then
            v27._uncheckedKeys:delete(v30);
        end;
    end;
end;
v21._addSnapshot = function(v31, v32, v33, v34) --[[ Line: 154 ]] --[[ Name: _addSnapshot ]]
    -- upvalues: l_Error_0 (copy)
    v31._dirty = true;
    if v34.isInline then
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        return;
    else
        v31._snapshotData[v32] = v33;
        return;
    end;
end;
v21.clear = function(v35) --[[ Line: 168 ]] --[[ Name: clear ]]
    v35._snapshotData = v35._initialData;
    v35._inlineSnapshots = {};
    v35._counters = {};
    v35._index = 0;
    v35.added = 0;
    v35.matched = 0;
    v35.unmatched = 0;
    v35.updated = 0;
end;
v21.save = function(v36) --[[ Line: 179 ]] --[[ Name: save ]]
    -- upvalues: l_Object_0 (copy), v5 (ref), l_Error_0 (copy), l_robloxGetParent_0 (copy), l_saveSnapshotFile_0 (copy)
    local v37 = #l_Object_0.keys(v36._snapshotData);
    local v38 = #v36._inlineSnapshots > 0;
    local v39 = not v37 and not v38;
    local v40 = {
        deleted = false, 
        saved = false
    };
    if v5 == nil then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 18 ]]
            return game:GetService("CoreScriptSyncService");
        end);
        v5 = l_status_1 and l_result_1 or nil or false;
    end;
    if not v5 then
        error(l_Error_0("Attempting to save snapshots in an environment where CoreScriptSyncService is inaccessible.\n" .. "You may need to pass in --load.asRobloxScript."));
    end;
    local l_v5_ScriptFilePath_0 = v5:GetScriptFilePath(_G.__JEST_TEST_CONTEXT__.instance);
    l_v5_ScriptFilePath_0 = l_robloxGetParent_0(l_v5_ScriptFilePath_0, 1) .. "/__snapshots__/" .. _G.__JEST_TEST_CONTEXT__.instance.Name:match("(.*)%.spec") .. ".snap.lua";
    if (v36._dirty or v36._uncheckedKeys.size) and not v39 then
        if v37 then
            l_saveSnapshotFile_0(v36._snapshotData, l_v5_ScriptFilePath_0);
        end;
        if v38 then
            error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        end;
        v40.saved = true;
        return v40;
    else
        if not v37 and require(l_v5_ScriptFilePath_0) then
            if v36._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox or in #jest-roblox");
            end;
            v40.deleted = true;
        end;
        return v40;
    end;
end;
v21.getUncheckedCount = function(v44) --[[ Line: 234 ]] --[[ Name: getUncheckedCount ]]
    return v44._uncheckedKeys.size or 0;
end;
v21.getUncheckedKeys = function(v45) --[[ Line: 238 ]] --[[ Name: getUncheckedKeys ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.from(v45._uncheckedKeys);
end;
v21.removeUncheckedKeys = function(v46) --[[ Line: 242 ]] --[[ Name: removeUncheckedKeys ]]
    if v46._updateSnapshot == "all" and v46._uncheckedKeys.size > 0 then
        v46._dirty = true;
        for _, v48 in v46._uncheckedKeys:ipairs() do
            v46._snapshotData[v48] = nil;
        end;
        v46._uncheckedKeys:clear();
    end;
end;
v21.match = function(v49, v50) --[[ Line: 252 ]] --[[ Name: match ]]
    -- upvalues: l_testNameToKey_0 (copy), l_addExtraLineBreaks_0 (copy), l_serialize_0 (copy), l_Error_0 (copy), l_removeExtraLineBreaks_0 (copy)
    local l_testName_0 = v50.testName;
    local l_received_0 = v50.received;
    local l_key_0 = v50.key;
    local l_isInline_0 = v50.isInline;
    local l_error__0 = v50.error_;
    v49._counters[l_testName_0] = (v49._counters[l_testName_0] or 0) + 1;
    local v56 = v49._counters[l_testName_0];
    if not l_key_0 then
        l_key_0 = l_testNameToKey_0(l_testName_0, v56);
    end;
    if not l_isInline_0 or not v49._snapshotData[l_key_0] then
        v49._uncheckedKeys:delete(l_key_0);
    end;
    local v57 = l_addExtraLineBreaks_0(l_serialize_0(l_received_0));
    local v58 = nil;
    if l_isInline_0 then
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
    else
        v58 = v49._snapshotData[l_key_0];
    end;
    local v59 = v58 == v57;
    local v60 = v58 ~= nil;
    local l_status_2, _ = pcall(function() --[[ Line: 288 ]]
        -- upvalues: v49 (copy)
        require(v49._snapshotPath);
    end);
    local v63 = l_isInline_0 or l_status_2;
    if v59 and not l_isInline_0 then
        v49._snapshotData[l_key_0] = v57;
    end;
    if v60 and v49._updateSnapshot == "all" or (not v60 or not v63) and (v49._updateSnapshot == "new" or v49._updateSnapshot == "all") then
        if v49._updateSnapshot == "all" then
            if not v59 then
                if v60 then
                    v49.updated = v49.updated + 1;
                else
                    v49.added = v49.added + 1;
                end;
                v49:_addSnapshot(l_key_0, v57, {
                    error = l_error__0, 
                    isInline = l_isInline_0
                });
            else
                v49.matched = v49.matched + 1;
            end;
        else
            v49:_addSnapshot(l_key_0, v57, {
                error = l_error__0, 
                isInline = l_isInline_0
            });
            v49.added = v49.added + 1;
        end;
        return {
            actual = "", 
            count = v56, 
            expected = "", 
            key = l_key_0, 
            pass = true
        };
    elseif not v59 then
        v49.unmatched = v49.unmatched + 1;
        local v64 = nil;
        v64 = if v58 then l_removeExtraLineBreaks_0(v58) else nil;
        return {
            actual = l_removeExtraLineBreaks_0(v57), 
            count = v56, 
            expected = v64, 
            key = l_key_0, 
            pass = false
        };
    else
        v49.matched = v49.matched + 1;
        return {
            actual = "", 
            count = v56, 
            expected = "", 
            key = l_key_0, 
            pass = true
        };
    end;
end;
v21.fail = function(v65, v66, _, v68) --[[ Line: 366 ]] --[[ Name: fail ]]
    -- upvalues: l_testNameToKey_0 (copy)
    v65._counters[v66] = (v65._counters[v66] or 0) + 1;
    local v69 = v65._counters[v66];
    v68 = v68 or l_testNameToKey_0(v66, v69);
    v65._uncheckedKeys:delete(v68);
    v65.unmatched = v65.unmatched + 1;
    return v68;
end;
return v21;