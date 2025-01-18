local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_TestService_0 = game:GetService("TestService");
local v8 = require(script.Parent.Parent.TestEnum);
local v9 = {};
local function _(v10) --[[ Line: 7 ]] --[[ Name: teamCityEscape ]]
    v10 = string.gsub(v10, "([]|'[])", "|%1");
    v10 = string.gsub(v10, "\r", "|r");
    return (string.gsub(v10, "\n", "|n"));
end;
local function v16(v12) --[[ Line: 14 ]] --[[ Name: teamCityEnterSuite ]]
    local l_format_0 = string.format;
    local v14 = "##teamcity[testSuiteStarted name='%s']";
    local v15 = string.gsub(v12, "([]|'[])", "|%1");
    v15 = string.gsub(v15, "\r", "|r");
    return l_format_0(v14, (string.gsub(v15, "\n", "|n")));
end;
local function v21(v17) --[[ Line: 18 ]] --[[ Name: teamCityLeaveSuite ]]
    local l_format_1 = string.format;
    local v19 = "##teamcity[testSuiteFinished name='%s']";
    local v20 = string.gsub(v17, "([]|'[])", "|%1");
    v20 = string.gsub(v20, "\r", "|r");
    return l_format_1(v19, (string.gsub(v20, "\n", "|n")));
end;
local function v26(v22) --[[ Line: 22 ]] --[[ Name: teamCityEnterCase ]]
    local l_format_2 = string.format;
    local v24 = "##teamcity[testStarted name='%s']";
    local v25 = string.gsub(v22, "([]|'[])", "|%1");
    v25 = string.gsub(v25, "\r", "|r");
    return l_format_2(v24, (string.gsub(v25, "\n", "|n")));
end;
local function v31(v27) --[[ Line: 26 ]] --[[ Name: teamCityLeaveCase ]]
    local l_format_3 = string.format;
    local v29 = "##teamcity[testFinished name='%s']";
    local v30 = string.gsub(v27, "([]|'[])", "|%1");
    v30 = string.gsub(v30, "\r", "|r");
    return l_format_3(v29, (string.gsub(v30, "\n", "|n")));
end;
local function v39(v32, v33) --[[ Line: 30 ]] --[[ Name: teamCityFailCase ]]
    local l_format_4 = string.format;
    local v35 = "##teamcity[testFailed name='%s' message='%s']";
    local v36 = string.gsub(v32, "([]|'[])", "|%1");
    v36 = string.gsub(v36, "\r", "|r");
    local v37 = string.gsub(v36, "\n", "|n");
    local v38 = string.gsub(v33, "([]|'[])", "|%1");
    v38 = string.gsub(v38, "\r", "|r");
    return l_format_4(v35, v37, (string.gsub(v38, "\n", "|n")));
end;
local function v40(v41, v42, v43) --[[ Line: 38 ]] --[[ Name: reportNode ]]
    -- upvalues: v8 (copy), v16 (copy), v40 (copy), v21 (copy), v26 (copy), v39 (copy), v31 (copy)
    v42 = v42 or {};
    v43 = v43 or 0;
    if v41.status == v8.TestStatus.Skipped then
        return v42;
    elseif v41.planNode.type == v8.NodeType.Describe then
        table.insert(v42, v16(v41.planNode.phrase));
        for _, v45 in ipairs(v41.children) do
            v40(v45, v42, v43 + 1);
        end;
        table.insert(v42, v21(v41.planNode.phrase));
        return v42;
    else
        table.insert(v42, v26(v41.planNode.phrase));
        if v41.status == v8.TestStatus.Failure then
            table.insert(v42, v39(v41.planNode.phrase, table.concat(v41.errors, "\n")));
        end;
        table.insert(v42, v31(v41.planNode.phrase));
        return v42;
    end;
end;
local function v50(v46) --[[ Line: 60 ]] --[[ Name: reportRoot ]]
    -- upvalues: v40 (copy)
    local v47 = {};
    for _, v49 in ipairs(v46.children) do
        v40(v49, v47, 0);
    end;
    return v47;
end;
local function _(v51) --[[ Line: 70 ]] --[[ Name: report ]]
    -- upvalues: v50 (copy)
    local v52 = v50(v51);
    return table.concat(v52, "\n");
end;
v9.report = function(v54) --[[ Line: 76 ]] --[[ Name: report ]]
    -- upvalues: v50 (copy), l_TestService_0 (copy)
    local v55 = {};
    local v56 = "Test results:";
    local v57 = v50(v54);
    local v58 = table.concat(v57, "\n");
    v6(v55, 1, v56, v58, ("%d passed, %d failed, %d skipped"):format(v54.successCount, v54.failureCount, v54.skippedCount));
    print(table.concat(v55, "\n"));
    if v54.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v54.failureCount));
    end;
    if #v54.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v60 in ipairs(v54.errors) do
            print("\226\128\162 " .. v60.phrase);
            print("");
            l_TestService_0:Error(v60.message);
            print("");
        end;
    end;
end;
return v9;