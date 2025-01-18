local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local v7 = {};
local v8 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_default_0 = require(l_Parent_0.BaseReporter).default;
local l_default_1 = require(l_Parent_0.getResultHeader).default;
local l_default_2 = require(l_Parent_0.getSnapshotSummary).default;
local _ = require(l_Parent_0.types);
local l_getSummary_0 = require(l_Parent_0.utils).getSummary;
local v16 = l_Set_0.new({
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
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = setmetatable({}, {
    __index = l_default_0
});
v20.__index = v20;
v20.filename = "SummaryReporter";
v20.new = function(v21, v22) --[[ Line: 87 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v20 (copy), v19 (ref), v18 (ref), v17 (ref)
    local v23 = setmetatable(l_default_0.new(v22), v20);
    if v22 then
        v19 = v22.env.npm_lifecycle_script;
        v18 = v22.env.npm_lifecycle_event;
        v17 = v22.env.npm_config_user_agent;
    end;
    v23._globalConfig = v21;
    v23._estimatedTime = 0;
    return v23;
end;
v20._write = function(v24, v25) --[[ Line: 108 ]] --[[ Name: _write ]]
    -- upvalues: l_String_0 (copy)
    local v26 = 1;
    local v27 = utf8.len(v25);
    assert(v27 ~= nil);
    while v26 < v27 do
        v24._process.stderr:write(l_String_0.charCodeAt(v25, v26));
        v26 = v26 + 1;
    end;
end;
v20.onRunStart = function(v28, v29, v30) --[[ Line: 118 ]] --[[ Name: onRunStart ]]
    -- upvalues: l_default_0 (copy)
    l_default_0.onRunStart(v28, v29, v30);
    v28._estimatedTime = v30.estimatedTime;
end;
v20.onRunComplete = function(v31, v32, v33) --[[ Line: 123 ]] --[[ Name: onRunComplete ]]
    -- upvalues: l_Boolean_0 (copy), l_getSummary_0 (copy), v8 (copy)
    local l_numTotalTestSuites_0 = v33.numTotalTestSuites;
    local l_testResults_0 = v33.testResults;
    local l_wasInterrupted_0 = v33.wasInterrupted;
    if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
        local v37 = l_testResults_0[#l_testResults_0];
        if l_Boolean_0.toJSBoolean(v31._globalConfig.verbose) and l_Boolean_0.toJSBoolean(v37) and not l_Boolean_0.toJSBoolean(v37.numFailingTests) and not l_Boolean_0.toJSBoolean(v37.testExecError) then
            v31:log("");
        end;
        v31:_printSummary(v33, v31._globalConfig);
        v31:_printSnapshotSummary(v33.snapshot, v31._globalConfig);
        if l_Boolean_0.toJSBoolean(l_numTotalTestSuites_0) then
            local v38 = l_getSummary_0(v33, {
                estimatedTime = v31._estimatedTime
            });
            if not l_Boolean_0.toJSBoolean(v31._globalConfig.silent) then
                v38 = v38 .. "\n" .. if l_Boolean_0.toJSBoolean(l_wasInterrupted_0) then v8.bold(v8.red("Test run was interrupted.")) else v31:_getTestSummary(v32, v31._globalConfig);
            end;
            v31:log(v38);
        end;
    end;
end;
v20._printSnapshotSummary = function(v39, v40, v41) --[[ Line: 152 ]] --[[ Name: _printSnapshotSummary ]]
    -- upvalues: l_Boolean_0 (copy), v18 (ref), v16 (copy), v17 (ref), v19 (ref), l_default_2 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v40.added) or l_Boolean_0.toJSBoolean(v40.filesRemoved) or l_Boolean_0.toJSBoolean(v40.unchecked) or l_Boolean_0.toJSBoolean(v40.unmatched) or l_Boolean_0.toJSBoolean(v40.updated) then
        local v42 = nil;
        local v43 = l_Boolean_0.toJSBoolean(v18) and v18 or "";
        local v44 = l_Boolean_0.toJSBoolean(v16:has(v43)) and "" or "run ";
        local v45 = false;
        if typeof(v17) == "string" then
            v45 = string.match(v17 or "", "yarn") ~= nil;
        end;
        local v46 = l_Boolean_0.toJSBoolean(v45) and "yarn" or "npm";
        local v47 = false;
        if typeof(v19) == "string" then
            v47 = l_Boolean_0.toJSBoolean(string.match(v19 or "", "jest"));
        end;
        v42 = (not not v41.watch or v41.watchAll) and "press `u`" or if l_Boolean_0.toJSBoolean(v43) and v47 then ("run `%s -u`"):format(v46 .. " " .. v44 .. v43 .. (v45 and "" or " --")) else "re-run jest with `-u`";
        local v48 = l_default_2(v40, v41, v42);
        l_Array_0.forEach(v48, function(v49) --[[ Line: 176 ]]
            -- upvalues: v39 (copy)
            v39:log(v49);
        end);
        v39:log("");
    end;
end;
v20._printSummary = function(v50, v51, v52) --[[ Line: 183 ]] --[[ Name: _printSummary ]]
    -- upvalues: v8 (copy), l_Array_0 (copy), l_Boolean_0 (copy), l_default_1 (copy)
    if (v51.numFailedTests or 0) + (v51.numRuntimeErrorTestSuites or 0) > 0 and v51.numTotalTestSuites > 20 then
        v50:log(v8.bold("Summary of all failing tests"));
        l_Array_0.forEach(v51.testResults, function(v53) --[[ Line: 190 ]]
            -- upvalues: l_Boolean_0 (ref), v50 (copy), l_default_1 (ref), v52 (copy)
            local l_failureMessage_0 = v53.failureMessage;
            if l_Boolean_0.toJSBoolean(l_failureMessage_0) then
                v50:_write(l_default_1(v53, v52) .. "\n" .. l_failureMessage_0 .. "\n");
            end;
        end);
        v50:log("");
    end;
end;
v20._getTestSummary = function(_, v56, v57) --[[ Line: 200 ]] --[[ Name: _getTestSummary ]]
    -- upvalues: l_Boolean_0 (copy), v8 (copy), l_Array_0 (copy)
    local function _() --[[ Line: 201 ]] --[[ Name: getMatchingTestsInfo ]]
        -- upvalues: l_Boolean_0 (ref), v57 (copy), v8 (ref)
        local v58 = l_Boolean_0.toJSBoolean(v57.findRelatedTests) and " related to files matching " or " matching ";
        return v8.dim(v58);
    end;
    local v60 = "";
    if v57.runTestsByPath then
        v60 = v8.dim(" within paths");
    elseif l_Boolean_0.toJSBoolean(v57.onlyChanged) then
        v60 = v8.dim(" related to changed files");
    elseif l_Boolean_0.toJSBoolean(v57.testPathPattern) then
        local v61 = l_Boolean_0.toJSBoolean(v57.findRelatedTests) and " related to files matching " or " matching ";
        v60 = v8.dim(v61);
    end;
    local v62 = "";
    if v57.runTestsByPath then
        v62 = " " .. l_Array_0.join(l_Array_0.map(v57.nonFlagArgs, function(v63) --[[ Line: 220 ]]
            return ("\"%s\""):format(v63);
        end), ", ");
    elseif v57.testNamePattern ~= nil then
        v62 = v8.dim(" with tests matching ") .. ("\"%s\""):format(v57.testNamePattern);
    end;
    local v64 = if v56.size > 1 then v8.dim(" in ") .. tostring(v56.size) .. v8.dim(" projects") else "";
    return v8.dim("Ran all test suites") .. v60 .. v62 .. v64 .. v8.dim(".");
end;
v7.default = v20;
return v7;