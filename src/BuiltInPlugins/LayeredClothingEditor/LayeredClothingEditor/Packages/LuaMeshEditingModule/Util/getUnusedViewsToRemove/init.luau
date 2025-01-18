local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for v5, _ in pairs(v2) do
        if not v3[v5] then
            for v7 in ipairs(v2.meshName) do
                table.insert(v4, {
                    MeshName = v5, 
                    Index = v7
                });
            end;
        elseif v1() then
            for v8 in v2[v5] do
                if v3[v5][v8] == nil then
                    table.insert(v4, {
                        MeshName = v5, 
                        Index = v8
                    });
                end;
            end;
        else
            for v9 = #v3[v5] + 1, #v2[v5] do
                table.insert(v4, {
                    MeshName = v5, 
                    Index = v9
                });
            end;
        end;
    end;
    return v4;
end;