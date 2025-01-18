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
local v12 = require(l_Parent_1.JestUtil);
local l_clearLine_0 = v12.clearLine;
local l_default_0 = require(l_Parent_0.BaseReporter).default;
local l_default_1 = require(l_Parent_0.Status).default;
local l_default_2 = require(l_Parent_0.getResultHeader).default;
local l_default_3 = require(l_Parent_0.getSnapshotStatus).default;
local _ = require(l_Parent_0.types);
local l_Writeable_0 = require(l_Parent_1.RobloxShared).Writeable;
local v20 = v8.bold("\226\151\143 ");
local v21 = setmetatable({}, {
    __index = l_default_0
});
v21.__index = v21;
v21.filename = "DefaultReporter";
v21.new = function(v22, v23) --[[ Line: 115 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v21 (copy), v12 (copy), l_Writeable_0 (copy), l_default_1 (copy), l_Set_0 (copy)
    local v24 = setmetatable(l_default_0.new(v23), v21);
    v24._isInteractive = v12.isInteractive;
    if v23 ~= nil and v23.env.IS_INTERACTIVE ~= nil then
        v24._isInteractive = v23.env.IS_INTERACTIVE;
    end;
    local _ = function() --[[ Line: 128 ]] --[[ Name: defaultWrite ]]
        -- upvalues: l_Writeable_0 (ref)
        local v25 = l_Writeable_0.new();
        return function(_, v27) --[[ Line: 131 ]]
            -- upvalues: v25 (copy)
            v25:write(v27);
        end;
    end;
    local v29;
    if v23 and v23.stdout then
        v29 = v23.stdout.write;
    else
        local v30 = l_Writeable_0.new();
        local l_v30_0 = v30 --[[ copy: 5 -> 7 ]];
        v29 = function(_, v33) --[[ Line: 131 ]]
            -- upvalues: l_v30_0 (copy)
            l_v30_0:write(v33);
        end;
    end;
    local v34;
    if v23 and v23.stderr then
        v34 = v23.stderr.write;
    else
        local v35 = l_Writeable_0.new();
        v34 = function(_, v37) --[[ Line: 131 ]]
            -- upvalues: v35 (copy)
            v35:write(v37);
        end;
    end;
    v24._globalConfig = v22;
    v24._clear = "";
    v24._out = function(_, v39) --[[ Line: 151 ]]
        -- upvalues: v29 (copy), v24 (copy)
        v29(v24._process.stdout, v39);
    end;
    v24._err = function(_, v41) --[[ Line: 154 ]]
        -- upvalues: v34 (copy), v24 (copy)
        v34(v24._process.stderr, v41);
    end;
    v24._status = l_default_1.new();
    v24._bufferedOutput = l_Set_0.new();
    v24:__wrapStdio(v24._process.stdout);
    v24:__wrapStdio(v24._process.stderr);
    v24._status:onChange(function() --[[ Line: 161 ]]
        -- upvalues: v24 (copy)
        v24:__clearStatus();
        v24:__printStatus();
    end);
    return v24;
end;
v21.__wrapStdio = function(v42, v43) --[[ Line: 169 ]] --[[ Name: __wrapStdio ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_setTimeout_0 (copy)
    local l_write_0 = v43.write;
    local v45 = {};
    local v46 = nil;
    local function v47() --[[ Line: 175 ]] --[[ Name: flushBufferedOutput ]]
        -- upvalues: l_Array_0 (ref), v45 (ref), v42 (copy), l_Boolean_0 (ref), l_write_0 (copy), v43 (copy), v47 (copy)
        local v48 = l_Array_0.join(v45, "");
        v45 = {};
        v42:__clearStatus();
        if l_Boolean_0.toJSBoolean(v48) then
            l_write_0(v43, v48);
        end;
        v42:__printStatus();
        v42._bufferedOutput:delete(v47);
    end;
    v42._bufferedOutput:add(v47);
    local function v49() --[[ Line: 190 ]] --[[ Name: debouncedFlush ]]
        -- upvalues: v43 (copy), v42 (copy), v47 (copy), l_Boolean_0 (ref), v46 (ref), l_setTimeout_0 (ref)
        if v43 == v42._process.stderr then
            v47();
            return;
        else
            if not l_Boolean_0.toJSBoolean(v46) then
                v46 = l_setTimeout_0(function() --[[ Line: 197 ]]
                    -- upvalues: v47 (ref), v46 (ref)
                    v47();
                    v46 = nil;
                end, 100);
            end;
            return;
        end;
    end;
    v43.write = function(_, v51) --[[ Line: 204 ]]
        -- upvalues: v45 (ref), v49 (copy)
        table.insert(v45, v51);
        v49();
        return true;
    end;
end;
v21.forceFlushBufferedOutput = function(v52) --[[ Line: 211 ]] --[[ Name: forceFlushBufferedOutput ]]
    -- upvalues: l_Set_0 (copy)
    l_Set_0.forEach(v52._bufferedOutput, function(v53) --[[ Line: 212 ]]
        v53();
    end);
end;
v21.__clearStatus = function(v54) --[[ Line: 217 ]] --[[ Name: __clearStatus ]]
    if v54._isInteractive then
        if v54._globalConfig.useStderr then
            v54:_err(v54._clear);
            return;
        else
            v54:_out(v54._clear);
        end;
    end;
end;
v21.__printStatus = function(v55) --[[ Line: 228 ]] --[[ Name: __printStatus ]]
    local v56 = v55._status:get();
    local l_content_0 = v56.content;
    v55._clear = v56.clear;
    if v55._isInteractive then
        if v55._globalConfig.useStderr then
            v55:_err(l_content_0);
            return;
        else
            v55:_out(l_content_0);
        end;
    end;
end;
v21.onRunStart = function(v58, v59, v60) --[[ Line: 242 ]] --[[ Name: onRunStart ]]
    v58._status:runStarted(v59, v60);
end;
v21.onTestStart = function(v61, v62) --[[ Line: 246 ]] --[[ Name: onTestStart ]]
    v61._status:testStarted(v62.path, v62.context.config);
end;
v21.onTestCaseResult = function(v63, v64, v65) --[[ Line: 250 ]] --[[ Name: onTestCaseResult ]]
    v63._status:addTestCaseResult(v64, v65);
end;
v21.onRunComplete = function(v66) --[[ Line: 254 ]] --[[ Name: onRunComplete ]]
    -- upvalues: l_clearLine_0 (copy)
    v66:forceFlushBufferedOutput();
    v66._status:runFinished();
    v66._process.stdout.write = v66._out;
    v66._process.stderr.write = v66._err;
    l_clearLine_0(v66._process.stderr);
end;
v21.onTestResult = function(v67, v68, v69, v70) --[[ Line: 262 ]] --[[ Name: onTestResult ]]
    v67:testFinished(v68.context.config, v69, v70);
    if not v69.skipped then
        v67:printTestFileHeader(v69.testFilePath, v68.context.config, v69);
        v67:printTestFileFailureMessage(v69.testFilePath, v68.context.config, v69);
    end;
    v67:forceFlushBufferedOutput();
end;
v21.testFinished = function(v71, v72, v73, v74) --[[ Line: 271 ]] --[[ Name: testFinished ]]
    v71._status:testFinished(v72, v73, v74);
end;
v21.printTestFileHeader = function(v75, _, v77, v78) --[[ Line: 279 ]] --[[ Name: printTestFileHeader ]]
    -- upvalues: l_default_2 (copy), v20 (copy), l_getConsoleOutput_0 (copy)
    v75:log(l_default_2(v78, v75._globalConfig, v77));
    if v78.console ~= nil then
        v75:log("  " .. v20 .. "Console\n\n" .. l_getConsoleOutput_0(v78.console, v77, v75._globalConfig));
    end;
end;
v21.printTestFileFailureMessage = function(v79, _, _, v82) --[[ Line: 290 ]] --[[ Name: printTestFileFailureMessage ]]
    -- upvalues: l_Boolean_0 (copy), l_default_3 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(v82.failureMessage) then
        v79:log(v82.failureMessage);
    end;
    local v83 = v79._globalConfig.updateSnapshot == "all";
    local v84 = l_default_3(v82.snapshot, v83);
    l_Array_0.forEach(v84, v79.log, v79);
end;
v7.default = v21;
return v7;