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
local function v12(v13, v14, v15) --[[ Line: 22 ]] --[[ Name: reportNode ]]
    -- upvalues: v8 (copy), v10 (copy), v9 (copy), v12 (copy)
    v14 = v14 or {};
    v15 = v15 or 0;
    if v13.status == v8.TestStatus.Skipped then
        return v14;
    else
        local v16 = nil;
        if v13.status ~= v8.TestStatus.Success then
            local v17 = v10[v13.status] or "?";
            v16 = ("%s[%s] %s"):format(v9:rep(v15), v17, v13.planNode.phrase);
        end;
        table.insert(v14, v16);
        for _, v19 in ipairs(v13.children) do
            v12(v19, v14, v15 + 1);
        end;
        return v14;
    end;
end;
local function v24(v20) --[[ Line: 51 ]] --[[ Name: reportRoot ]]
    -- upvalues: v12 (copy)
    local v21 = {};
    for _, v23 in ipairs(v20.children) do
        v12(v23, v21, 0);
    end;
    return v21;
end;
local function _(v25) --[[ Line: 61 ]] --[[ Name: report ]]
    -- upvalues: v24 (copy)
    local v26 = v24(v25);
    return table.concat(v26, "\n");
end;
v11.report = function(v28) --[[ Line: 67 ]] --[[ Name: report ]]
    -- upvalues: v24 (copy), l_TestService_0 (copy)
    local v29 = {};
    local v30 = "Test results:";
    local v31 = v24(v28);
    local v32 = table.concat(v31, "\n");
    v6(v29, 1, v30, v32, ("%d passed, %d failed, %d skipped"):format(v28.successCount, v28.failureCount, v28.skippedCount));
    print(table.concat(v29, "\n"));
    if v28.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v28.failureCount));
    end;
    if #v28.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v34 in ipairs(v28.errors) do
            l_TestService_0:Error(v34);
            print("");
        end;
    end;
end;
return v11;