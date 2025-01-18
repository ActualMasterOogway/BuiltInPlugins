local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.ConstantAvatar);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v6 = {};
    setmetatable(v6, v3);
    v6.r6 = v4:clone();
    v6.r6.Archivable = false;
    v6.r15 = v5:clone();
    v6.r15.Archivable = false;
    v6.rigs = {
        [v1.AvatarType.R6] = v6.r6, 
        [v1.AvatarType.R15] = v6.r15
    };
    v6.currentCharacter = v6.r15;
    v6.characterRoot = Instance.new("Folder");
    v6.characterRoot.Archivable = false;
    v6.characterRoot.Parent = game:GetService("StarterPlayer");
    v6.characterRoot.Name = "CharacterRoot";
    v6.r15:SetPrimaryPartCFrame(v6.r6.PrimaryPart.CFrame);
    game:GetService("StarterPlayer"):ClearDefaults();
    v6.r6.Parent = v6.characterRoot;
    v6.r6.Humanoid:CacheDefaults();
    v6.r6.Parent = nil;
    v6.r15.Parent = v6.characterRoot;
    v6.r15.Humanoid:CacheDefaults();
    v6.characterRoot.Parent = game.Workspace;
    return v6;
end;
v3.applyDescription = function(v7, v8) --[[ Line: 42 ]] --[[ Name: applyDescription ]]
    pcall(function() --[[ Line: 43 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7.currentCharacter.Humanoid:ApplyDescription(v8);
    end);
end;
v3.updateAvatarType = function(v9, v10) --[[ Line: 48 ]] --[[ Name: updateAvatarType ]]
    -- upvalues: v1 (copy), l_ReplicatedStorage_0 (copy)
    local v11 = v9.rigs[v10] ~= nil;
    if v9.rigs[v10] ~= v9.currentCharacter and v11 then
        local v12 = nil;
        local v13 = nil;
        if v10 == v1.AvatarType.R6 then
            v12 = v9.r6;
            v13 = v9.r15;
        else
            v12 = v9.r15;
            v13 = v9.r6;
        end;
        v12.Parent = v9.characterRoot;
        v13.Parent = l_ReplicatedStorage_0;
        v9.currentCharacter = v12;
        v9.currentCharacter.HumanoidRootPart.CFrame = v13.HumanoidRootPart.CFrame;
    end;
end;
v3.setPosition = function(v14, v15) --[[ Line: 69 ]] --[[ Name: setPosition ]]
    if v14.currentCharacter then
        v14.currentCharacter.HumanoidRootPart.CFrame = v15;
    end;
end;
v3.stop = function(v16) --[[ Line: 75 ]] --[[ Name: stop ]]
    v16.r6.Parent = nil;
    v16.r6:Destroy();
    v16.r6 = nil;
    v16.r15.Parent = nil;
    v16.r15:Destroy();
    v16.r15 = nil;
    v16.characterRoot.Parent = nil;
    v16.characterRoot:Destroy();
    v16.characterRoot = nil;
    game:GetService("StarterPlayer"):ClearDefaults();
end;
return v3;