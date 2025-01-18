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
local l_Parent_0 = script.Parent.Parent.Parent;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
    -- upvalues: l_Parent_0 (copy)
    return require(l_Parent_0.JestMatcherUtils);
end);
local v12 = l_status_0 and l_result_0.EXPECTED_COLOR or function(v11) --[[ Line: 13 ]]
    return v11;
end;
local v14 = l_status_0 and l_result_0.RECEIVED_COLOR or function(v13) --[[ Line: 16 ]]
    return v13;
end;
local v16 = l_status_0 and l_result_0.BOLD_WEIGHT or function(v15) --[[ Line: 19 ]]
    return v15;
end;
local v18 = l_status_0 and l_result_0.DIM_COLOR or function(v17) --[[ Line: 22 ]]
    return v17;
end;
local v19 = require(script.Parent.Parent.TestEnum);
local v20 = (" "):rep(3);
local v21 = {
    [v19.TestStatus.Success] = v12("+"), 
    [v19.TestStatus.Failure] = v14("-"), 
    [v19.TestStatus.Skipped] = v18("~")
};
local v22 = {};
local function v25(v23, v24) --[[ Line: 38 ]] --[[ Name: compareNodes ]]
    return v23.planNode.phrase:lower() < v24.planNode.phrase:lower();
end;
local function v26(v27, v28, v29) --[[ Line: 42 ]] --[[ Name: reportNode ]]
    -- upvalues: v19 (copy), v21 (copy), v20 (copy), v25 (copy), v26 (copy)
    v28 = v28 or {};
    v29 = v29 or 0;
    if v27.status == v19.TestStatus.Skipped then
        return v28;
    else
        local v30 = nil;
        if v27.status then
            local v31 = v21[v27.status] or "?";
            v30 = ("%s[%s] %s"):format(v20:rep(v29), v31, v27.planNode.phrase);
        else
            v30 = ("%s%s"):format(v20:rep(v29), v27.planNode.phrase);
        end;
        table.insert(v28, v30);
        table.sort(v27.children, v25);
        for _, v33 in ipairs(v27.children) do
            v26(v33, v28, v29 + 1);
        end;
        return v28;
    end;
end;
local function v38(v34) --[[ Line: 70 ]] --[[ Name: reportRoot ]]
    -- upvalues: v25 (copy), v26 (copy)
    local v35 = {};
    table.sort(v34.children, v25);
    for _, v37 in ipairs(v34.children) do
        v26(v37, v35, 0);
    end;
    return v35;
end;
local function _(v39) --[[ Line: 81 ]] --[[ Name: report ]]
    -- upvalues: v38 (copy)
    local v40 = v38(v39);
    return table.concat(v40, "\n");
end;
v22.report = function(v42) --[[ Line: 87 ]] --[[ Name: report ]]
    -- upvalues: v38 (copy), v16 (copy), v14 (copy), l_TestService_0 (copy)
    local v43 = {};
    local v44 = "Test results:";
    local v45 = v38(v42);
    local v46 = table.concat(v45, "\n");
    v6(v43, 1, v44, v46, ("%d passed, %d failed, %d skipped"):format(v42.successCount, v42.failureCount, v42.skippedCount));
    print(table.concat(v43, "\n"));
    if v42.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v42.failureCount));
    end;
    if #v42.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v48 in ipairs(v42.errors) do
            print(v16(v14("\226\128\162 " .. v48.phrase)));
            print("");
            l_TestService_0:Error(v48.message);
            print("");
        end;
    end;
end;
return v22;