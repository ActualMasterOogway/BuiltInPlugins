local v0 = require(script.Parent.TestEnum);
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = {
        children = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.visitAllNodes = function(v3, v4, v5) --[[ Line: 30 ]] --[[ Name: visitAllNodes ]]
    v5 = v5 or v3;
    for _, v7 in ipairs(v5.children) do
        v4(v7);
        v3:visitAllNodes(v4, v7);
    end;
end;
local function v8(v9) --[[ Line: 40 ]] --[[ Name: constructNodeFullName ]]
    -- upvalues: v8 (copy)
    if v9.parent then
        local v10 = v8(v9.parent);
        if v10 then
            return v10 .. " " .. v9.phrase;
        end;
    end;
    return v9.phrase;
end;
v1.createNode = function(v11, v12, v13) --[[ Line: 53 ]] --[[ Name: createNode ]]
    -- upvalues: v0 (copy), v8 (copy)
    local v14 = v13 or v0.NodeModifier.None;
    return {
        phrase = v11, 
        type = v12, 
        modifier = v14, 
        children = {}, 
        callback = nil, 
        getFullName = v8
    };
end;
v1.visualize = function(v15, v16, v17) --[[ Line: 72 ]] --[[ Name: visualize ]]
    -- upvalues: v0 (copy)
    v16 = v16 or v15;
    v17 = v17 or 0;
    local v18 = {};
    for _, v20 in ipairs(v16.children) do
        if v20.type == v0.NodeType.It then
            table.insert(v18, (" "):rep(3 * v17) .. v20.phrase);
        else
            table.insert(v18, (" "):rep(3 * v17) .. v20.phrase);
        end;
        if #v20.children > 0 then
            table.insert(v18, (v15:visualize(v20, v17 + 1)));
        end;
    end;
    return table.concat(v18, "\n");
end;
v1.findNodes = function(v21, v22, v23, v24) --[[ Line: 98 ]] --[[ Name: findNodes ]]
    v24 = v24 or v21;
    v23 = v23 or {};
    for _, v26 in ipairs(v24.children) do
        if v22(v26) then
            table.insert(v23, v26);
        end;
        v21:findNodes(v22, v23, v26);
    end;
    return v23;
end;
return v1;