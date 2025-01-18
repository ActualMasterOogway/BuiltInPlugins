local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v6 = {};
local l_path_0 = require(l_Parent_1.Path).path;
local v8 = require(l_Parent_1.ChalkLua);
local function v10(v9) --[[ Line: 25 ]]
    return v9:gsub("\\", "/");
end;
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local v13 = require(l_Parent_1.JestUtil);
local l_formatTime_0 = v13.formatTime;
local l_pluralize_0 = v13.pluralize;
local _ = require(l_Parent_0.types);
local v17 = nil;
local v18 = nil;
v6.printDisplayName = function(v19) --[[ Line: 52 ]] --[[ Name: printDisplayName ]]
    -- upvalues: v8 (copy), l_Boolean_0 (copy)
    local l_displayName_0 = v19.displayName;
    local function v21(...) --[[ Line: 56 ]]
        -- upvalues: v8 (ref)
        return v8.reset(v8.inverse(v8.white(...)));
    end;
    if not l_Boolean_0.toJSBoolean(l_displayName_0) then
        return "";
    else
        local v22 = nil;
        local v23 = nil;
        if l_displayName_0 ~= nil then
            v22 = l_displayName_0.name;
            v23 = l_displayName_0.color;
        end;
        local function v24(...) --[[ Line: 67 ]]
            -- upvalues: l_Boolean_0 (ref), v23 (ref), v8 (ref), v21 (copy)
            if l_Boolean_0.toJSBoolean(v23) and v8[v23] ~= nil then
                return v8.reset(v8.inverse(v8[v23](...)));
            else
                return v21(...);
            end;
        end;
        return if not (v8.supportsColor ~= nil) or v8.supportsColor == true then v24((" %s "):format(v22)) else v22;
    end;
end;
v6.trimAndFormatPath = function(v25, v26, v27, v28) --[[ Line: 83 ]] --[[ Name: trimAndFormatPath ]]
    -- upvalues: v17 (ref), l_path_0 (copy), v10 (copy), v8 (copy), l_String_0 (copy)
    local v29 = v28 - v25;
    local v30 = v17(v26, v27);
    local l_basename_0 = v30.basename;
    local l_dirname_0 = v30.dirname;
    local v33 = utf8.len(l_dirname_0 .. l_path_0.sep .. l_basename_0);
    assert(v33 ~= nil);
    if v33 <= v29 then
        return v10(v8.dim(l_dirname_0 .. l_path_0.sep) .. v8.bold(l_basename_0));
    else
        local v34 = utf8.len(l_basename_0);
        assert(v34);
        if v34 + 4 < v29 then
            local v35 = v29 - 4 - v34;
            l_dirname_0 = "..." .. l_String_0.slice(l_dirname_0, utf8.len(l_dirname_0) - v35 + 1, utf8.len(l_dirname_0) + 1);
            return v10(v8.dim(l_dirname_0 .. l_path_0.sep) .. v8.bold(l_basename_0));
        elseif v34 + 4 == v29 then
            return v10(v8.dim("..." .. l_path_0.sep) .. v8.bold(l_basename_0));
        else
            return v10(v8.bold("..." .. l_String_0.slice(l_basename_0, v34 - v29 - 4, v34 + 1)));
        end;
    end;
end;
v6.formatTestPath = function(v36, v37) --[[ Line: 128 ]] --[[ Name: formatTestPath ]]
    -- upvalues: v17 (ref), v10 (copy), v8 (copy), l_path_0 (copy)
    local v38 = v17(v36, v37);
    local l_dirname_1 = v38.dirname;
    local l_basename_1 = v38.basename;
    return v10(v8.dim(l_dirname_1 .. l_path_0.sep) .. v8.bold(l_basename_1));
end;
v17 = function(_, v42) --[[ Line: 135 ]] --[[ Name: relativePath ]]
    -- upvalues: l_path_0 (copy)
    local v43 = l_path_0:dirname(v42);
    return {
        basename = l_path_0:basename(v42), 
        dirname = v43
    };
end;
v6.relativePath = v17;
local function v52(v44) --[[ Line: 156 ]] --[[ Name: getValuesCurrentTestCases ]]
    -- upvalues: l_Array_0 (copy)
    if v44 == nil then
        v44 = {};
    end;
    local v45 = 0;
    local v46 = 0;
    local v47 = 0;
    local v48 = 0;
    local v49 = 0;
    l_Array_0.forEach(v44, function(v50) --[[ Line: 165 ]]
        -- upvalues: v45 (ref), v46 (ref), v47 (ref), v48 (ref), v49 (ref)
        local l_status_0 = v50.testCaseResult.status;
        if l_status_0 == "failed" then
            v45 = v45 + 1;
        elseif l_status_0 == "passed" then
            v46 = v46 + 1;
        elseif l_status_0 == "skipped" then
            v47 = v47 + 1;
        elseif l_status_0 == "todo" then
            v48 = v48 + 1;
        end;
        v49 = v49 + 1;
    end);
    return {
        numFailingTests = v45, 
        numPassingTests = v46, 
        numPendingTests = v47, 
        numTodoTests = v48, 
        numTotalTests = v49
    };
end;
v6.getSummary = function(v53, v54) --[[ Line: 188 ]] --[[ Name: getSummary ]]
    -- upvalues: v52 (copy), v8 (copy), l_Boolean_0 (copy), l_pluralize_0 (copy), v18 (ref), l_Array_0 (copy)
    local v55 = (DateTime.now().UnixTimestampMillis - v53.startTime) / 1000;
    if v54 ~= nil and v54.roundTime then
        v55 = math.floor(v55);
    end;
    local v56 = v52(if v54 ~= nil then v54.currentTestCases else nil);
    local v57 = v54 ~= nil and v54.estimatedTime or 0;
    local l_snapshot_0 = v53.snapshot;
    local l_added_0 = l_snapshot_0.added;
    local l_unmatched_0 = l_snapshot_0.unmatched;
    local l_unchecked_0 = l_snapshot_0.unchecked;
    local l_filesRemoved_0 = l_snapshot_0.filesRemoved;
    local l_didUpdate_0 = l_snapshot_0.didUpdate;
    local l_matched_0 = l_snapshot_0.matched;
    local l_total_0 = l_snapshot_0.total;
    local l_updated_0 = l_snapshot_0.updated;
    local v67 = v53.numFailedTestSuites or 0;
    local v68 = v53.numPassedTestSuites or 0;
    local v69 = v53.numPendingTestSuites or 0;
    local v70 = v67 + v68;
    local v71 = v53.numTotalTestSuites or 0;
    local v72 = v53.numFailedTests or 0;
    local v73 = v53.numPassedTests or 0;
    local v74 = v53.numPendingTests or 0;
    local v75 = v53.numTodoTests or 0;
    local v76 = v53.numTotalTests or 0;
    local v77 = v54 ~= nil and v54.width or 0;
    local v78 = v8.bold("Test Suites: ") .. (if v67 > 0 then v8.bold(v8.red(("%d failed"):format(v67))) .. ", " else "") .. (if v69 > 0 then v8.bold(v8.yellow(("%d skipped"):format(v69))) .. ", " else "") .. (if v68 > 0 then v8.bold(v8.green(("%d passed"):format(v68))) .. ", " else "") .. (if v70 ~= v71 then tostring(v70) .. " of " .. tostring(v71) else tostring(v71)) .. " total";
    local v79 = v72 + v56.numFailingTests;
    local v80 = v74 + v56.numPendingTests;
    local v81 = v75 + v56.numTodoTests;
    local v82 = v73 + v56.numPassingTests;
    local v83 = v76 + v56.numTotalTests;
    local v84 = v8.bold("Tests:       ") .. (if v79 > 0 then v8.bold(v8.red(("%d failed"):format(v79))) .. ", " else "") .. (if v80 > 0 then v8.bold(v8.yellow(("%d skipped"):format(v80))) .. ", " else "") .. (if v81 > 0 then v8.bold(v8.magenta(("%d todo"):format(v81))) .. ", " else "") .. (if v82 > 0 then v8.bold(v8.green(("%d passed"):format(v82))) .. ", " else "") .. ("%d total"):format(v83);
    local v85 = v8.bold("Snapshots:   ") .. (if l_unmatched_0 > 0 then v8.bold(v8.red(("%d failed"):format(l_unmatched_0))) .. ", " else "") .. ((not l_Boolean_0.toJSBoolean(l_unchecked_0) or l_didUpdate_0) and "" or v8.bold(v8.yellow(("%d obsolete"):format(l_unchecked_0))) .. ", ") .. (if l_Boolean_0.toJSBoolean(l_unchecked_0) and l_didUpdate_0 then v8.bold(v8.green(("%d removed"):format(l_unchecked_0))) .. ", " else "") .. ((not l_Boolean_0.toJSBoolean(l_filesRemoved_0) or l_didUpdate_0) and "" or v8.bold(v8.yellow(l_pluralize_0("file", l_filesRemoved_0) .. " obsolete")) .. ", ") .. (if l_Boolean_0.toJSBoolean(l_filesRemoved_0) and l_didUpdate_0 then v8.bold(v8.green(l_pluralize_0("file", l_filesRemoved_0) .. " removed")) .. ", " else "") .. (if l_Boolean_0.toJSBoolean(l_updated_0) then v8.bold(v8.green(("%d updated"):format(l_updated_0))) .. ", " else "") .. (if l_Boolean_0.toJSBoolean(l_added_0) then v8.bold(v8.green(("%d written"):format(l_added_0))) .. ", " else "") .. (if l_Boolean_0.toJSBoolean(l_matched_0) then v8.bold(v8.green(("%d passed"):format(l_matched_0))) .. ", " else "") .. ("%d total"):format(l_total_0);
    local v86 = v18(v55, v57, v77);
    return l_Array_0.join({
        v78, 
        v84, 
        v85, 
        v86
    }, "\n");
end;
v18 = function(v87, v88, v89) --[[ Line: 277 ]] --[[ Name: renderTime ]]
    -- upvalues: l_Boolean_0 (copy), v8 (copy), l_formatTime_0 (copy)
    local v90 = if l_Boolean_0.toJSBoolean(v88) and v88 + 1 <= v87 then v8.bold(v8.yellow(l_formatTime_0(v87, 0))) else l_formatTime_0(v87, 0);
    local v91 = v8.bold("Time:") .. ("        %s"):format(v90);
    if v87 < v88 then
        v91 = v91 .. (", estimated %s"):format(l_formatTime_0(v88, 0));
    end;
    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
    local v93 = false;
    if v88 > 2 then
        v93 = false;
        if v87 < v88 then
            v93 = v89;
        end;
    end;
    if l_toJSBoolean_0(v93) then
        l_toJSBoolean_0 = math.min(40, v89);
        v93 = math.min(math.floor(v87 / v88 * l_toJSBoolean_0), l_toJSBoolean_0);
        if l_toJSBoolean_0 >= 2 then
            v91 = v91 .. "\n" .. v8.green("\226\150\136"):rep(v93) .. tostring(v8.white("\226\150\136"):rep(l_toJSBoolean_0 - v93));
        end;
    end;
    return v91;
end;
v6.wrapAnsiString = function(v94, _) --[[ Line: 308 ]] --[[ Name: wrapAnsiString ]]
    return v94;
end;
return v6;