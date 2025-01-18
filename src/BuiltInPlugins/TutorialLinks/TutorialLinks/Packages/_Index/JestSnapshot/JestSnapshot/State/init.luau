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
local _ = require(l_Parent_0.PrettyFormat);
local v12 = require(l_Parent_0.utils);
local l_addExtraLineBreaks_0 = v12.addExtraLineBreaks;
local l_getSnapshotData_0 = v12.getSnapshotData;
local l_keyToTestName_0 = v12.keyToTestName;
local l_removeExtraLineBreaks_0 = v12.removeExtraLineBreaks;
local l_saveSnapshotFile_0 = v12.saveSnapshotFile;
local l_serialize_0 = v12.serialize;
local l_testNameToKey_0 = v12.testNameToKey;
local l_robloxGetParent_0 = v12.robloxGetParent;
local _ = require(l_Parent_0.types);
local v22 = {};
v22.__index = v22;
v22.new = function(v23, v24) --[[ Line: 133 ]] --[[ Name: new ]]
    -- upvalues: l_getSnapshotData_0 (copy), l_Set_0 (copy), l_Object_0 (copy), v22 (copy)
    local v25 = l_getSnapshotData_0(v23, v24.updateSnapshot);
    local l_data_0 = v25.data;
    local l_dirty_0 = v25.dirty;
    return (setmetatable({
        _snapshotPath = v23, 
        _initialData = l_data_0, 
        _snapshotData = l_data_0, 
        _dirty = l_dirty_0, 
        _inlineSnapshots = {}, 
        _uncheckedKeys = l_Set_0.new(l_Object_0.keys(l_data_0)), 
        _counters = {}, 
        _index = 0, 
        expand = v24.expand or false, 
        added = 0, 
        matched = 0, 
        unmatched = 0, 
        _updateSnapshot = v24.updateSnapshot, 
        updated = 0, 
        _snapshotFormat = v24.snapshotFormat
    }, v22));
end;
v22.markSnapshotsAsCheckedForTest = function(v28, v29) --[[ Line: 160 ]] --[[ Name: markSnapshotsAsCheckedForTest ]]
    -- upvalues: l_keyToTestName_0 (copy)
    for _, v31 in v28._uncheckedKeys:ipairs() do
        if l_keyToTestName_0(v31) == v29 then
            v28._uncheckedKeys:delete(v31);
        end;
    end;
end;
v22._addSnapshot = function(v32, v33, v34, v35) --[[ Line: 169 ]] --[[ Name: _addSnapshot ]]
    -- upvalues: l_Error_0 (copy)
    v32._dirty = true;
    if v35.isInline then
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        return;
    else
        v32._snapshotData[v33] = v34;
        return;
    end;
end;
v22.clear = function(v36) --[[ Line: 183 ]] --[[ Name: clear ]]
    v36._snapshotData = v36._initialData;
    v36._inlineSnapshots = {};
    v36._counters = {};
    v36._index = 0;
    v36.added = 0;
    v36.matched = 0;
    v36.unmatched = 0;
    v36.updated = 0;
end;
v22.save = function(v37) --[[ Line: 194 ]] --[[ Name: save ]]
    -- upvalues: l_Object_0 (copy), v5 (ref), l_Error_0 (copy), l_robloxGetParent_0 (copy), l_saveSnapshotFile_0 (copy)
    local v38 = #l_Object_0.keys(v37._snapshotData);
    local v39 = #v37._inlineSnapshots > 0;
    local v40 = not v38 and not v39;
    local v41 = {
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
    local v44 = l_robloxGetParent_0(v5:GetScriptFilePath(_G.__JEST_TEST_CONTEXT__.instance), 1) .. "/__snapshots__/" .. _G.__JEST_TEST_CONTEXT__.instance.Name:match("(.*)%.spec") .. ".snap.lua";
    if (v37._dirty or v37._uncheckedKeys.size) and not v40 then
        if v38 then
            l_saveSnapshotFile_0(v37._snapshotData, v44);
        end;
        if v39 then
            error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        end;
        v41.saved = true;
        return v41;
    else
        if not v38 and require(v44) then
            if v37._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox or in #jest-roblox");
            end;
            v41.deleted = true;
        end;
        return v41;
    end;
end;
v22.getUncheckedCount = function(v45) --[[ Line: 251 ]] --[[ Name: getUncheckedCount ]]
    return v45._uncheckedKeys.size or 0;
end;
v22.getUncheckedKeys = function(v46) --[[ Line: 255 ]] --[[ Name: getUncheckedKeys ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.from(v46._uncheckedKeys);
end;
v22.removeUncheckedKeys = function(v47) --[[ Line: 259 ]] --[[ Name: removeUncheckedKeys ]]
    if v47._updateSnapshot == "all" and v47._uncheckedKeys.size > 0 then
        v47._dirty = true;
        for _, v49 in v47._uncheckedKeys:ipairs() do
            v47._snapshotData[v49] = nil;
        end;
        v47._uncheckedKeys:clear();
    end;
end;
v22.match = function(v50, v51) --[[ Line: 269 ]] --[[ Name: match ]]
    -- upvalues: l_testNameToKey_0 (copy), l_addExtraLineBreaks_0 (copy), l_serialize_0 (copy), l_Error_0 (copy), l_removeExtraLineBreaks_0 (copy)
    local l_testName_0 = v51.testName;
    local l_received_0 = v51.received;
    local l_isInline_0 = v51.isInline;
    local l_error__0 = v51.error_;
    v50._counters[l_testName_0] = (v50._counters[l_testName_0] or 0) + 1;
    local v56 = v50._counters[l_testName_0];
    local v57 = if v51.key then v51.key else l_testNameToKey_0(l_testName_0, v56);
    if not l_isInline_0 or v50._snapshotData[v57] == nil then
        v50._uncheckedKeys:delete(v57);
    end;
    local v58 = l_addExtraLineBreaks_0(l_serialize_0(l_received_0, nil, v50._snapshotFormat));
    local v59 = nil;
    if l_isInline_0 then
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
    else
        v59 = v50._snapshotData[v57];
    end;
    local v60 = v59 == v58;
    local v61 = v59 ~= nil;
    local l_status_2, _ = pcall(function() --[[ Line: 299 ]]
        -- upvalues: v50 (copy)
        local _ = require(v50._snapshotPath);
    end);
    local v65 = l_isInline_0 or l_status_2;
    if v60 and not l_isInline_0 then
        v50._snapshotData[v57] = v58;
    end;
    if v61 and v50._updateSnapshot == "all" or (not v61 or not v65) and (v50._updateSnapshot == "new" or v50._updateSnapshot == "all") then
        if v50._updateSnapshot == "all" then
            if not v60 then
                if v61 then
                    v50.updated = v50.updated + 1;
                else
                    v50.added = v50.added + 1;
                end;
                v50:_addSnapshot(v57, v58, {
                    error = l_error__0, 
                    isInline = l_isInline_0
                });
            else
                v50.matched = v50.matched + 1;
            end;
        else
            v50:_addSnapshot(v57, v58, {
                error = l_error__0, 
                isInline = l_isInline_0
            });
            v50.added = v50.added + 1;
        end;
        return {
            actual = "", 
            count = v56, 
            expected = "", 
            key = v57, 
            pass = true
        };
    elseif not v60 then
        v50.unmatched = v50.unmatched + 1;
        local v66 = if v59 then l_removeExtraLineBreaks_0(v59) else nil;
        return {
            actual = l_removeExtraLineBreaks_0(v58), 
            count = v56, 
            expected = v66, 
            key = v57, 
            pass = false
        };
    else
        v50.matched = v50.matched + 1;
        return {
            actual = "", 
            count = v56, 
            expected = "", 
            key = v57, 
            pass = true
        };
    end;
end;
v22.fail = function(v67, v68, _, v70) --[[ Line: 376 ]] --[[ Name: fail ]]
    -- upvalues: l_testNameToKey_0 (copy)
    v67._counters[v68] = (v67._counters[v68] or 0) + 1;
    local v71 = v67._counters[v68];
    v70 = v70 or l_testNameToKey_0(v68, v71);
    v67._uncheckedKeys:delete(v70);
    v67.unmatched = v67.unmatched + 1;
    return v70;
end;
return v22;