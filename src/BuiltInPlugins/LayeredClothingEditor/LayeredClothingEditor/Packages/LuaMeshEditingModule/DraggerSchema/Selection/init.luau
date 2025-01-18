local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = setmetatable({}, v0);
    v2:setVertexToolBase(v1);
    return v2;
end;
v0.Set = function(v3, v4) --[[ Line: 12 ]] --[[ Name: Set ]]
    v3._vertexToolBase:setSelected(v4);
end;
v0.Get = function(v5) --[[ Line: 16 ]] --[[ Name: Get ]]
    return v5._vertexToolBase:getSelected();
end;
v0.setVertexToolBase = function(v6, v7) --[[ Line: 20 ]] --[[ Name: setVertexToolBase ]]
    v6._vertexToolBase = v7;
    v6.SelectionChanged = v7:getSelectionChangedSignal();
end;
v0.GetActiveInstance = function(_) --[[ Line: 25 ]] --[[ Name: GetActiveInstance ]]
    return nil;
end;
return v0;