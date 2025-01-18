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
local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
    -- upvalues: l_Parent_0 (copy)
    return require(l_Parent_0.JestMatcherUtils);
end);
local v11 = l_status_0 and l_result_0.EXPECTED_COLOR or function() --[[ Line: 15 ]]

end;
local v12 = l_status_0 and l_result_0.RECEIVED_COLOR or function() --[[ Line: 16 ]]

end;
local v13 = l_status_0 and l_result_0.BOLD_WEIGHT or function() --[[ Line: 17 ]]

end;
local v14 = l_status_0 and l_result_0.DIM_COLOR or function() --[[ Line: 18 ]]

end;
local v15 = require(script.Parent.Parent.TestEnum);
local v16 = (" "):rep(3);
local v17 = {
    [v15.TestStatus.Success] = v11("+"), 
    [v15.TestStatus.Failure] = v12("-"), 
    [v15.TestStatus.Skipped] = v14("~")
};
local v18 = {};
local function v19(v20, v21, v22) --[[ Line: 32 ]] --[[ Name: reportNode ]]
    -- upvalues: v15 (copy), v17 (copy), v16 (copy), v19 (copy)
    v21 = v21 or {};
    v22 = v22 or 0;
    if v20.status == v15.TestStatus.Skipped then
        return v21;
    else
        local v23 = nil;
        if v20.status ~= v15.TestStatus.Success then
            local v24 = v17[v20.status] or "?";
            v23 = ("%s[%s] %s"):format(v16:rep(v22), v24, v20.planNode.phrase);
        end;
        table.insert(v21, v23);
        for _, v26 in ipairs(v20.children) do
            v19(v26, v21, v22 + 1);
        end;
        return v21;
    end;
end;
local function v31(v27) --[[ Line: 57 ]] --[[ Name: reportRoot ]]
    -- upvalues: v19 (copy)
    local v28 = {};
    for _, v30 in ipairs(v27.children) do
        v19(v30, v28, 0);
    end;
    return v28;
end;
local function _(v32) --[[ Line: 67 ]] --[[ Name: report ]]
    -- upvalues: v31 (copy)
    local v33 = v31(v32);
    return table.concat(v33, "\n");
end;
v18.report = function(v35) --[[ Line: 73 ]] --[[ Name: report ]]
    -- upvalues: v31 (copy), v13 (copy), v12 (copy), l_TestService_0 (copy)
    local v36 = {};
    local v37 = "Test results:";
    local v38 = v31(v35);
    local v39 = table.concat(v38, "\n");
    v6(v36, 1, v37, v39, ("%d passed, %d failed, %d skipped"):format(v35.successCount, v35.failureCount, v35.skippedCount));
    print(table.concat(v36, "\n"));
    if v35.failureCount > 0 then
        print(("%d test nodes reported failures."):format(v35.failureCount));
    end;
    if #v35.errors > 0 then
        print("Errors reported by tests:");
        print("");
        for _, v41 in ipairs(v35.errors) do
            print(v13(v12("\226\128\162 " .. v41.phrase)));
            print("");
            l_TestService_0:Error(v41.message);
            print("");
        end;
    end;
end;
return v18;