local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagNoHashingScalingValues);
local v6 = {};
v6.clearTestingAvatars = function() --[[ Line: 23 ]] --[[ Name: clearTestingAvatars ]]
    -- upvalues: l_StarterPlayer_0 (copy), v4 (copy), v6 (copy)
    for _, v8 in l_StarterPlayer_0:GetChildren() do
        if v8:GetAttribute("RBX_AvatarPreviewer_TestingAvatar") then
            v8:Destroy();
        end;
    end;
    if v4() then
        v6._clearTestingAnimateScripts();
    end;
end;
v6._clearTestingAnimateScripts = function() --[[ Line: 35 ]] --[[ Name: _clearTestingAnimateScripts ]]
    -- upvalues: v4 (copy), l_StarterPlayer_0 (copy)
    assert(v4(), "FFlagAvatarPreviewerUseAnyModel is not enabled");
    local l_StarterCharacterScripts_0 = l_StarterPlayer_0:FindFirstChildWhichIsA("StarterCharacterScripts");
    if l_StarterCharacterScripts_0 == nil then
        return;
    else
        for _, v11 in l_StarterCharacterScripts_0:GetChildren() do
            if v11:GetAttribute("RBX_AvatarPreviewer_TestingAnimateScript") then
                v11:Destroy();
            end;
        end;
        return;
    end;
end;
v6.reset = function() --[[ Line: 50 ]] --[[ Name: reset ]]
    -- upvalues: v6 (copy), l_StarterPlayer_0 (copy), v4 (copy)
    v6.clearTestingAvatars();
    local l_StarterCharacter_Backup_0 = l_StarterPlayer_0:FindFirstChild("StarterCharacter_Backup");
    if l_StarterCharacter_Backup_0 ~= nil and l_StarterCharacter_Backup_0:GetAttribute("RBX_AvatarPreview_TestingBackup") then
        l_StarterCharacter_Backup_0.Name = "StarterCharacter";
        l_StarterCharacter_Backup_0:SetAttribute("RBX_AvatarPreview_TestingBackup", nil);
    end;
    if v4() then
        v6._resetAnimateScript();
    end;
end;
v6._resetAnimateScript = function() --[[ Line: 64 ]] --[[ Name: _resetAnimateScript ]]
    -- upvalues: v4 (copy), l_StarterPlayer_0 (copy)
    assert(v4(), "FFlagAvatarPreviewerUseAnyModel is not enabled");
    local l_StarterCharacterScripts_1 = l_StarterPlayer_0:FindFirstChildWhichIsA("StarterCharacterScripts");
    if l_StarterCharacterScripts_1 == nil then
        return;
    else
        local l_Animate_Backup_0 = l_StarterCharacterScripts_1:FindFirstChild("Animate_Backup");
        if l_Animate_Backup_0 == nil or not l_Animate_Backup_0:IsA("LocalScript") then
            return;
        elseif not l_Animate_Backup_0:GetAttribute("RBX_AvatarPreview_TestingBackup") then
            return;
        else
            l_Animate_Backup_0.Name = "Animate";
            l_Animate_Backup_0:SetAttribute("RBX_AvatarPreview_TestingBackup", nil);
            if l_Animate_Backup_0:IsA("LocalScript") then
                local l_l_Animate_Backup_0_Attribute_0 = l_Animate_Backup_0:GetAttribute("RBX_AvatarPreview_WasEnabled");
                l_Animate_Backup_0:SetAttribute("RBX_AvatarPreview_WasEnabled", nil);
                if l_l_Animate_Backup_0_Attribute_0 then
                    l_Animate_Backup_0.Enabled = true;
                end;
            end;
            return;
        end;
    end;
end;
v6._replaceAnimateScript = function(v16) --[[ Line: 94 ]] --[[ Name: _replaceAnimateScript ]]
    -- upvalues: v4 (copy), l_StarterPlayer_0 (copy)
    assert(v4(), "FFlagAvatarPreviewerUseAnyModel is not enabled");
    local l_StarterCharacterScripts_2 = l_StarterPlayer_0:FindFirstChildWhichIsA("StarterCharacterScripts");
    if l_StarterCharacterScripts_2 == nil then
        return;
    else
        local l_Animate_0 = v16:FindFirstChild("Animate");
        if not l_Animate_0 then
            return;
        else
            local l_Animate_1 = l_StarterCharacterScripts_2:FindFirstChild("Animate");
            if l_Animate_1 and l_Animate_1:IsA("LocalScript") then
                l_Animate_1.Name = "Animate_Backup";
                l_Animate_1:SetAttribute("RBX_AvatarPreview_TestingBackup", true);
                l_Animate_1:SetAttribute("RBX_AvatarPreview_WasEnabled", l_Animate_1.Enabled);
                l_Animate_1.Enabled = false;
            end;
            local v20 = l_Animate_0:Clone();
            v20:SetAttribute("RBX_AvatarPreviewer_TestingAnimateScript", true);
            v20.Parent = l_StarterCharacterScripts_2;
            return;
        end;
    end;
end;
local function _(v21, v22) --[[ Line: 120 ]] --[[ Name: replaceWalkSpeedValues ]]
    local l_Humanoid_0 = v21:FindFirstChildOfClass("Humanoid");
    local l_Humanoid_1 = v22.WorldModel:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 == nil or l_Humanoid_1 == nil then
        return;
    else
        l_Humanoid_0.WalkSpeed = l_Humanoid_1.WalkSpeed;
        l_Humanoid_0.JumpHeight = l_Humanoid_1.JumpHeight;
        l_Humanoid_0.JumpPower = l_Humanoid_1.JumpPower;
        l_Humanoid_0.NameDisplayDistance = l_Humanoid_1.NameDisplayDistance;
        l_Humanoid_0.HealthDisplayDistance = l_Humanoid_1.HealthDisplayDistance;
        return;
    end;
end;
v6.test = function(v26, v27, v28) --[[ Line: 135 ]] --[[ Name: test ]]
    -- upvalues: v6 (copy), l_StarterPlayer_0 (copy), v4 (copy), v5 (copy)
    v6.clearTestingAvatars();
    local l_StarterCharacter_0 = l_StarterPlayer_0:FindFirstChild("StarterCharacter");
    if l_StarterCharacter_0 ~= nil then
        l_StarterCharacter_0.Name = "StarterCharacter_Backup";
        l_StarterCharacter_0:SetAttribute("RBX_AvatarPreview_TestingBackup", true);
    end;
    local v30 = v27:Clone();
    v30:SetAttribute("RBX_AvatarPreviewer_TestingAvatar", true);
    v30.Name = "StarterCharacter";
    v30.Parent = l_StarterPlayer_0;
    if v4() then
        v6._replaceAnimateScript(v27);
    end;
    if v5() then
        local l_Humanoid_2 = v30:FindFirstChildOfClass("Humanoid");
        local l_Humanoid_3 = v28.WorldModel:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_2 ~= nil and l_Humanoid_3 ~= nil then
            l_Humanoid_2.WalkSpeed = l_Humanoid_3.WalkSpeed;
            l_Humanoid_2.JumpHeight = l_Humanoid_3.JumpHeight;
            l_Humanoid_2.JumpPower = l_Humanoid_3.JumpPower;
            l_Humanoid_2.NameDisplayDistance = l_Humanoid_3.NameDisplayDistance;
            l_Humanoid_2.HealthDisplayDistance = l_Humanoid_3.HealthDisplayDistance;
        end;
    end;
    v26.startPlaySolo();
end;
v6.DEPRECATED_test = function(v33, v34) --[[ Line: 166 ]] --[[ Name: DEPRECATED_test ]]
    -- upvalues: v6 (copy), l_StarterPlayer_0 (copy)
    v6.clearTestingAvatars();
    local l_StarterCharacter_1 = l_StarterPlayer_0:FindFirstChild("StarterCharacter");
    if l_StarterCharacter_1 ~= nil then
        l_StarterCharacter_1.Name = "StarterCharacter_Backup";
        l_StarterCharacter_1:SetAttribute("RBX_AvatarPreview_TestingBackup", true);
    end;
    local v36 = v34.WorldModel:Clone();
    v36:SetAttribute("RBX_AvatarPreviewer_TestingAvatar", true);
    v36.Name = "StarterCharacter";
    v36.Parent = l_StarterPlayer_0;
    v33.startPlaySolo();
end;
return v6;