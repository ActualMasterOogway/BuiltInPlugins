local l_Players_0 = game:GetService("Players");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Src.Util.clearPrebakedDescriptionAnimations);
return function(_) --[[ Line: 7 ]]
    -- upvalues: l_StudioService_0 (copy), l_Players_0 (copy), v3 (copy)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_l_Players_0_HumanoidDescriptionFromUserId_0 = l_Players_0:GetHumanoidDescriptionFromUserId(l_l_StudioService_0_UserId_0);
    v3(l_l_Players_0_HumanoidDescriptionFromUserId_0);
    return l_l_Players_0_HumanoidDescriptionFromUserId_0;
end;