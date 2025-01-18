local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.TestResults);
local v2 = require(script.Parent.Context);
local v3 = require(script.Parent.ExpectationContext);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v6 = {
        results = v1.new(v5), 
        nodeStack = {}, 
        contextStack = {}, 
        expectationContextStack = {}, 
        hasFocusNodes = false
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.calculateTotals = function(v7) --[[ Line: 42 ]] --[[ Name: calculateTotals ]]
    -- upvalues: v0 (copy)
    local l_results_0 = v7.results;
    l_results_0.successCount = 0;
    l_results_0.failureCount = 0;
    l_results_0.skippedCount = 0;
    l_results_0:visitAllNodes(function(v9) --[[ Line: 49 ]]
        -- upvalues: v0 (ref), l_results_0 (copy)
        local l_status_0 = v9.status;
        if v9.planNode.type == v0.NodeType.It then
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
v4.gatherErrors = function(v11) --[[ Line: 69 ]] --[[ Name: gatherErrors ]]
    local l_results_1 = v11.results;
    l_results_1.errors = {};
    l_results_1:visitAllNodes(function(v13) --[[ Line: 74 ]]
        -- upvalues: l_results_1 (copy)
        if #v13.errors > 0 then
            for _, v15 in ipairs(v13.errors) do
                table.insert(l_results_1.errors, {
                    message = v15, 
                    phrase = v13.planNode.phrase
                });
            end;
        end;
    end);
end;
v4.finalize = function(v16) --[[ Line: 89 ]] --[[ Name: finalize ]]
    if #v16.nodeStack ~= 0 then
        error("Cannot finalize TestResults with nodes still on the stack!", 2);
    end;
    v16:calculateTotals();
    v16:gatherErrors();
    return v16.results;
end;
v4.pushNode = function(v17, v18) --[[ Line: 103 ]] --[[ Name: pushNode ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v19 = v1.createNode(v18);
    table.insert((v17.nodeStack[#v17.nodeStack] or v17.results).children, v19);
    table.insert(v17.nodeStack, v19);
    local v20 = v17.contextStack[#v17.contextStack];
    local v21 = v2.new(v20);
    table.insert(v17.contextStack, v21);
    local v22 = v17.expectationContextStack[#v17.expectationContextStack];
    local v23 = v3.new(v22);
    table.insert(v17.expectationContextStack, v23);
end;
v4.popNode = function(v24) --[[ Line: 121 ]] --[[ Name: popNode ]]
    assert(#v24.nodeStack > 0, "Tried to pop from an empty node stack!");
    table.remove(v24.nodeStack, #v24.nodeStack);
    table.remove(v24.contextStack, #v24.contextStack);
    table.remove(v24.expectationContextStack, #v24.expectationContextStack);
end;
v4.getContext = function(v25) --[[ Line: 131 ]] --[[ Name: getContext ]]
    assert(#v25.contextStack > 0, "Tried to get context from an empty stack!");
    return v25.contextStack[#v25.contextStack];
end;
v4.getExpectationContext = function(v26) --[[ Line: 136 ]] --[[ Name: getExpectationContext ]]
    assert(#v26.expectationContextStack > 0, "Tried to get expectationContext from an empty stack!");
    return v26.expectationContextStack[#v26.expectationContextStack];
end;
v4.shouldSkip = function(v27) --[[ Line: 144 ]] --[[ Name: shouldSkip ]]
    -- upvalues: v0 (copy)
    if v27.hasFocusNodes then
        for v28 = #v27.nodeStack, 1, -1 do
            local v29 = v27.nodeStack[v28];
            if v29.planNode.modifier == v0.NodeModifier.Skip then
                return true;
            elseif v29.planNode.modifier == v0.NodeModifier.Focus then
                return false;
            end;
        end;
        return true;
    else
        for v30 = #v27.nodeStack, 1, -1 do
            if v27.nodeStack[v30].planNode.modifier == v0.NodeModifier.Skip then
                return true;
            end;
        end;
        return false;
    end;
end;
v4.setSuccess = function(v31) --[[ Line: 178 ]] --[[ Name: setSuccess ]]
    -- upvalues: v0 (copy)
    assert(#v31.nodeStack > 0, "Attempting to set success status on empty stack");
    v31.nodeStack[#v31.nodeStack].status = v0.TestStatus.Success;
end;
v4.setSkipped = function(v32) --[[ Line: 186 ]] --[[ Name: setSkipped ]]
    -- upvalues: v0 (copy)
    assert(#v32.nodeStack > 0, "Attempting to set skipped status on empty stack");
    v32.nodeStack[#v32.nodeStack].status = v0.TestStatus.Skipped;
end;
v4.setError = function(v33, v34) --[[ Line: 195 ]] --[[ Name: setError ]]
    -- upvalues: v0 (copy)
    assert(#v33.nodeStack > 0, "Attempting to set error status on empty stack");
    local v35 = v33.nodeStack[#v33.nodeStack];
    v35.status = v0.TestStatus.Failure;
    table.insert(v35.errors, v34);
end;
v4.addDummyError = function(v36, v37, v38) --[[ Line: 207 ]] --[[ Name: addDummyError ]]
    -- upvalues: v0 (copy)
    v36:pushNode({
        type = v0.NodeType.It, 
        phrase = v37
    });
    v36:setError(v38);
    v36:popNode();
    v36.nodeStack[#v36.nodeStack].status = v0.TestStatus.Failure;
end;
v4.setStatusFromChildren = function(v39) --[[ Line: 219 ]] --[[ Name: setStatusFromChildren ]]
    -- upvalues: v0 (copy)
    assert(#v39.nodeStack > 0, "Attempting to set status from children on empty stack");
    local v40 = v39.nodeStack[#v39.nodeStack];
    local l_Success_0 = v0.TestStatus.Success;
    local v42 = true;
    for _, v44 in ipairs(v40.children) do
        if v44.status ~= v0.TestStatus.Skipped then
            v42 = false;
            if v44.status == v0.TestStatus.Failure then
                l_Success_0 = v0.TestStatus.Failure;
            end;
        end;
    end;
    if v42 then
        l_Success_0 = v0.TestStatus.Skipped;
    end;
    v40.status = l_Success_0;
end;
return v4;