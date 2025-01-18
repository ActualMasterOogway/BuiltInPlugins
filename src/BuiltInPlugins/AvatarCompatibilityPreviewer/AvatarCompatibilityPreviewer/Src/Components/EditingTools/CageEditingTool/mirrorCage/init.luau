local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Packages._Index.LuaMeshEditingModule.LuaMeshEditingModule.Types);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.CageEditingTool.findWrapTargetWithName);
return function(v4, v5, v6) --[[ Line: 13 ]] --[[ Name: mirrorCage ]]
    -- upvalues: v3 (copy)
    local v7 = {};
    local v8 = {};
    local function v12(v9) --[[ Line: 21 ]] --[[ Name: verticesOfTarget ]]
        -- upvalues: v7 (copy), v3 (ref), v4 (copy)
        if v7[v9] ~= nil then
            return v7[v9];
        else
            local v10 = v3(v4, v9);
            if v10 == nil then
                error((("Could not find %*"):format(v9)));
            end;
            assert(v10 ~= nil, "Luau");
            local l_v10_Vertices_0 = v10:GetVertices(Enum.CageType.Outer);
            v7[v9] = l_v10_Vertices_0;
            return table.freeze(l_v10_Vertices_0);
        end;
    end;
    local function _(v13) --[[ Line: 37 ]] --[[ Name: mutableVerticesOfTarget ]]
        -- upvalues: v8 (copy), v12 (copy)
        if v8[v13] ~= nil then
            return v8[v13];
        else
            local v14 = table.clone(v12(v13));
            v8[v13] = v14;
            return v14;
        end;
    end;
    local function _(v16, v17) --[[ Line: 47 ]] --[[ Name: reflectPointThroughPlane ]]
        return v16 - 2 * (v16:Dot(v17) / v17:Dot(v17)) * v17;
    end;
    local l_CFrame_0 = v4.PrimaryPart.CFrame;
    local l_RightVector_0 = l_CFrame_0.RightVector;
    for v21, v22 in v5 do
        local v23 = v12(v21);
        local v24 = v3(v4, v21);
        if v24 ~= nil then
            local l_CageOriginWorld_0 = v24.CageOriginWorld;
            for v26, v27 in v22 do
                for _, v29 in v27 do
                    if v29.side == v6 then
                        local l_targetName_0 = v29.targetName;
                        local v31;
                        if v8[l_targetName_0] ~= nil then
                            v31 = v8[l_targetName_0];
                        else
                            local v32 = table.clone(v12(l_targetName_0));
                            v8[l_targetName_0] = v32;
                            v31 = v32;
                        end;
                        l_targetName_0 = v3(v4, v29.targetName);
                        if l_targetName_0 ~= nil then
                            local l_CageOriginWorld_1 = l_targetName_0.CageOriginWorld;
                            local l_Position_0 = (l_CageOriginWorld_0:ToWorldSpace(CFrame.new(v23[v26])) - l_CFrame_0.Position).Position;
                            local v35 = l_Position_0 - 2 * (l_Position_0:Dot(l_RightVector_0) / l_RightVector_0:Dot(l_RightVector_0)) * l_RightVector_0 + l_CFrame_0.Position;
                            v31[v29.vertex] = l_CageOriginWorld_1:ToObjectSpace(CFrame.new(v35)).Position;
                            v8[v29.targetName] = v31;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v8;
end;