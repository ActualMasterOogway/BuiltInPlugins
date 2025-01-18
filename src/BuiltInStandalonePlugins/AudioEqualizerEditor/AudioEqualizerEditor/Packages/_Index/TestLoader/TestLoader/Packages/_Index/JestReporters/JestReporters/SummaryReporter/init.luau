local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local v6 = {};
local v7 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_default_0 = require(l_Parent_0.BaseReporter).default;
local l_default_1 = require(l_Parent_0.getResultHeader).default;
local l_default_2 = require(l_Parent_0.getSnapshotSummary).default;
local _ = require(l_Parent_0.types);
local l_getSummary_0 = require(l_Parent_0.utils).getSummary;
local v15 = l_Set_0.new({
    "prepublish", 
    "publish", 
    "postpublish", 
    "preinstall", 
    "install", 
    "postinstall", 
    "preuninstall", 
    "uninstall", 
    "postuninstall", 
    "preversion", 
    "version", 
    "postversion", 
    "pretest", 
    "test", 
    "posttest", 
    "prestop", 
    "stop", 
    "poststop", 
    "prestart", 
    "start", 
    "poststart", 
    "prerestart", 
    "restart", 
    "postrestart"
});
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = setmetatable({}, {
    __index = l_default_0
});
v19.__index = v19;
v19.filename = "SummaryReporter";
v19.new = function(v20, v21) --[[ Line: 86 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v19 (copy), v18 (ref), v17 (ref), v16 (ref)
    local v22 = setmetatable(l_default_0.new(v21), v19);
    if v21 then
        v18 = v21.env.npm_lifecycle_script;
        v17 = v21.env.npm_lifecycle_event;
        v16 = v21.env.npm_config_user_agent;
    end;
    v22._globalConfig = v20;
    v22._estimatedTime = 0;
    return v22;
end;
v19._write = function(v23, v24) --[[ Line: 107 ]] --[[ Name: _write ]]
    v23._process.stderr:write(v24);
end;
v19.onRunStart = function(v25, v26, v27) --[[ Line: 120 ]] --[[ Name: onRunStart ]]
    -- upvalues: l_default_0 (copy)
    l_default_0.onRunStart(v25, v26, v27);
    v25._estimatedTime = v27.estimatedTime;
end;
v19.onRunComplete = function(v28, v29, v30) --[[ Line: 125 ]] --[[ Name: onRunComplete ]]
    -- upvalues: l_Boolean_0 (copy), l_getSummary_0 (copy), v7 (copy)
    local l_numTotalTestSuites_0 = v30.numTotalTestSuites;
    local l_testResults_0 = v30.testResults;
    local l_wasInterrupted_0 = v30.wasInterrupted;
    if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
        local v34 = l_testResults_0[#l_testResults_0];
        if l_Boolean_0.toJSBoolean(v28._globalConfig.verbose) and l_Boolean_0.toJSBoolean(v34) and not l_Boolean_0.toJSBoolean(v34.numFailingTests) and not l_Boolean_0.toJSBoolean(v34.testExecError) then
            v28:log("");
        end;
        v28:_printSummary(v30, v28._globalConfig);
        v28:_printSnapshotSummary(v30.snapshot, v28._globalConfig);
        if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
            local v35 = l_getSummary_0(v30, {
                estimatedTime = v28._estimatedTime
            });
            if not l_Boolean_0.toJSBoolean(v28._globalConfig.silent) then
                v35 = v35 .. "\n" .. if l_Boolean_0.toJSBoolean(l_wasInterrupted_0) then v7.bold(v7.red("Test run was interrupted.")) else v28:_getTestSummary(v29, v28._globalConfig);
            end;
            v28:log(v35);
        end;
    end;
end;
v19._printSnapshotSummary = function(v36, v37, v38) --[[ Line: 154 ]] --[[ Name: _printSnapshotSummary ]]
    -- upvalues: l_Boolean_0 (copy), v17 (ref), v15 (copy), v16 (ref), v18 (ref), l_default_2 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v37.added) or l_Boolean_0.toJSBoolean(v37.filesRemoved) or l_Boolean_0.toJSBoolean(v37.unchecked) or l_Boolean_0.toJSBoolean(v37.unmatched) or l_Boolean_0.toJSBoolean(v37.updated) then
        local v39 = nil;
        local v40 = l_Boolean_0.toJSBoolean(v17) and v17 or "";
        local v41 = l_Boolean_0.toJSBoolean(v15:has(v40)) and "" or "run ";
        local v42 = false;
        if typeof(v16) == "string" then
            v42 = string.match(v16 or "", "yarn") ~= nil;
        end;
        local v43 = l_Boolean_0.toJSBoolean(v42) and "yarn" or "npm";
        local v44 = false;
        if typeof(v18) == "string" then
            v44 = l_Boolean_0.toJSBoolean(string.match(v18 or "", "jest"));
        end;
        v39 = if l_Boolean_0.toJSBoolean(v40) and v44 then ("run `%s -u`"):format(v43 .. " " .. v41 .. v40 .. (v42 and "" or " --")) else "re-run jest with `-u`";
        local v45 = l_default_2(v37, v38, v39);
        l_Array_0.forEach(v45, function(v46) --[[ Line: 181 ]]
            -- upvalues: v36 (copy)
            v36:log(v46);
        end);
        v36:log("");
    end;
end;
v19._printSummary = function(v47, v48, v49) --[[ Line: 188 ]] --[[ Name: _printSummary ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), l_Boolean_0 (copy), l_default_1 (copy)
    if (v48.numFailedTests or 0) + (v48.numRuntimeErrorTestSuites or 0) > 0 and v48.numTotalTestSuites > 20 then
        v47:log(v7.bold("Summary of all failing tests"));
        l_Array_0.forEach(v48.testResults, function(v50) --[[ Line: 195 ]]
            -- upvalues: l_Boolean_0 (ref), v47 (copy), l_default_1 (ref), v49 (copy)
            local l_failureMessage_0 = v50.failureMessage;
            if l_Boolean_0.toJSBoolean(l_failureMessage_0) then
                v47:_write(l_default_1(v50, v49) .. "\n" .. l_failureMessage_0 .. "\n");
            end;
        end);
        v47:log("");
    end;
end;
v19._getTestSummary = function(_, v53, v54) --[[ Line: 205 ]] --[[ Name: _getTestSummary ]]
    -- upvalues: v7 (copy), l_Boolean_0 (copy), l_Array_0 (copy)
    local function _() --[[ Line: 206 ]] --[[ Name: getMatchingTestsInfo ]]
        -- upvalues: v7 (ref)
        return v7.dim(" matching");
    end;
    local v56 = "";
    if v54.runTestsByPath then
        v56 = v7.dim(" within paths");
    elseif l_Boolean_0.toJSBoolean(v54.testPathPattern) then
        v56 = v7.dim(" matching");
    end;
    local v57 = "";
    if v54.runTestsByPath then
        v57 = " " .. l_Array_0.join(l_Array_0.map(v54.nonFlagArgs, function(v58) --[[ Line: 230 ]]
            return ("\"%s\""):format(v58);
        end), ", ");
    elseif v54.testNamePattern ~= nil then
        v57 = v7.dim(" with tests matching ") .. ("\"%s\""):format(v54.testNamePattern);
    end;
    local v59 = if v53.size > 1 then v7.dim(" in ") .. tostring(v53.size) .. v7.dim(" projects") else "";
    return v7.dim("Ran all test suites") .. v56 .. v57 .. v59 .. v7.dim(".");
end;
v6.default = v19;
return v6;