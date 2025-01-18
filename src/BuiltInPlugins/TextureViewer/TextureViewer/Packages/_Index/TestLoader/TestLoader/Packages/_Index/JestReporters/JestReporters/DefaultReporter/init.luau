local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local l_setTimeout_0 = v2.setTimeout;
local v7 = {};
local v8 = require(l_Parent_1.ChalkLua);
local l_getConsoleOutput_0 = require(l_Parent_1.JestConsole).getConsoleOutput;
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local v12 = require(l_Parent_1.JestMessageUtil);
local l_formatStackTrace_0 = v12.formatStackTrace;
local l_indentAllLines_0 = v12.indentAllLines;
local l_separateMessageFromStack_0 = v12.separateMessageFromStack;
local v16 = require(l_Parent_1.JestUtil);
local l_clearLine_0 = v16.clearLine;
local l_default_0 = require(l_Parent_0.BaseReporter).default;
local l_default_1 = require(l_Parent_0.Status).default;
local l_default_2 = require(l_Parent_0.getResultHeader).default;
local l_default_3 = require(l_Parent_0.getSnapshotStatus).default;
local _ = require(l_Parent_0.types);
local l_Writeable_0 = require(l_Parent_1.RobloxShared).Writeable;
local v24 = v8.bold("\226\151\143 ");
local v25 = setmetatable({}, {
    __index = l_default_0
});
v25.__index = v25;
v25.filename = "DefaultReporter";
v25.new = function(v26, v27) --[[ Line: 120 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v25 (copy), v16 (copy), l_Boolean_0 (copy), l_Writeable_0 (copy), l_default_1 (copy), l_Set_0 (copy)
    local v28 = setmetatable(l_default_0.new(v27), v25);
    v28._isInteractive = v16.isInteractive;
    if v27 ~= nil and v27.env.IS_INTERACTIVE ~= nil then
        v28._isInteractive = l_Boolean_0.toJSBoolean(v27.env.IS_INTERACTIVE);
    end;
    local _ = function() --[[ Line: 133 ]] --[[ Name: defaultWrite ]]
        -- upvalues: l_Writeable_0 (ref)
        local v29 = l_Writeable_0.new();
        return function(_, v31) --[[ Line: 136 ]]
            -- upvalues: v29 (copy)
            v29:write(v31);
        end;
    end;
    local v33;
    if v27 and v27.stdout then
        v33 = v27.stdout.write;
    else
        local v34 = l_Writeable_0.new();
        local l_v34_0 = v34 --[[ copy: 5 -> 7 ]];
        v33 = function(_, v37) --[[ Line: 136 ]]
            -- upvalues: l_v34_0 (copy)
            l_v34_0:write(v37);
        end;
    end;
    local v38;
    if v27 and v27.stderr then
        v38 = v27.stderr.write;
    else
        local v39 = l_Writeable_0.new();
        v38 = function(_, v41) --[[ Line: 136 ]]
            -- upvalues: v39 (copy)
            v39:write(v41);
        end;
    end;
    v28._globalConfig = v26;
    v28._clear = "";
    v28._out = function(_, v43) --[[ Line: 156 ]]
        -- upvalues: v33 (copy), v28 (copy)
        v33(v28._process.stdout, v43);
    end;
    v28._err = function(_, v45) --[[ Line: 159 ]]
        -- upvalues: v38 (copy), v28 (copy)
        v38(v28._process.stderr, v45);
    end;
    v28._status = l_default_1.new();
    v28._bufferedOutput = l_Set_0.new();
    v28:__wrapStdio(v28._process.stdout);
    v28:__wrapStdio(v28._process.stderr);
    v28._status:onChange(function() --[[ Line: 166 ]]
        -- upvalues: v28 (copy)
        v28:__clearStatus();
        v28:__printStatus();
    end);
    return v28;
end;
v25.__wrapStdio = function(v46, v47) --[[ Line: 174 ]] --[[ Name: __wrapStdio ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_setTimeout_0 (copy)
    local l_write_0 = v47.write;
    local v49 = {};
    local v50 = nil;
    local function v51() --[[ Line: 180 ]] --[[ Name: flushBufferedOutput ]]
        -- upvalues: l_Array_0 (ref), v49 (ref), v46 (copy), l_Boolean_0 (ref), l_write_0 (copy), v47 (copy), v51 (copy)
        local v52 = l_Array_0.join(v49, "");
        v49 = {};
        v46:__clearStatus();
        if l_Boolean_0.toJSBoolean(v52) then
            l_write_0(v47, v52);
        end;
        v46:__printStatus();
        v46._bufferedOutput:delete(v51);
    end;
    v46._bufferedOutput:add(v51);
    local function v53() --[[ Line: 195 ]] --[[ Name: debouncedFlush ]]
        -- upvalues: v47 (copy), v46 (copy), v51 (copy), l_Boolean_0 (ref), v50 (ref), l_setTimeout_0 (ref)
        if v47 == v46._process.stderr then
            v51();
            return;
        else
            if not l_Boolean_0.toJSBoolean(v50) then
                v50 = l_setTimeout_0(function() --[[ Line: 202 ]]
                    -- upvalues: v51 (ref), v50 (ref)
                    v51();
                    v50 = nil;
                end, 100);
            end;
            return;
        end;
    end;
    v47.write = function(_, v55) --[[ Line: 209 ]]
        -- upvalues: v49 (ref), v53 (copy)
        table.insert(v49, v55);
        v53();
        return true;
    end;
end;
v25.forceFlushBufferedOutput = function(v56) --[[ Line: 216 ]] --[[ Name: forceFlushBufferedOutput ]]
    -- upvalues: l_Set_0 (copy)
    l_Set_0.forEach(v56._bufferedOutput, function(v57) --[[ Line: 217 ]]
        v57();
    end);
end;
v25.__clearStatus = function(v58) --[[ Line: 222 ]] --[[ Name: __clearStatus ]]
    if v58._isInteractive then
        if v58._globalConfig.useStderr then
            v58:_err(v58._clear);
            return;
        else
            v58:_out(v58._clear);
        end;
    end;
end;
v25.__printStatus = function(v59) --[[ Line: 233 ]] --[[ Name: __printStatus ]]
    local v60 = v59._status:get();
    local l_content_0 = v60.content;
    v59._clear = v60.clear;
    if v59._isInteractive then
        if v59._globalConfig.useStderr then
            v59:_err(l_content_0);
            return;
        else
            v59:_out(l_content_0);
        end;
    end;
end;
v25.onRunStart = function(v62, v63, v64) --[[ Line: 247 ]] --[[ Name: onRunStart ]]
    v62._status:runStarted(v63, v64);
end;
v25.onTestStart = function(v65, v66) --[[ Line: 251 ]] --[[ Name: onTestStart ]]
    v65._status:testStarted(v66.path, v66.context.config);
end;
v25.onTestCaseResult = function(v67, v68, v69) --[[ Line: 255 ]] --[[ Name: onTestCaseResult ]]
    v67._status:addTestCaseResult(v68, v69);
end;
v25.onRunComplete = function(v70) --[[ Line: 259 ]] --[[ Name: onRunComplete ]]
    -- upvalues: l_clearLine_0 (copy)
    v70:forceFlushBufferedOutput();
    v70._status:runFinished();
    v70._process.stdout.write = v70._out;
    v70._process.stderr.write = v70._err;
    l_clearLine_0(v70._process.stderr);
end;
v25.onTestResult = function(v71, v72, v73, v74) --[[ Line: 267 ]] --[[ Name: onTestResult ]]
    v71:testFinished(v72.context.config, v73, v74);
    if not v73.skipped then
        v71:printTestFileHeader(v73.testFilePath, v72.context.config, v73);
        v71:printTestFileFailureMessage(v73.testFilePath, v72.context.config, v73);
    end;
    v71:forceFlushBufferedOutput();
end;
v25.testFinished = function(v75, v76, v77, v78) --[[ Line: 276 ]] --[[ Name: testFinished ]]
    v75._status:testFinished(v76, v77, v78);
end;
v25.printTestFileHeader = function(v79, v80, v81, v82) --[[ Line: 284 ]] --[[ Name: printTestFileHeader ]]
    -- upvalues: l_Array_0 (copy), v8 (copy), l_separateMessageFromStack_0 (copy), l_Boolean_0 (copy), l_formatStackTrace_0 (copy), l_indentAllLines_0 (copy), l_default_2 (copy), v24 (copy), l_getConsoleOutput_0 (copy)
    l_Array_0.forEach(v82.testResults, function(v83) --[[ Line: 290 ]]
        -- upvalues: v79 (copy), v8 (ref), l_Array_0 (ref), l_separateMessageFromStack_0 (ref), l_Boolean_0 (ref), l_formatStackTrace_0 (ref), v81 (copy), v80 (copy), l_indentAllLines_0 (ref)
        local l_retryReasons_0 = v83.retryReasons;
        if l_retryReasons_0 and #l_retryReasons_0 > 0 then
            v79:log(("%s %s"):format(tostring(v8.reset.inverse.bold:yellow(" LOGGING RETRY ERRORS ")), v8.bold(v83.fullName)));
            l_Array_0.forEach(l_retryReasons_0, function(v85, v86) --[[ Line: 299 ]]
                -- upvalues: l_separateMessageFromStack_0 (ref), l_Boolean_0 (ref), v79 (ref), v8 (ref), l_formatStackTrace_0 (ref), v81 (ref), v80 (ref), l_indentAllLines_0 (ref)
                local v87 = nil;
                local v88 = nil;
                local v89 = l_separateMessageFromStack_0(v85);
                v87 = v89.message;
                v88 = v89.stack;
                v88 = l_Boolean_0.toJSBoolean(v79._globalConfig.noStackTrace) and "" or v8.dim(l_formatStackTrace_0(v88, v81, v79._globalConfig, v80));
                v87 = l_indentAllLines_0(v87);
                v79:log(("%s\n"):format((tostring(v8.reset.inverse.bold:blueBright((" RETRY %s "):format((tostring(v86 + 1))))))));
                v79:log(("%s\n%s\n"):format(tostring(v87), (tostring(v88))));
            end);
        end;
    end);
    v79:log(l_default_2(v82, v79._globalConfig, v81));
    if v82.console ~= nil then
        v79:log("  " .. v24 .. "Console\n\n" .. l_getConsoleOutput_0(v82.console, v81, v79._globalConfig));
    end;
end;
v25.printTestFileFailureMessage = function(v90, _, _, v93) --[[ Line: 324 ]] --[[ Name: printTestFileFailureMessage ]]
    -- upvalues: l_Boolean_0 (copy), l_default_3 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v93.failureMessage) then
        v90:log(v93.failureMessage);
    end;
    local v94 = v90._globalConfig.updateSnapshot == "all";
    local v95 = l_default_3(v93.snapshot, v94);
    l_Array_0.forEach(v95, v90.log, v90);
end;
v7.default = v25;
return v7;