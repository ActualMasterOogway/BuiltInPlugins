local v0 = require(script.Parent.TestPlan);
local v1 = require(script.Parent.TestEnum);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v3 = {
        plan = v0.new(), 
        nodeStack = {}, 
        noXpcallByDefault = false, 
        testNamePattern = nil
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.finalize = function(v4) --[[ Line: 36 ]] --[[ Name: finalize ]]
    if #v4.nodeStack ~= 0 then
        error("Cannot finalize a TestPlan with nodes still on the stack!", 2);
    end;
    return v4.plan;
end;
v2.getCurrentNode = function(v5) --[[ Line: 47 ]] --[[ Name: getCurrentNode ]]
    return v5.nodeStack[#v5.nodeStack] or v5.plan;
end;
v2.pushNode = function(v6, v7, v8, v9) --[[ Line: 54 ]] --[[ Name: pushNode ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v10 = v6.nodeStack[#v6.nodeStack] or v6.plan;
    local v11 = nil;
    for _, v13 in ipairs(v10.children) do
        if v13.phrase == v7 then
            v11 = v13;
            break;
        end;
    end;
    if not v11 then
        v11 = v0.createNode(v7, v8, v9);
        v11.parent = v10;
        table.insert(v10.children, v11);
    end;
    table.insert(v6.nodeStack, v11);
    local v14 = true;
    if v11.modifier ~= nil then
        v14 = v11.modifier == v1.NodeModifier.None;
    end;
    if v6.testNamePattern and v14 then
        if v11:getFullName():match(v6.testNamePattern) then
            v11.modifier = v1.NodeModifier.Focus;
        else
            v11.modifier = v1.NodeModifier.Skip;
        end;
    end;
    v11.HACK_NO_XPCALL = v6.noXpcallByDefault;
    return v11;
end;
v2.popNode = function(v15) --[[ Line: 93 ]] --[[ Name: popNode ]]
    assert(#v15.nodeStack > 0, "Tried to pop from an empty node stack!");
    return table.remove(v15.nodeStack, #v15.nodeStack);
end;
return v2;