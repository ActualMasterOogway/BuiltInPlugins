local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.TestResults);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {
        results = v1.new(v3), 
        nodeStack = {}, 
        hasFocusNodes = false
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.calculateTotals = function(v5) --[[ Line: 38 ]] --[[ Name: calculateTotals ]]
    -- upvalues: v0 (copy)
    local l_results_0 = v5.results;
    l_results_0.successCount = 0;
    l_results_0.failureCount = 0;
    l_results_0.skippedCount = 0;
    l_results_0:visitAllNodes(function(v7) --[[ Line: 45 ]]
        -- upvalues: v0 (ref), l_results_0 (copy)
        local l_status_0 = v7.status;
        if v7.planNode.type == v0.NodeType.It then
            if l_status_0 == v0.TestStatus.Success then
                l_results_0.successCount = l_results_0.successCount + 1;
                return;
            elseif l_status_0 == v0.TestStatus.Failure then
                l_results_0.failureCount = l_results_0.failureCount + 1;
                return;
            elseif l_status_0 == v0.TestStatus.Skipped then
                l_results_0.skippedCount = l_results_0.skippedCount + 1;
            end;
        end;
    end);
end;
v2.gatherErrors = function(v9) --[[ Line: 65 ]] --[[ Name: gatherErrors ]]
    local l_results_1 = v9.results;
    l_results_1.errors = {};
    l_results_1:visitAllNodes(function(v11) --[[ Line: 70 ]]
        -- upvalues: l_results_1 (copy)
        if #v11.errors > 0 then
            for _, v13 in ipairs(v11.errors) do
                table.insert(l_results_1.errors, v13);
            end;
        end;
    end);
end;
v2.finalize = function(v14) --[[ Line: 82 ]] --[[ Name: finalize ]]
    if #v14.nodeStack ~= 0 then
        error("Cannot finalize TestResults with nodes still on the stack!", 2);
    end;
    v14:calculateTotals();
    v14:gatherErrors();
    return v14.results;
end;
v2.pushNode = function(v15, v16) --[[ Line: 96 ]] --[[ Name: pushNode ]]
    -- upvalues: v1 (copy)
    local v17 = v1.createNode(v16);
    table.insert((v15.nodeStack[#v15.nodeStack] or v15.results).children, v17);
    table.insert(v15.nodeStack, v17);
    return v17;
end;
v2.popNode = function(v18) --[[ Line: 110 ]] --[[ Name: popNode ]]
    assert(#v18.nodeStack > 0, "Tried to pop from an empty node stack!");
    return table.remove(v18.nodeStack, #v18.nodeStack);
end;
v2.shouldSkip = function(v19) --[[ Line: 118 ]] --[[ Name: shouldSkip ]]
    -- upvalues: v0 (copy)
    if v19.hasFocusNodes then
        for v20 = #v19.nodeStack, 1, -1 do
            local v21 = v19.nodeStack[v20];
            if v21.planNode.modifier == v0.NodeModifier.Skip then
                return true;
            elseif v21.planNode.modifier == v0.NodeModifier.Focus then
                return false;
            end;
        end;
        return true;
    else
        for v22 = #v19.nodeStack, 1, -1 do
            if v19.nodeStack[v22].planNode.modifier == v0.NodeModifier.Skip then
                return true;
            end;
        end;
        return false;
    end;
end;
return v2;