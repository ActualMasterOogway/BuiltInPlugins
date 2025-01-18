local _ = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
return function(v2) --[[ Line: 5 ]] --[[ Name: createHashFromMeshParts ]]
    -- upvalues: l_TextureGenerationService_0 (copy)
    local l_l_TextureGenerationService_0_PartGroup_0 = l_TextureGenerationService_0:CreatePartGroup(v2);
    return l_l_TextureGenerationService_0_PartGroup_0 and l_l_TextureGenerationService_0_PartGroup_0:GetMeshIdsHash() or "";
end;