local l_InsertService_0 = game:GetService("InsertService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.BoundingBoxUtils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
return function(v7, v8, v9, v10) --[[ Line: 14 ]] --[[ Name: addPlatform ]]
    -- upvalues: l_InsertService_0 (copy), v2 (copy), v6 (copy), v5 (copy), v3 (copy)
    local v11 = l_InsertService_0:LoadLocalAsset(v2.PEDESTAL_PATH);
    local function v21() --[[ Line: 22 ]] --[[ Name: updatePlatformPosition ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (copy), v2 (ref), v9 (copy), v11 (copy), v3 (ref)
        if v6() and v5() then
            local l_Humanoid_0 = v8:FindFirstChildWhichIsA("Humanoid");
            if l_Humanoid_0 ~= nil then
                assert(l_Humanoid_0:IsA("Humanoid"), v2.LUAU_ANALYZE_ERROR);
                local v13 = -l_Humanoid_0.HipHeight - v8.PrimaryPart.Size.Y * 0.5 - v9 * 0.5;
                v11.CFrame = v8.PrimaryPart.CFrame * CFrame.new(0, v13, 0);
                return;
            else
                local l_v8_BoundingBox_0, v15 = v8:GetBoundingBox();
                local v16 = v3.axisAlignedBoxSize(l_v8_BoundingBox_0, v15);
                v11.CFrame = CFrame.new(l_v8_BoundingBox_0.Position + Vector3.new(0, -v16.Y / 2 - v9 * 0.5, 0));
                return;
            end;
        else
            local l_v8_Pivot_0 = v8:GetPivot();
            local v18 = CFrame.new(l_v8_Pivot_0.Position - v8.PrimaryPart.Position) * l_v8_Pivot_0.Rotation;
            if not l_v8_Pivot_0.Position:FuzzyEq(v18.Position) then
                v8:PivotTo(v18);
            end;
            if v5() then
                local l_Humanoid_1 = v8:FindFirstChildWhichIsA("Humanoid");
                local v20 = 0;
                if l_Humanoid_1 ~= nil then
                    assert(l_Humanoid_1:IsA("Humanoid"), v2.LUAU_ANALYZE_ERROR);
                    v20 = v20 - l_Humanoid_1.HipHeight;
                end;
                v20 = v20 - v8.PrimaryPart.Size.Y * 0.5 - v9 * 0.5;
                v11.CFrame = CFrame.new(v8.PrimaryPart.Position.X, v20, v8.PrimaryPart.Position.Z);
                return;
            else
                v11.CFrame = CFrame.new(v8.PrimaryPart.Position.X, 0 - (v8.Humanoid.HipHeight + v8.PrimaryPart.Size.Y * 0.5) - v9 * 0.5, v8.PrimaryPart.Position.Z);
                return;
            end;
        end;
    end;
    v11.Size = Vector3.new(v10, v9, v10);
    v21();
    v11.Parent = v7;
    local v22 = task.spawn(function() --[[ Line: 82 ]]
        -- upvalues: v21 (copy)
        while true do
            v21();
            task.wait();
        end;
    end);
    local v23 = nil;
    local function v24() --[[ Line: 91 ]] --[[ Name: cleanup ]]
        -- upvalues: v23 (ref), v22 (copy)
        v23:Disconnect();
        task.cancel(v22);
    end;
    v23 = v8.Destroying:Connect(v24);
    return v24;
end;