local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local l_setTimeout_0 = v2.setTimeout;
local l_setInterval_0 = v2.setInterval;
local l_clearInterval_0 = v2.clearInterval;
local v9 = {};
local v10 = require(l_Parent_1.ChalkLua);
local l_len_0 = utf8.len;
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local _ = require(l_Parent_0.types);
local v15 = require(l_Parent_0.utils);
local l_getSummary_0 = v15.getSummary;
local l_printDisplayName_0 = v15.printDisplayName;
local l_trimAndFormatPath_0 = v15.trimAndFormatPath;
local l_wrapAnsiString_0 = v15.wrapAnsiString;
local v20 = v10.reset(v10.inverse(v10.yellow(v10.bold(" RUNS ")))) .. " ";
local v21 = {};
v21.__index = v21;
v21.new = function() --[[ Line: 70 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy)
    local v22 = setmetatable({}, v21);
    v22._array = {};
    return v22;
end;
v21.add = function(v23, v24, v25) --[[ Line: 76 ]] --[[ Name: add ]]
    -- upvalues: l_Array_0 (copy)
    local v26 = l_Array_0.indexOf(v23._array, nil);
    local v27 = {
        config = v25, 
        testPath = v24
    };
    if v26 ~= -1 then
        v23._array[v26] = v27;
        return;
    else
        table.insert(v23._array, v27);
        return;
    end;
end;
v21.delete = function(v28, v29) --[[ Line: 86 ]] --[[ Name: delete ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    local v32 = l_Array_0.find(v28._array, function(v30) --[[ Line: 87 ]]
        -- upvalues: v29 (copy)
        local v31 = false;
        if v30 ~= nil then
            v31 = v30.testPath == v29;
        end;
        return v31;
    end);
    v28._array[l_Array_0.indexOf(v28._array, l_Boolean_0.toJSBoolean(v32) and v32 or nil)] = nil;
end;
v21.get = function(v33) --[[ Line: 93 ]] --[[ Name: get ]]
    return v33._array;
end;
local v34 = {};
v34.__index = v34;
v34.new = function() --[[ Line: 128 ]] --[[ Name: new ]]
    -- upvalues: v34 (copy), v21 (copy)
    local v35 = setmetatable({}, v34);
    v35._cache = nil;
    v35._currentTests = v21.new();
    v35._currentTestCases = {};
    v35._done = false;
    v35._emitScheduled = false;
    v35._estimatedTime = 0;
    v35._showStatus = false;
    return v35;
end;
v34.onChange = function(v36, v37) --[[ Line: 140 ]] --[[ Name: onChange ]]
    v36._callback = v37;
end;
v34.runStarted = function(v38, v39, v40) --[[ Line: 144 ]] --[[ Name: runStarted ]]
    -- upvalues: l_Boolean_0 (copy), l_setInterval_0 (copy)
    v38._estimatedTime = if l_Boolean_0.toJSBoolean(v40) and l_Boolean_0.toJSBoolean(v40.estimatedTime) then v40.estimatedTime else 0;
    v38._showStatus = if l_Boolean_0.toJSBoolean(v40) then v40.showStatus else v40;
    v38._interval = l_setInterval_0(function() --[[ Line: 149 ]]
        -- upvalues: v38 (copy)
        return v38:_tick();
    end, 1000);
    v38._aggregatedResults = v39;
    v38:_debouncedEmit();
end;
v34.runFinished = function(v41) --[[ Line: 156 ]] --[[ Name: runFinished ]]
    -- upvalues: l_Boolean_0 (copy), l_clearInterval_0 (copy)
    v41._done = true;
    if l_Boolean_0.toJSBoolean(v41._interval) then
        l_clearInterval_0(v41._interval);
    end;
    v41:_emit();
end;
v34.addTestCaseResult = function(v42, v43, v44) --[[ Line: 164 ]] --[[ Name: addTestCaseResult ]]
    -- upvalues: l_Boolean_0 (copy)
    table.insert(v42._currentTestCases, {
        test = v43, 
        testCaseResult = v44
    });
    if not l_Boolean_0.toJSBoolean(v42._showStatus) then
        v42:_emit();
        return;
    else
        v42:_debouncedEmit();
        return;
    end;
end;
v34.testStarted = function(v45, v46, v47) --[[ Line: 173 ]] --[[ Name: testStarted ]]
    v45._currentTests:add(v46, v47);
    if not v45._showStatus then
        v45:_emit();
        return;
    else
        v45:_debouncedEmit();
        return;
    end;
end;
v34.testFinished = function(v48, v49, v50, v51) --[[ Line: 182 ]] --[[ Name: testFinished ]]
    -- upvalues: l_Array_0 (copy)
    local l_testFilePath_0 = v50.testFilePath;
    v48._aggregatedResults = v51;
    v48._currentTests:delete(l_testFilePath_0);
    v48._currentTestCases = l_Array_0.filter(v48._currentTestCases, function(v53) --[[ Line: 190 ]]
        -- upvalues: v49 (copy), l_testFilePath_0 (copy)
        local l_test_0 = v53.test;
        if v49 ~= l_test_0.context.config then
            return true;
        else
            return l_test_0.path ~= l_testFilePath_0;
        end;
    end);
    v48:_debouncedEmit();
end;
v34.get = function(v55) --[[ Line: 200 ]] --[[ Name: get ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_printDisplayName_0 (copy), v20 (copy), l_len_0 (copy), l_wrapAnsiString_0 (copy), l_trimAndFormatPath_0 (copy), l_getSummary_0 (copy), l_String_0 (copy)
    if l_Boolean_0.toJSBoolean(v55._cache) then
        return v55._cache;
    elseif l_Boolean_0.toJSBoolean(v55._done) then
        return {
            clear = "", 
            content = ""
        };
    else
        local v56 = "\n";
        l_Array_0.forEach(v55._currentTests:get(), function(v57) --[[ Line: 209 ]]
            -- upvalues: l_Boolean_0 (ref), l_printDisplayName_0 (ref), v20 (ref), l_len_0 (ref), v56 (ref), l_wrapAnsiString_0 (ref), l_trimAndFormatPath_0 (ref)
            if l_Boolean_0.toJSBoolean(v57) then
                local l_config_0 = v57.config;
                local l_testPath_0 = v57.testPath;
                local v60 = if l_Boolean_0.toJSBoolean(l_config_0.displayName) then tostring(l_printDisplayName_0(l_config_0)) .. " " else "";
                local v61 = v20 .. v60;
                local v62 = l_len_0(v61);
                assert(v62 ~= nil);
                v56 = v56 .. l_wrapAnsiString_0(v61 .. l_trimAndFormatPath_0(v62, l_config_0, l_testPath_0, 0), 0) .. "\n";
            end;
        end);
        if v55._showStatus and l_Boolean_0.toJSBoolean(v55._aggregatedResults) then
            v56 = v56 .. "\n" .. tostring(l_getSummary_0(v55._aggregatedResults, {
                currentTestCases = v55._currentTestCases, 
                estimatedTime = v55._estimatedTime, 
                roundTime = true, 
                width = 0
            }));
        end;
        local v63 = 0;
        local v64 = 0;
        local v65 = utf8.len(v56);
        assert(v65 ~= nil);
        while v64 < v65 do
            if l_String_0.charCodeAt(v56, v64) == "\n" then
                v63 = v63 + 1;
            end;
            v64 = v64 + 1;
        end;
        v55._cache = {
            clear = ("\n"):rep(v63), 
            content = v56
        };
        return v55._cache;
    end;
end;
v34._emit = function(v66) --[[ Line: 249 ]] --[[ Name: _emit ]]
    -- upvalues: l_Boolean_0 (copy)
    v66._cache = nil;
    if l_Boolean_0.toJSBoolean(v66._callback) then
        v66:_callback();
    end;
end;
v34._debouncedEmit = function(v67) --[[ Line: 256 ]] --[[ Name: _debouncedEmit ]]
    -- upvalues: l_Boolean_0 (copy), l_setTimeout_0 (copy)
    if not l_Boolean_0.toJSBoolean(v67._emitScheduled) then
        v67._emitScheduled = true;
        l_setTimeout_0(function() --[[ Line: 261 ]]
            -- upvalues: v67 (copy)
            v67:_emit();
            v67._emitScheduled = false;
        end, 100);
    end;
end;
v34._tick = function(v68) --[[ Line: 268 ]] --[[ Name: _tick ]]
    v68:_debouncedEmit();
end;
v9.default = v34;
return v9;