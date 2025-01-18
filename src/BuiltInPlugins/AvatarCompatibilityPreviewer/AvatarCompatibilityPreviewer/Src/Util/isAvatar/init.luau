local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_Workspace_0 = game:GetService("Workspace");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoSetupMissingDynamicHeadAllowed);
local function _(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: foundAndIs ]]
    local l_v5_FirstChild_0 = v5:FindFirstChild(v6);
    if l_v5_FirstChild_0 == nil then
        return nil;
    elseif not l_v5_FirstChild_0:IsA(v7) then
        return nil;
    elseif not l_v5_FirstChild_0.Archivable then
        return nil;
    else
        return l_v5_FirstChild_0;
    end;
end;
return function(v10) --[[ Line: 28 ]] --[[ Name: isAvatar ]]
    -- upvalues: v3 (copy), l_Workspace_0 (copy), v4 (copy), v2 (copy)
    if not v10.Archivable then
        return false;
    elseif not v10:IsA("Model") then
        return false;
    elseif not v10:IsDescendantOf(game) then
        return false;
    elseif v3() and not v10:IsDescendantOf(l_Workspace_0) then
        return false;
    elseif v10.PrimaryPart == nil or not v10.PrimaryPart.Archivable then
        return false;
    else
        if v3() and v4() then
            local l_Head_0 = v10:FindFirstChild("Head");
            if l_Head_0 == nil or not l_Head_0:IsA("BasePart") then
                return false;
            elseif not l_Head_0:FindFirstChildWhichIsA("FaceControls") then
                return false;
            end;
        end;
        for _, v13 in v2.LIMBS do
            local l_v10_FirstChild_0 = v10:FindFirstChild(v13);
            if not if l_v10_FirstChild_0 == nil then nil else if l_v10_FirstChild_0:IsA("BasePart") then if l_v10_FirstChild_0.Archivable then l_v10_FirstChild_0 else nil else nil then
                return false;
            end;
        end;
        local l_Humanoid_0 = v10:FindFirstChild("Humanoid");
        if (if l_Humanoid_0 == nil then nil else if l_Humanoid_0:IsA("Humanoid") then if l_Humanoid_0.Archivable then l_Humanoid_0 else nil else nil) == nil then
            return false;
        else
            return true;
        end;
    end;
end;