local v0 = require(script.Parent.TestEnum);
local v1 = {
    [v0.TestStatus.Success] = "+", 
    [v0.TestStatus.Failure] = "-", 
    [v0.TestStatus.Skipped] = "~"
};
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = {
        successCount = 0, 
        failureCount = 0, 
        skippedCount = 0, 
        planNode = v3, 
        children = {}, 
        errors = {}
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.createNode = function(v5) --[[ Line: 43 ]] --[[ Name: createNode ]]
    return {
        planNode = v5, 
        children = {}, 
        errors = {}, 
        status = nil
    };
end;
v2.visitAllNodes = function(v6, v7, v8) --[[ Line: 57 ]] --[[ Name: visitAllNodes ]]
    v8 = v8 or v6;
    for _, v10 in ipairs(v8.children) do
        v7(v10);
        v6:visitAllNodes(v7, v10);
    end;
end;
v2.visualize = function(v11, v12, v13) --[[ Line: 70 ]] --[[ Name: visualize ]]
    -- upvalues: v0 (copy), v1 (copy)
    v12 = v12 or v11;
    v13 = v13 or 0;
    local v14 = {};
    for _, v16 in ipairs(v12.children) do
        if v16.planNode.type == v0.NodeType.It then
            local v17 = v1[v16.status] or "?";
            local v18 = ("%s[%s] %s"):format((" "):rep(3 * v13), v17, v16.planNode.phrase);
            if v16.messages and #v16.messages > 0 then
                v18 = v18 .. "\n " .. (" "):rep(3 * v13) .. table.concat(v16.messages, "\n " .. (" "):rep(3 * v13));
            end;
            table.insert(v14, v18);
        else
            local v19 = ("%s%s"):format((" "):rep(3 * v13), v16.planNode.phrase or "");
            if v16.status then
                v19 = v19 .. (" (%s)"):format(v16.status);
            end;
            table.insert(v14, v19);
            if #v16.children > 0 then
                table.insert(v14, (v11:visualize(v16, v13 + 1)));
            end;
        end;
    end;
    return table.concat(v14, "\n");
end;
return v2;