local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local _ = require(l_Parent_0.types);
local v7 = nil;
local function v14(v8, v9, v10) --[[ Line: 29 ]] --[[ Name: formatTestResult ]]
    -- upvalues: l_Array_0 (copy), v7 (ref), l_Boolean_0 (copy)
    local v11 = l_Array_0.map(v8.testResults, v7);
    if v8.testExecError ~= nil then
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        return {
            assertionResults = v11, 
            coverage = {}, 
            endTime = l_UnixTimestampMillis_0, 
            message = if v8.failureMessage ~= nil then v8.failureMessage else v8.testExecError.message, 
            name = v8.testFilePath, 
            startTime = l_UnixTimestampMillis_0, 
            status = "failed", 
            summary = ""
        };
    else
        local v13 = v8.numFailingTests == 0;
        return {
            assertionResults = v11, 
            coverage = if v9 ~= nil then v9(v8.coverage, v10) else v8.coverage, 
            endTime = v8.perfStats.end_, 
            message = if v8.failureMessage ~= nil then v8.failureMessage else "", 
            name = v8.testFilePath, 
            startTime = v8.perfStats.start, 
            status = l_Boolean_0.toJSBoolean(v13) and "passed" or "failed", 
            summary = ""
        };
    end;
end;
v7 = function(v15) --[[ Line: 66 ]] --[[ Name: formatTestAssertion ]]
    local v16 = {
        ancestorTitles = v15.ancestorTitles, 
        failureMessages = nil, 
        fullName = v15.fullName, 
        location = v15.location, 
        status = v15.status, 
        title = v15.title
    };
    if v15.failureMessages then
        v16.failureMessages = v15.failureMessages;
    end;
    return v16;
end;
return {
    default = function(v17, v18, v19) --[[ Line: 81 ]] --[[ Name: formatTestResults ]]
        -- upvalues: l_Array_0 (copy), v14 (copy), l_Object_0 (copy)
        local v21 = l_Array_0.map(v17.testResults, function(v20) --[[ Line: 86 ]]
            -- upvalues: v14 (ref), v18 (copy), v19 (copy)
            return (v14(v20, v18, v19));
        end);
        return l_Object_0.assign({}, v17, {
            testResults = v21
        });
    end
};