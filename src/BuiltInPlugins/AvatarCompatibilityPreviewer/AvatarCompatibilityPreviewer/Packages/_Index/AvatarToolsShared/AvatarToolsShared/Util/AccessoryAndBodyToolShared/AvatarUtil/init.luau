local _ = script.Parent.Parent.Parent;
local v1 = {};
local function _(v2) --[[ Line: 12 ]] --[[ Name: getExents ]]
    if v2:IsA("BasePart") then
        return v2.Size;
    elseif v2:IsA("Model") then
        return v2:GetExtentsSize();
    else
        return;
    end;
end;
v1.getRootPart = function(_, v5) --[[ Line: 20 ]] --[[ Name: getRootPart ]]
    if not v5 then
        return;
    elseif v5.PrimaryPart then
        return v5.PrimaryPart;
    else
        return v5:FindFirstChild("HumanoidRootPart");
    end;
end;
v1.getRootCFrame = function(v6, v7) --[[ Line: 31 ]] --[[ Name: getRootCFrame ]]
    local v8 = v6:getRootPart(v7);
    if v8 then
        return v8.CFrame;
    else
        return CFrame.new();
    end;
end;
v1.positionAvatarNextTo = function(v9, v10, v11, v12, v13) --[[ Line: 40 ]] --[[ Name: positionAvatarNextTo ]]
    if v11 and v10 then
        local v14 = if v11:IsA("BasePart") then v11.Size else if v11:IsA("Model") then v11:GetExtentsSize() else nil;
        local l_v10_ExtentsSize_0 = v10:GetExtentsSize();
        local v16 = nil;
        v16 = if v11:IsA("BasePart") then v11.CFrame else v9:getRootPart(v11).CFrame;
        local l_Position_0 = v16.Position;
        l_Position_0 = (v16 - v16.Position) * (l_Position_0 - Vector3.new(v14.X, 0, 0) - Vector3.new(l_v10_ExtentsSize_0.X, 0, 0));
        do
            local l_l_Position_0_0 = l_Position_0;
            if v12 then
                task.spawn(function() --[[ Line: 57 ]]
                    -- upvalues: v10 (copy), l_l_Position_0_0 (ref), v13 (copy)
                    v10:MoveTo(l_l_Position_0_0);
                    task.wait();
                    if v13 then
                        v13();
                    end;
                end);
            else
                v10:SetPrimaryPartCFrame(CFrame.new(l_l_Position_0_0));
            end;
        end;
    end;
end;
v1.bringAvatarToView = function(v19, v20, v21) --[[ Line: 70 ]] --[[ Name: bringAvatarToView ]]
    local l_Camera_0 = game.workspace:FindFirstChildOfClass("Camera");
    if l_Camera_0 then
        local v23 = if v20:IsA("BasePart") then v20.Size else if v20:IsA("Model") then v20:GetExtentsSize() else nil;
        local v24 = l_Camera_0.CFrame.Position + l_Camera_0.CFrame.LookVector * (v23.X * 2);
        task.spawn(function() --[[ Line: 75 ]]
            -- upvalues: v20 (copy), v24 (copy), l_Camera_0 (copy), v19 (copy), v21 (copy)
            v20:MoveTo(v24);
            task.wait();
            local l_p_0 = v20:GetPrimaryPartCFrame().p;
            local v26 = l_p_0 - l_Camera_0.CFrame.p;
            local l_Unit_0 = (Vector3.new(1, 0, 1, 0) * v26).Unit;
            local l_yAxis_0 = Vector3.yAxis;
            if l_Unit_0:FuzzyEq(l_yAxis_0) then
                l_yAxis_0 = Vector3.xAxis;
            end;
            local v29 = l_yAxis_0:Cross(l_Unit_0);
            v20:SetPrimaryPartCFrame(CFrame.fromMatrix(l_p_0, v29, l_yAxis_0, l_Unit_0));
            v19:focusCameraOnAvatar(v20);
            if v21 then
                v21();
            end;
        end);
    end;
end;
v1.focusCameraOnAvatar = function(v30, v31) --[[ Line: 97 ]] --[[ Name: focusCameraOnAvatar ]]
    local l_Camera_1 = game.workspace:FindFirstChildOfClass("Camera");
    if l_Camera_1 then
        local v33 = if v31:IsA("BasePart") then v31.Size else if v31:IsA("Model") then v31:GetExtentsSize() else nil;
        local v34 = math.max(v33.X, v33.Z);
        local v35 = v30:getRootPart(v31);
        if v33 and v35 then
            local l_CFrame_0 = v35.CFrame;
            local v37 = l_CFrame_0.Position + l_CFrame_0.LookVector * (v34 * 2);
            l_Camera_1.CFrame = CFrame.new(v37, l_CFrame_0.Position);
            l_Camera_1.Focus = l_CFrame_0;
        end;
    end;
end;
return v1;