local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.VertexToolBase);
local v2 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v3 = setmetatable({}, {
    __index = v1
});
v3.__index = v3;
v3.new = function() --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v4 = setmetatable(v1.new(), v3);
    local l_addContext_0 = v4.addContext;
    local function _(v6, v7, v8) --[[ Line: 19 ]] --[[ Name: _checkPointVisited_DEPRECATED ]]
        return v6[v7] and v6[v7][v8];
    end;
    local function v17(v10, v11, v12, v13) --[[ Line: 24 ]] --[[ Name: _visitPoint_DEPRECATED ]]
        local v14 = v13[v11] and v13[v11][v12];
        if v14 then
            for _, v16 in ipairs(v14) do
                if not v10[v16.MeshName] then
                    v10[v16.MeshName] = {};
                end;
                v10[v16.MeshName][v16.Index] = true;
            end;
        end;
        if not v10[v11] then
            v10[v11] = {};
        end;
        v10[v11][v12] = true;
    end;
    v4.addContext = function(v18, v19) --[[ Line: 41 ]] --[[ Name: addContext ]]
        -- upvalues: v2 (ref), v4 (copy), v17 (copy), l_addContext_0 (copy)
        if not v19 then
            error("Could not add context: Context was nil.");
            return;
        else
            local v20 = nil;
            if v2() then
                v20 = v4:getDedupedPositionsFromContext(v19);
            else
                v20 = {
                    Positions = {}, 
                    Edges = {}
                };
                local v21 = v19:getVertexData();
                local v22 = v19:getSeamData();
                local v23 = {};
                for v24, v25 in pairs(v21) do
                    v20.Positions[v24] = {};
                    for v26, v27 in pairs(v25) do
                        if not (v23[v24] and v23[v24][v26]) then
                            v17(v23, v24, v26, v22);
                            v20.Positions[v24][v26] = v27;
                        end;
                    end;
                end;
            end;
            l_addContext_0(v18, v19, v20);
            return;
        end;
    end;
    v4.getVertexWeights = function(_) --[[ Line: 73 ]] --[[ Name: getVertexWeights ]]
        -- upvalues: v4 (copy)
        return v4:_getSelectedControlWeights();
    end;
    return v4;
end;
return v3;