local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v2 = require(l_Modules_0.NpcManager);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v4 = require(l_AnimationConversion_0.resetCharacter);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetWorldModels);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local function v15(...) --[[ Line: 13 ]] --[[ Name: wrapInWorldModels ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    local v7 = {
        ...
    };
    local v8 = {};
    for _, v10 in v7 do
        local l_WorldModel_0 = Instance.new("WorldModel");
        l_WorldModel_0.Parent = l_RobloxReplicatedStorage_0;
        v10.Parent = l_WorldModel_0;
        table.insert(v8, v10);
    end;
    task.wait();
    for _, v13 in v8 do
        v13.PrimaryPart = v13:FindFirstChild("HumanoidRootPart") or v13:FindFirstChild("Torso");
        if v13.PrimaryPart then
            v13:SetPrimaryPartCFrame(CFrame.new(0, 0, 0));
        else
            v13:MoveTo((Vector3.new(0, 0, 0, 0)));
        end;
        local l_Parent_0 = v13.Parent;
        l_Parent_0:MoveTo((Vector3.new(0, 0, 0, 0)));
        l_Parent_0.Parent = nil;
    end;
end;
local function v19(v16) --[[ Line: 40 ]] --[[ Name: clearProxyReference ]]
    for _, v18 in v16:GetDescendants() do
        if v18:IsA("ModuleScript") and v18.Name == "SetupAdapterParts" then
            v18:ClearAllChildren();
        end;
    end;
end;
return function(v20, v21) --[[ Line: 48 ]]
    -- upvalues: v2 (copy), v19 (copy), v15 (copy), v4 (copy), v5 (copy)
    return function(v22) --[[ Line: 49 ]]
        -- upvalues: v20 (copy), v21 (copy), v2 (ref), v19 (ref), v15 (ref), v4 (ref), v5 (ref)
        if v22:getState().CharacterConversion.worldModels[v20] then
            return;
        else
            local v23 = v21:Clone();
            local v24 = v21:Clone();
            v2.ConvertR6ToR15(v24);
            v19(v24);
            local v25 = v23:Clone();
            local v26 = v24:Clone();
            v15(v23, v24, v25, v26);
            v4(v25);
            v4(v26);
            v22:dispatch(v5(v20, v23.Parent, v24.Parent, v25.Parent, v26.Parent));
            return;
        end;
    end;
end;