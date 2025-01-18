local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
game:DefineFastFlag("AvatarPreviewerAddGeoToSelection", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("AvatarPreviewerAddGeoToSelection") and v1();
end;