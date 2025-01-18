local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
return function(v2, v3, _, v5) --[[ Line: 16 ]]
    -- upvalues: v1 (copy)
    if v5 and (not v1() or #v3 > 0) then
        local l_MeshName_0 = v3[#v3].MeshName;
        local v7 = v2.vertexEditingTool:getSelectablesForMesh(l_MeshName_0);
        for _, v9 in ipairs(v7) do
            table.insert(v3, v9.Selectable);
        end;
    end;
    return v3;
end;