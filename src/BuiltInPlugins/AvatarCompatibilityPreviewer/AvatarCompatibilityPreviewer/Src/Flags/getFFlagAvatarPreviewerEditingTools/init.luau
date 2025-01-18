local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
game:DefineFastFlag("AvatarPreviewerEditingTools_Dev", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("AvatarPreviewerEditingTools_Dev") and v1();
end;