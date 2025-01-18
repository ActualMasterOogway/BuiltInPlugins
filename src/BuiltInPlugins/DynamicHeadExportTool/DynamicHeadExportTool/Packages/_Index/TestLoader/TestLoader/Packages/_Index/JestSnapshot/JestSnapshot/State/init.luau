local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local _ = require(l_Parent_1.JestTypes);
local _ = require(l_Parent_0.PrettyFormat);
local v9 = require(l_Parent_0.utils);
local l_addExtraLineBreaks_0 = v9.addExtraLineBreaks;
local l_getSnapshotData_0 = v9.getSnapshotData;
local l_keyToTestName_0 = v9.keyToTestName;
local l_removeExtraLineBreaks_0 = v9.removeExtraLineBreaks;
local l_saveSnapshotFile_0 = v9.saveSnapshotFile;
local l_serialize_0 = v9.serialize;
local l_testNameToKey_0 = v9.testNameToKey;
local _ = require(l_Parent_0.types);
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20) --[[ Line: 148 ]] --[[ Name: new ]]
    -- upvalues: l_getSnapshotData_0 (copy), l_Set_0 (copy), l_Object_0 (copy), v18 (copy)
    local v21 = l_getSnapshotData_0(v19.getInstance(), v20.updateSnapshot);
    local l_data_0 = v21.data;
    local l_dirty_0 = v21.dirty;
    return (setmetatable({
        _snapshotPath = v19, 
        _initialData = l_data_0, 
        _snapshotData = l_data_0, 
        _dirty = l_dirty_0, 
        _inlineSnapshots = {}, 
        _uncheckedKeys = l_Set_0.new(l_Object_0.keys(l_data_0)), 
        _counters = {}, 
        _index = 0, 
        expand = v20.expand or false, 
        added = 0, 
        matched = 0, 
        unmatched = 0, 
        _updateSnapshot = v20.updateSnapshot, 
        updated = 0, 
        _snapshotFormat = v20.snapshotFormat
    }, v18));
end;
v18.markSnapshotsAsCheckedForTest = function(v24, v25) --[[ Line: 180 ]] --[[ Name: markSnapshotsAsCheckedForTest ]]
    -- upvalues: l_keyToTestName_0 (copy)
    for _, v27 in v24._uncheckedKeys do
        if l_keyToTestName_0(v27) == v25 then
            v24._uncheckedKeys:delete(v27);
        end;
    end;
end;
v18._addSnapshot = function(v28, v29, v30, v31) --[[ Line: 189 ]] --[[ Name: _addSnapshot ]]
    -- upvalues: l_Error_0 (copy)
    v28._dirty = true;
    if v31.isInline then
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        return;
    else
        v28._snapshotData[v29] = v30;
        return;
    end;
end;
v18.clear = function(v32) --[[ Line: 203 ]] --[[ Name: clear ]]
    v32._snapshotData = v32._initialData;
    v32._inlineSnapshots = {};
    v32._counters = {};
    v32._index = 0;
    v32.added = 0;
    v32.matched = 0;
    v32.unmatched = 0;
    v32.updated = 0;
end;
v18.save = function(v33) --[[ Line: 214 ]] --[[ Name: save ]]
    -- upvalues: l_Object_0 (copy), l_saveSnapshotFile_0 (copy), l_Error_0 (copy)
    local v34 = #l_Object_0.keys(v33._snapshotData) > 0;
    local v35 = #v33._inlineSnapshots > 0;
    local v36 = not v34 and not v35;
    local v37 = {
        deleted = false, 
        saved = false
    };
    if (v33._dirty or v33._uncheckedKeys.size > 0) and not v36 then
        if v34 and (v33._dirty or v33._updateSnapshot == "all") then
            l_saveSnapshotFile_0(v33._snapshotData, v33._snapshotPath.getPath());
        end;
        if v35 then
            error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
        end;
        v37.saved = true;
        return v37;
    else
        if not v34 and v33._snapshotPath.getInstance() ~= nil then
            if v33._updateSnapshot == "all" then
                error("Jest-Roblox: You shouldn't reach this code path. Please file an issue at github.com/Roblox/jest-roblox-internal or in #jest-roblox");
            end;
            v37.deleted = true;
        end;
        return v37;
    end;
end;
v18.getUncheckedCount = function(v38) --[[ Line: 261 ]] --[[ Name: getUncheckedCount ]]
    return v38._uncheckedKeys.size or 0;
end;
v18.getUncheckedKeys = function(v39) --[[ Line: 265 ]] --[[ Name: getUncheckedKeys ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.from(v39._uncheckedKeys);
end;
v18.removeUncheckedKeys = function(v40) --[[ Line: 269 ]] --[[ Name: removeUncheckedKeys ]]
    if v40._updateSnapshot == "all" and v40._uncheckedKeys.size > 0 then
        v40._dirty = true;
        for _, v42 in v40._uncheckedKeys do
            v40._snapshotData[v42] = nil;
        end;
        v40._uncheckedKeys:clear();
    end;
end;
v18.match = function(v43, v44) --[[ Line: 279 ]] --[[ Name: match ]]
    -- upvalues: l_testNameToKey_0 (copy), l_addExtraLineBreaks_0 (copy), l_serialize_0 (copy), l_Error_0 (copy), l_removeExtraLineBreaks_0 (copy)
    local l_testName_0 = v44.testName;
    local l_received_0 = v44.received;
    local l_isInline_0 = v44.isInline;
    local l_error__0 = v44.error_;
    v43._counters[l_testName_0] = (v43._counters[l_testName_0] or 0) + 1;
    local v49 = v43._counters[l_testName_0];
    local v50 = if v44.key then v44.key else l_testNameToKey_0(l_testName_0, v49);
    if not l_isInline_0 or v43._snapshotData[v50] == nil then
        v43._uncheckedKeys:delete(v50);
    end;
    local v51 = l_addExtraLineBreaks_0(l_serialize_0(l_received_0, nil, v43._snapshotFormat));
    local v52 = nil;
    if l_isInline_0 then
        error(l_Error_0("Jest-Roblox: inline snapshot testing is not currently supported"));
    else
        v52 = v43._snapshotData[v50];
    end;
    local v53 = v52 == v51;
    local v54 = v52 ~= nil;
    local l_status_0, _ = pcall(function() --[[ Line: 311 ]]
        -- upvalues: v43 (copy)
        local _ = require(v43._snapshotPath.getInstance());
    end);
    local v58 = l_isInline_0 or l_status_0;
    if v53 and not l_isInline_0 then
        v43._snapshotData[v50] = v51;
    end;
    if v54 and v43._updateSnapshot == "all" or (not v54 or not v58) and (v43._updateSnapshot == "new" or v43._updateSnapshot == "all") then
        if v43._updateSnapshot == "all" then
            if not v53 then
                if v54 then
                    v43.updated = v43.updated + 1;
                else
                    v43.added = v43.added + 1;
                end;
                v43:_addSnapshot(v50, v51, {
                    error = l_error__0, 
                    isInline = l_isInline_0
                });
            else
                v43.matched = v43.matched + 1;
            end;
        else
            v43:_addSnapshot(v50, v51, {
                error = l_error__0, 
                isInline = l_isInline_0
            });
            v43.added = v43.added + 1;
        end;
        return {
            actual = "", 
            count = v49, 
            expected = "", 
            key = v50, 
            pass = true
        };
    elseif not v53 then
        v43.unmatched = v43.unmatched + 1;
        local v59 = if v52 then l_removeExtraLineBreaks_0(v52) else nil;
        return {
            actual = l_removeExtraLineBreaks_0(v51), 
            count = v49, 
            expected = v59, 
            key = v50, 
            pass = false
        };
    else
        v43.matched = v43.matched + 1;
        return {
            actual = "", 
            count = v49, 
            expected = "", 
            key = v50, 
            pass = true
        };
    end;
end;
v18.fail = function(v60, v61, _, v63) --[[ Line: 388 ]] --[[ Name: fail ]]
    -- upvalues: l_testNameToKey_0 (copy)
    v60._counters[v61] = (v60._counters[v61] or 0) + 1;
    local v64 = v60._counters[v61];
    v63 = v63 or l_testNameToKey_0(v61, v64);
    v60._uncheckedKeys:delete(v63);
    v60.unmatched = v60.unmatched + 1;
    return v63;
end;
return {
    default = v18
};