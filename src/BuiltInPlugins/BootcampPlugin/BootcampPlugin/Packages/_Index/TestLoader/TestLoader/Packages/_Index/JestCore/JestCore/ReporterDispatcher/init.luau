local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_instanceof_0 = v1.instanceof;
local v4 = require(l_Parent_0.Promise);
local v5 = {};
local _ = require(l_Parent_0.JestReporters);
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestRuntime);
local _ = require(script.Parent.types);
local v10 = {};
v10.__index = v10;
v10.new = function() --[[ Line: 91 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v11 = setmetatable({}, v10);
    v11._reporters = {};
    return v11;
end;
v10.register = function(v12, v13) --[[ Line: 97 ]] --[[ Name: register ]]
    table.insert(v12._reporters, v13);
end;
v10.unregister = function(v14, v15) --[[ Line: 101 ]] --[[ Name: unregister ]]
    -- upvalues: l_Array_0 (copy), l_instanceof_0 (copy)
    v14._reporters = l_Array_0.filter(v14._reporters, function(v16) --[[ Line: 102 ]]
        -- upvalues: l_instanceof_0 (ref), v15 (copy)
        return not l_instanceof_0(v16, v15);
    end);
end;
v10.onTestFileResult = function(v17, v18, v19, v20) --[[ Line: 107 ]] --[[ Name: onTestFileResult ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 112 ]]
        -- upvalues: v17 (copy), v4 (ref), v18 (copy), v19 (copy), v20 (copy)
        for _, v22 in v17._reporters do
            if v22.onTestFileResult ~= nil then
                v4.resolve(v22:onTestFileResult(v18, v19, v20)):expect();
            elseif v22.onTestResult ~= nil then
                v4.resolve(v22:onTestResult(v18, v19, v20)):expect();
            end;
        end;
        v19.coverage = nil;
        v19.console = nil;
    end);
end;
v10.onTestFileStart = function(v23, v24) --[[ Line: 127 ]] --[[ Name: onTestFileStart ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 128 ]]
        -- upvalues: v23 (copy), v4 (ref), v24 (copy)
        for _, v26 in v23._reporters do
            if v26.onTestFileStart ~= nil then
                v4.resolve(v26:onTestFileStart(v24)):expect();
            elseif v26.onTestStart ~= nil then
                v4.resolve(v26:onTestStart(v24)):expect();
            end;
        end;
    end);
end;
v10.onRunStart = function(v27, v28, v29) --[[ Line: 139 ]] --[[ Name: onRunStart ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 140 ]]
        -- upvalues: v27 (copy), v4 (ref), v28 (copy), v29 (copy)
        for _, v31 in v27._reporters do
            if v31.onRunStart ~= nil then
                v4.resolve(v31:onRunStart(v28, v29)):expect();
            end;
        end;
    end);
end;
v10.onTestCaseResult = function(v32, v33, v34) --[[ Line: 149 ]] --[[ Name: onTestCaseResult ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 150 ]]
        -- upvalues: v32 (copy), v4 (ref), v33 (copy), v34 (copy)
        for _, v36 in v32._reporters do
            if v36.onTestCaseResult ~= nil then
                v4.resolve(v36:onTestCaseResult(v33, v34)):expect();
            end;
        end;
    end);
end;
v10.onRunComplete = function(v37, v38, v39) --[[ Line: 159 ]] --[[ Name: onRunComplete ]]
    -- upvalues: v4 (copy)
    return v4.resolve():andThen(function() --[[ Line: 160 ]]
        -- upvalues: v37 (copy), v4 (ref), v38 (copy), v39 (copy)
        for _, v41 in v37._reporters do
            if v41.onRunComplete ~= nil then
                v4.resolve(v41:onRunComplete(v38, v39)):expect();
            end;
        end;
    end);
end;
v10.getErrors = function(v42) --[[ Line: 169 ]] --[[ Name: getErrors ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.reduce(v42._reporters, function(v43, v44) --[[ Line: 170 ]]
        -- upvalues: l_Array_0 (ref)
        local v45 = if v44.getLastError ~= nil then v44:getLastError() else nil;
        if v45 ~= nil then
            return (l_Array_0.concat(v43, v45));
        else
            return v43;
        end;
    end, {});
end;
v10.hasErrors = function(v46) --[[ Line: 180 ]] --[[ Name: hasErrors ]]
    return #v46:getErrors() ~= 0;
end;
v5.default = v10;
return v5;