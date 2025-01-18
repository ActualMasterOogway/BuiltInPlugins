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
local v9 = (" "):rep(3);
local v10 = {
    [v8.TestStatus.Success] = "+", 
    [v8.TestStatus.Failure] = "-", 
    [v8.TestStatus.Skipped] = "~"
};
local v11 = {};
local function v14(v12, v13) --[[ Line: 20 ]] --[[ Name: compareNodes ]]
    return v12.planNode.phrase:lower() < v13.planNode.phrase:lower();
end;
local function v15(v16, v17, v18) --[[ Line: 24 ]] --[[ Name: reportNode ]]
    -- upvalues: v8 (copy), v10 (copy), v9 (copy), v14 (copy), v15 (copy)
    v17 = v17 or {};
    v18 = v18 or 0;
    if v16.status == v8.TestStatus.Skipped then
        return v17;
    else
        local v19 = nil;
        if v16.status then
            local v20 = v10[v16.status] or "?";
            v19 = ("%s[%s] %s"):format(v9:rep(v18), v20, v16.planNode.phrase);
        else
            v19 = ("%s%s"):format(v9:rep(v18), v16.planNode.phrase);
        end;
        table.insert(v17, v19);
        table.sort(v16.children, v14);
        for _, v22 in ipairs(v16.children) do
            v15(v22, v17, v18 + 1);
        end;
        return v17;
    end;
end;
local function v27(v23) --[[ Line: 59 ]] --[[ Name: reportRoot ]]
    -- upvalues: v14 (copy), v15 (copy)
    local v24 = {};
    table.sort(v23.children, v14);
    for _, v26 in ipairs(v23.children) do
        v15(v26, v24, 0);
    end;
    return v24;
end;
local function _(v28) --[[ Line: 70 ]] --[[ Name: report ]]
    -- upvalues: v27 (copy)
    local v29 = v27(v28);
    return table.concat(v29, "\n");
end;
v11.report = function(v31) --[[ Line: 76 ]] --[[ Name: report ]]
    -- upvalues: v27 (copy), l_TestService_0 (copy)
    local v32 = {};
    local v33 = "Test results:";
    local v34 = v27(v31);
    local v35 = table.concat(v34, "\n");
    v6(v32, 1, v33, v35, ("%d passed, %d failed, %d skipped"):format(v31.successCount, v31.failureCount, v31.skippedCount));
    print(table.concat(v32, "\n"));
    if v31.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v31.failureCount));
    end;
    if #v31.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v37 in ipairs(v31.errors) do
            l_TestService_0:Error(v37);
            print("");
        end;
    end;
end;
return v11;