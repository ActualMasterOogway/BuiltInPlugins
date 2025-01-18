local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local v5 = {};
local v6 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local v9 = require(l_Parent_1.JestUtil);
local l_formatTime_0 = v9.formatTime;
local l_ICONS_0 = v9.ICONS;
local l_default_0 = require(l_Parent_0.DefaultReporter).default;
local _ = require(l_Parent_0.types);
local _ = require(l_Parent_1.RobloxShared);
local v15 = setmetatable({}, {
    __index = l_default_0
});
v15.__index = v15;
v15.filename = "VerboseReporter";
local function _(v16) --[[ Line: 66 ]] --[[ Name: round ]]
    return math.floor(v16 * 1 + 0.5) / 1;
end;
v15.new = function(v18) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v15 (copy)
    local v19 = setmetatable(l_default_0.new(v18), v15);
    v19._globalConfig = v18;
    return v19;
end;
v15.__wrapStdio = function(v20, v21) --[[ Line: 80 ]] --[[ Name: __wrapStdio ]]
    local l_write_0 = v21.write;
    v21.write = function(_, v24) --[[ Line: 82 ]]
        -- upvalues: v20 (copy), l_write_0 (copy), v21 (copy)
        v20:__clearStatus();
        l_write_0(v21, v24);
        v20:__printStatus();
        return true;
    end;
end;
v15.filterTestResults = function(v25) --[[ Line: 90 ]] --[[ Name: filterTestResults ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.filter(v25, function(v26) --[[ Line: 91 ]]
        return v26.status ~= "pending";
    end);
end;
v15.groupTestsBySuites = function(v27) --[[ Line: 97 ]] --[[ Name: groupTestsBySuites ]]
    -- upvalues: l_Array_0 (copy)
    local v28 = {
        suites = {}, 
        tests = {}, 
        title = ""
    };
    l_Array_0.forEach(v27, function(v29) --[[ Line: 100 ]]
        -- upvalues: v28 (copy), l_Array_0 (ref)
        local l_v28_0 = v28;
        for _, v32 in ipairs(v29.ancestorTitles) do
            local v34 = l_Array_0.find(l_v28_0.suites, function(v33) --[[ Line: 106 ]]
                -- upvalues: v32 (copy)
                return v33.title == v32;
            end);
            if v34 == nil then
                v34 = {
                    suites = {}, 
                    tests = {}, 
                    title = v32
                };
                table.insert(l_v28_0.suites, v34);
            end;
            l_v28_0 = v34;
        end;
        table.insert(l_v28_0.tests, v29);
    end);
    return v28;
end;
v15.onTestResult = function(v35, v36, v37, v38) --[[ Line: 121 ]] --[[ Name: onTestResult ]]
    -- upvalues: l_default_0 (copy), l_Boolean_0 (copy)
    l_default_0.testFinished(v35, v36.context.config, v37, v38);
    if not l_Boolean_0.toJSBoolean(v37.skipped) then
        v35:printTestFileHeader(v37.testFilePath, v36.context.config, v37);
        if not l_Boolean_0.toJSBoolean(v37.testExecError) and not l_Boolean_0.toJSBoolean(v37.skipped) then
            v35:_logTestResults(v37.testResults);
        end;
        v35:printTestFileFailureMessage(v37.testFilePath, v36.context.config, v37);
    end;
    l_default_0.forceFlushBufferedOutput(v35);
end;
v15._logTestResults = function(v39, v40) --[[ Line: 137 ]] --[[ Name: _logTestResults ]]
    -- upvalues: v15 (copy)
    v39:_logSuite(v15.groupTestsBySuites(v40), 0);
    v39:_logLine();
end;
v15._logSuite = function(v41, v42, v43) --[[ Line: 142 ]] --[[ Name: _logSuite ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v42.title) then
        v41:_logLine(v42.title, v43);
    end;
    v41:_logTests(v42.tests, v43 + 1);
    l_Array_0.forEach(v42.suites, function(v44) --[[ Line: 147 ]]
        -- upvalues: v41 (copy), v43 (copy)
        v41:_logSuite(v44, v43 + 1);
    end);
end;
v15._getIcon = function(_, v46) --[[ Line: 152 ]] --[[ Name: _getIcon ]]
    -- upvalues: v6 (copy), l_ICONS_0 (copy)
    if v46 == "failed" then
        return v6.red(l_ICONS_0.failed);
    elseif v46 == "pending" then
        return v6.yellow(l_ICONS_0.pending);
    elseif v46 == "todo" then
        return v6.magenta(l_ICONS_0.todo);
    else
        return v6.green(l_ICONS_0.success);
    end;
end;
v15._logTest = function(v47, v48, v49) --[[ Line: 164 ]] --[[ Name: _logTest ]]
    -- upvalues: l_formatTime_0 (copy), v6 (copy)
    local v50 = v47:_getIcon(v48.status);
    local v51 = if v48.duration ~= nil then (" (%s)"):format((tostring(l_formatTime_0(math.floor(v48.duration * 1 + 0.5) / 1)))) else "";
    v47:_logLine(v50 .. " " .. v6.dim(v48.title .. v51), v49);
end;
v15._logTests = function(v52, v53, v54) --[[ Line: 170 ]] --[[ Name: _logTests ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v52._globalConfig.expand) then
        l_Array_0.forEach(v53, function(v55) --[[ Line: 172 ]]
            -- upvalues: v52 (copy), v54 (copy)
            return v52:_logTest(v55, v54);
        end);
        return;
    else
        local v58 = l_Array_0.reduce(v53, function(v56, v57) --[[ Line: 176 ]]
            -- upvalues: v52 (copy), v54 (copy)
            if v57.status == "pending" then
                table.insert(v56.pending, v57);
                return v56;
            elseif v57.status == "todo" then
                table.insert(v56.todo, v57);
                return v56;
            else
                v52:_logTest(v57, v54);
                return v56;
            end;
        end, {
            pending = {}, 
            todo = {}
        });
        if #v58.pending > 0 then
            l_Array_0.forEach(v58.pending, v52:_logTodoOrPendingTest(v54));
        end;
        if #v58.todo > 0 then
            l_Array_0.forEach(v58.todo, v52:_logTodoOrPendingTest(v54));
        end;
        return;
    end;
end;
v15._logTodoOrPendingTest = function(v59, v60) --[[ Line: 195 ]] --[[ Name: _logTodoOrPendingTest ]]
    -- upvalues: v6 (copy)
    return function(v61) --[[ Line: 196 ]]
        -- upvalues: v59 (copy), v6 (ref), v60 (copy)
        local v62 = v61.status == "pending" and "skipped" or v61.status;
        local v63 = v59:_getIcon(v61.status);
        local v64 = v6.dim(("%s %s"):format(v62, v61.title));
        v59:_logLine(("%s %s"):format(v63, v64), v60);
    end;
end;
v15._logLine = function(v65, v66, v67) --[[ Line: 204 ]] --[[ Name: _logLine ]]
    -- upvalues: l_Boolean_0 (copy)
    v65:log(("  "):rep(l_Boolean_0.toJSBoolean(v67) and v67 or 0) .. (v66 or ""));
end;
v5.default = v15;
return v5;