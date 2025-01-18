local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.JestTestResult);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local l_TestService_0 = game:GetService("TestService");
local v7 = require(l_Parent_0.ChalkLua);
local function v12(v8) --[[ Line: 51 ]] --[[ Name: getTestFilePath ]]
    local v9 = "";
    local l_planNode_0 = v8.planNode;
    while l_planNode_0 do
        local v11 = if typeof(l_planNode_0.instance) == "Instance" then l_planNode_0.phrase .. "/" .. l_planNode_0.instance.Name else l_planNode_0.phrase;
        if v9 == "" then
            v9 = v11;
        else
            v9 = l_planNode_0.phrase .. "/" .. v9;
        end;
        l_planNode_0 = l_planNode_0.parent;
    end;
    return v9;
end;
local function v17(v13) --[[ Line: 65 ]] --[[ Name: getTestFailurePath ]]
    local v14 = "";
    local l_planNode_1 = v13.planNode;
    while l_planNode_1 and not l_planNode_1.isRoot do
        local v16 = if typeof(l_planNode_1.instance) == "Instance" then l_planNode_1.phrase .. " \226\128\186 " .. l_planNode_1.instance.Name else l_planNode_1.phrase;
        if v14 == "" then
            v14 = v16;
        else
            v14 = l_planNode_1.phrase .. " \226\128\186 " .. v14;
        end;
        l_planNode_1 = l_planNode_1.parent;
    end;
    return v14;
end;
local function v20(v18, v19) --[[ Line: 78 ]] --[[ Name: getTestResult ]]
    -- upvalues: l_Array_0 (copy)
    return {
        ancestorTitles = v19, 
        title = v18.planNode.phrase, 
        fullName = ("%s/%s"):format(l_Array_0.join(v19, "/"), v18.planNode.phrase), 
        status = v18.status == "Success" and "passed" or v18.status == "Failure" and "failed" or "pending"
    };
end;
local function v21(v22, v23) --[[ Line: 87 ]] --[[ Name: getTestResults ]]
    -- upvalues: l_Array_0 (copy), v20 (copy), v21 (copy)
    local v24 = v23 or {};
    return l_Array_0.reduce(v22.children, function(v25, v26) --[[ Line: 89 ]]
        -- upvalues: v20 (ref), v24 (copy), l_Array_0 (ref), v21 (ref)
        if v26.planNode.type == "It" then
            table.insert(v25, (v20(v26, v24)));
            return v25;
        else
            local v27 = l_Array_0.concat({}, v24, {
                v26.planNode.phrase
            });
            return (l_Array_0.concat(v25, v21(v26, v27)));
        end;
    end, {});
end;
local function v28(v29, v30) --[[ Line: 100 ]] --[[ Name: getTestSuiteResults ]]
    -- upvalues: l_Array_0 (copy), v20 (copy), v28 (copy)
    local v31 = v30 or {};
    return l_Array_0.reduce(v29.children, function(v32, v33) --[[ Line: 102 ]]
        -- upvalues: v20 (ref), v31 (copy), l_Array_0 (ref), v28 (ref)
        if v33.planNode.isRoot then
            table.insert(v32, (v20(v33, v31)));
            return v32;
        else
            local v34 = l_Array_0.concat({}, v31, {
                v33.planNode.phrase
            });
            return (l_Array_0.concat(v32, v28(v33, v34)));
        end;
    end, {});
end;
local function _(v35, v36) --[[ Line: 113 ]] --[[ Name: countResults ]]
    -- upvalues: l_Array_0 (copy)
    return #l_Array_0.filter(v35, function(v37) --[[ Line: 114 ]]
        -- upvalues: v36 (copy)
        return v37.status == v36;
    end);
end;
local function v40(v39) --[[ Line: 119 ]] --[[ Name: testNodeToTest ]]
    -- upvalues: v12 (copy)
    return {
        context = {
            config = {
                rootDir = "/"
            }
        }, 
        duration = 0, 
        path = v12(v39)
    };
end;
local function v41(v42) --[[ Line: 127 ]] --[[ Name: getFailureMessages ]]
    -- upvalues: l_Array_0 (copy), v7 (copy), v17 (copy), l_String_0 (copy), v41 (copy)
    local v43 = {};
    if v42.status == "Failure" then
        v43 = l_Array_0.concat(v43, l_Array_0.map(v42.errors, function(v44) --[[ Line: 133 ]]
            -- upvalues: v7 (ref), v17 (ref), v42 (copy), l_String_0 (ref)
            return v7.red(v7.bold("  \226\151\143 " .. v17(v42))) .. "\n\n" .. l_String_0.trim(v44);
        end));
        for _, v46 in ipairs(v42.children) do
            v43 = l_Array_0.concat(v43, v41(v46));
        end;
    end;
    return v43;
end;
local function v61(v47) --[[ Line: 145 ]] --[[ Name: testNodeToTestResult ]]
    -- upvalues: v21 (copy), v41 (copy), l_Array_0 (copy), v12 (copy)
    local v48 = v21(v47);
    local v49 = v41(v47);
    local v50 = {
        snapshot = {
            added = 0, 
            fileDeleted = false, 
            matched = 0, 
            unchecked = 0, 
            unmatched = 0, 
            updated = 0, 
            total = 0, 
            uncheckedKeys = {}
        }, 
        failureMessage = if #v49 > 0 then "\n" .. l_Array_0.join(v49, "\n\n") .. "\n" else nil, 
        testFilePath = v12(v47)
    };
    local l_filter_0 = l_Array_0.filter;
    local l_v48_0 = v48;
    local v53 = "failed";
    local l_v53_0 = v53 --[[ copy: 8 -> 9 ]];
    v50.numFailingTests = #l_filter_0(l_v48_0, function(v55) --[[ Line: 114 ]]
        -- upvalues: l_v53_0 (copy)
        return v55.status == l_v53_0;
    end);
    l_filter_0 = l_Array_0.filter;
    l_v48_0 = v48;
    v53 = "passed";
    local l_v53_1 = v53 --[[ copy: 8 -> 10 ]];
    v50.numPassingTests = #l_filter_0(l_v48_0, function(v57) --[[ Line: 114 ]]
        -- upvalues: l_v53_1 (copy)
        return v57.status == l_v53_1;
    end);
    l_filter_0 = l_Array_0.filter;
    l_v48_0 = v48;
    v53 = "pending";
    local l_v53_2 = v53 --[[ copy: 8 -> 11 ]];
    v50.numPendingTests = #l_filter_0(l_v48_0, function(v59) --[[ Line: 114 ]]
        -- upvalues: l_v53_2 (copy)
        return v59.status == l_v53_2;
    end);
    l_filter_0 = l_Array_0.filter;
    l_v48_0 = v48;
    v53 = "todo";
    v50.numTodoTests = #l_filter_0(l_v48_0, function(v60) --[[ Line: 114 ]]
        -- upvalues: v53 (copy)
        return v60.status == v53;
    end);
    v50.testResults = v48;
    v50.skipped = v47.status == "Skipped";
    v50.leaks = false;
    v50.openHandles = {};
    v50.perfStats = nil;
    return v50;
end;
local function v82(v62) --[[ Line: 174 ]] --[[ Name: testNodeToAggregatedResults ]]
    -- upvalues: v21 (copy), v28 (copy), l_Array_0 (copy)
    local v63 = v21(v62);
    local v64 = v28(v62);
    local v65 = {};
    local l_filter_1 = l_Array_0.filter;
    local l_v63_0 = v63;
    local v68 = "failed";
    local l_v68_0 = v68 --[[ copy: 8 -> 9 ]];
    v65.numFailedTests = #l_filter_1(l_v63_0, function(v70) --[[ Line: 114 ]]
        -- upvalues: l_v68_0 (copy)
        return v70.status == l_v68_0;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v63_0 = v63;
    v68 = "passed";
    local l_v68_1 = v68 --[[ copy: 8 -> 10 ]];
    v65.numPassedTests = #l_filter_1(l_v63_0, function(v72) --[[ Line: 114 ]]
        -- upvalues: l_v68_1 (copy)
        return v72.status == l_v68_1;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v63_0 = v63;
    v68 = "pending";
    local l_v68_2 = v68 --[[ copy: 8 -> 11 ]];
    v65.numPendingTests = #l_filter_1(l_v63_0, function(v74) --[[ Line: 114 ]]
        -- upvalues: l_v68_2 (copy)
        return v74.status == l_v68_2;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v63_0 = v63;
    v68 = "todo";
    local l_v68_3 = v68 --[[ copy: 8 -> 12 ]];
    v65.numTodoTests = #l_filter_1(l_v63_0, function(v76) --[[ Line: 114 ]]
        -- upvalues: l_v68_3 (copy)
        return v76.status == l_v68_3;
    end);
    v65.numTotalTests = #v63;
    l_filter_1 = l_Array_0.filter;
    l_v63_0 = v64;
    v68 = "failed";
    local l_v68_4 = v68 --[[ copy: 8 -> 13 ]];
    v65.numFailedTestSuites = #l_filter_1(l_v63_0, function(v78) --[[ Line: 114 ]]
        -- upvalues: l_v68_4 (copy)
        return v78.status == l_v68_4;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v63_0 = v64;
    v68 = "passed";
    local l_v68_5 = v68 --[[ copy: 8 -> 14 ]];
    v65.numPassedTestSuites = #l_filter_1(l_v63_0, function(v80) --[[ Line: 114 ]]
        -- upvalues: l_v68_5 (copy)
        return v80.status == l_v68_5;
    end);
    l_filter_1 = l_Array_0.filter;
    l_v63_0 = v64;
    v68 = "pending";
    v65.numPendingTestSuites = #l_filter_1(l_v63_0, function(v81) --[[ Line: 114 ]]
        -- upvalues: v68 (copy)
        return v81.status == v68;
    end);
    v65.numTotalTestSuites = #v64;
    v65.numRuntimeErrorTestSuites = 0;
    v65.openHandles = {};
    v65.snapshot = {
        added = 0, 
        didUpdate = false, 
        failure = false, 
        filesAdded = 0, 
        filesRemoved = 0, 
        filesRemovedList = {}, 
        filesUnmatched = 0, 
        filesUpdated = 0, 
        matched = 0, 
        total = 0, 
        unchecked = 0, 
        uncheckedKeysByFile = {}, 
        unmatched = 0, 
        updated = 0
    };
    v65.startTime = v62.startTime or DateTime.now().UnixTimestampMillis;
    v65.success = false;
    v65.testResults = {};
    v65.wasInterrupted = false;
    return v65;
end;
return {
    createReporter = function(v83) --[[ Line: 212 ]] --[[ Name: reporterAdapter ]]
        -- upvalues: v40 (copy), v82 (copy), v61 (copy), l_Set_0 (copy), l_TestService_0 (copy)
        local function v86(v84, v85) --[[ Line: 213 ]] --[[ Name: compareNodes ]]
            return v84.planNode.phrase:lower() < v85.planNode.phrase:lower();
        end;
        local function v87(v88) --[[ Line: 217 ]] --[[ Name: reportNode ]]
            -- upvalues: v40 (ref), v82 (ref), v61 (ref), v83 (copy), v86 (copy), v87 (copy)
            if v88.planNode.isRoot then
                local v89 = v40(v88);
                local v90 = v82(v88);
                local v91 = v61(v88);
                v83:onTestResult(v89, v91, v90);
            end;
            table.sort(v88.children, v86);
            for _, v93 in ipairs(v88.children) do
                v87(v93);
            end;
        end;
        return {
            report = function(v94) --[[ Line: 232 ]] --[[ Name: reportRoot ]]
                -- upvalues: v86 (copy), v87 (copy), v82 (ref), v83 (copy), l_Set_0 (ref), l_TestService_0 (ref)
                table.sort(v94.children, v86);
                for _, v96 in ipairs(v94.children) do
                    v87(v96);
                end;
                local v97 = v82(v94);
                v83:onRunComplete(l_Set_0.new(), v97);
                if v97.numFailedTests > 0 then
                    l_TestService_0:Error(("%s test(s) failed."):format((tostring(v97.numFailedTests))));
                end;
            end
        };
    end
};