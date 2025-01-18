local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v4 = {
    getCageOrigin = function(v2, v3) --[[ Line: 14 ]] --[[ Name: getCageOrigin ]]
        -- upvalues: v1 (copy)
        if v2 == Enum.CageType.Inner and v3:IsA("WrapLayer") then
            if v1() then
                return (v3.Parent.CFrame:ToWorldSpace(v3.ReferenceOrigin));
            else
                return v3.ReferenceOrigin * v3.Parent.CFrame;
            end;
        elseif v2 == Enum.CageType.Outer and v3:IsA("BaseWrap") then
            if v1() then
                return (v3.Parent.CFrame:ToWorldSpace(v3.CageOrigin));
            else
                return v3.CageOrigin * v3.Parent.CFrame;
            end;
        else
            return CFrame.new();
        end;
    end
};
v4.getVerticesFromWrap = function(v5, v6) --[[ Line: 28 ]] --[[ Name: getVerticesFromWrap ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v7 = {};
    local _, l_result_0 = pcall(function() --[[ Line: 30 ]]
        -- upvalues: v7 (ref), v6 (copy), v5 (copy)
        v7 = v6:GetVertices(v5);
    end);
    if l_result_0 then
        print(l_result_0);
    end;
    if v1() then
        return v4.scaleVertices(v6, v7);
    else
        return v7;
    end;
end;
v4.getFacesForWrap = function(v10, v11) --[[ Line: 44 ]] --[[ Name: getFacesForWrap ]]
    local v12 = {};
    local _, l_result_1 = pcall(function() --[[ Line: 46 ]]
        -- upvalues: v12 (ref), v11 (copy), v10 (copy)
        v12 = v11:GetFaces(v10);
    end);
    if l_result_1 then
        print(l_result_1);
    end;
    return v12;
end;
v4.scaleVertices = function(v15, v16) --[[ Line: 55 ]] --[[ Name: scaleVertices ]]
    -- upvalues: v1 (copy), v4 (copy)
    assert(v1(), "Scaling vertices is only supported with getFFlagAvatarPreviewerCageEditingTools");
    local v17 = v4.getScaleFactor(v15);
    local l_CageOrigin_0 = v15.CageOrigin;
    local v19 = table.create(#v16);
    for v20, v21 in v16 do
        v19[v20] = l_CageOrigin_0:PointToObjectSpace(l_CageOrigin_0:PointToWorldSpace(v21) * v17);
    end;
    return v19;
end;
v4.unscaleVerticies = function(v22, v23) --[[ Line: 71 ]] --[[ Name: unscaleVerticies ]]
    -- upvalues: v1 (copy), v4 (copy)
    assert(v1(), "Scaling vertices is only supported with getFFlagAvatarPreviewerCageEditingTools");
    local v24 = 1 / v4.getScaleFactor(v22);
    local l_CageOrigin_1 = v22.CageOrigin;
    local v26 = table.create(#v23);
    for v27, v28 in v23 do
        v26[v27] = l_CageOrigin_1:PointToObjectSpace(l_CageOrigin_1:PointToWorldSpace(v28) * v24);
    end;
    return v26;
end;
v4.getScaleFactor = function(v29) --[[ Line: 87 ]] --[[ Name: getScaleFactor ]]
    -- upvalues: v1 (copy)
    assert(v1(), "Scaling vertices is only supported with getFFlagAvatarPreviewerCageEditingTools");
    local l_Parent_0 = v29.Parent;
    if l_Parent_0 == nil or not l_Parent_0:IsA("MeshPart") then
        return (Vector3.new(1, 1, 1, 0));
    else
        return l_Parent_0.Size / l_Parent_0.MeshSize;
    end;
end;
return v4;