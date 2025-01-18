local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = {};
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local v4 = require(script.Parent.utils);
local l_makeSingleTestResult_0 = v4.makeSingleTestResult;
local l_parseSingleTestResult_0 = v4.parseSingleTestResult;
v1.default = function(v7, v8) --[[ Line: 20 ]] --[[ Name: testCaseReportHandler ]]
    -- upvalues: l_makeSingleTestResult_0 (copy), l_parseSingleTestResult_0 (copy)
    return function(_, v10) --[[ Line: 21 ]]
        -- upvalues: l_makeSingleTestResult_0 (ref), l_parseSingleTestResult_0 (ref), v8 (copy), v7 (copy)
        if v10.name == "test_done" then
            local v11 = l_makeSingleTestResult_0(v10.test);
            local v12 = l_parseSingleTestResult_0(v11);
            v8("test-case-result", {
                v7, 
                v12
            });
        end;
    end;
end;
return v1;