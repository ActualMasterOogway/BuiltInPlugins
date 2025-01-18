local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Boolean_0 = require(l_Parent_1.LuauPolyfill).Boolean;
local v3 = {};
local v4 = require(l_Parent_1.ChalkLua);
local _ = require(l_Parent_1.JestTestResult);
local _ = require(l_Parent_1.JestTypes);
local l_formatTime_0 = require(l_Parent_1.JestUtil).formatTime;
local v8 = require(l_Parent_0.utils);
local l_formatTestPath_0 = v8.formatTestPath;
local l_printDisplayName_0 = v8.printDisplayName;
local function v11(...) --[[ Line: 37 ]]
    -- upvalues: v4 (copy)
    return v4.reset(v4.bold(v4.bgRed(...)));
end;
local v12 = if not (v4.supportsColor ~= nil) or v4.supportsColor == true then v4.reset(v4.inverse(v4.bold(v4.red(string.format(" %s ", "FAIL"))))) else "FAIL";
local v13 = if not (v4.supportsColor ~= nil) or v4.supportsColor == true then v4.reset(v4.inverse(v4.bold(v4.green(string.format(" %s ", "PASS"))))) else "PASS";
v3.default = function(v14, v15, v16) --[[ Line: 57 ]]
    -- upvalues: l_formatTestPath_0 (copy), v12 (copy), v13 (copy), l_Boolean_0 (copy), v11 (copy), l_formatTime_0 (copy), l_printDisplayName_0 (copy)
    local l_testFilePath_0 = v14.testFilePath;
    local v18 = l_formatTestPath_0(v16 or v15, l_testFilePath_0);
    if v14.numFailingTests == nil then
        v14.numFailingTests = 0;
    end;
    local v19 = if not (v14.numFailingTests <= 0) or v14.testExecError ~= nil then v12 else v13;
    local v20 = {};
    if v14.perfStats ~= nil and l_Boolean_0.toJSBoolean(v14.perfStats.slow) then
        local v21 = v14.perfStats.runtime / 1000;
        table.insert(v20, v11(l_formatTime_0(v21, 0)));
    end;
    if v14.memoryUsage ~= nil then
        local function _(v22) --[[ Line: 75 ]]
            return (math.floor(v22 / 1024 / 1024));
        end;
        table.insert(v20, (" %sMB heap size"):format((tostring((math.floor(v14.memoryUsage / 1024 / 1024))))));
    end;
    local v24 = if v16 ~= nil and l_Boolean_0.toJSBoolean(v16.displayName) then l_printDisplayName_0(v16) .. " " else "";
    return string.format("%s %s%s %s", v19, v24, v18, table.concat(v20, " "));
end;
return v3;