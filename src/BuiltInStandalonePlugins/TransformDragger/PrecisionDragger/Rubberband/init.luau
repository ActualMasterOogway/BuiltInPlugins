local v0 = require(script.Parent.Adornments);
local v1 = nil;
local v2 = {};
local v3 = {};
local v4 = false;
local v5 = nil;
local function v6(v7) --[[ Line: 14 ]] --[[ Name: findFirstCFrame ]]
    -- upvalues: v6 (copy)
    if v7:IsA("BasePart") then
        return v7.CFrame;
    else
        local l_v7_Children_0 = v7:GetChildren();
        for v9 = 1, #l_v7_Children_0 do
            local v10 = v6(l_v7_Children_0[v9]);
            if v10 then
                return v10;
            end;
        end;
        return nil;
    end;
end;
local function v11(v12, v13, v14, v15) --[[ Line: 28 ]] --[[ Name: findPartsInSelection ]]
    -- upvalues: v6 (copy), v11 (copy)
    local l_v12_Children_0 = v12:GetChildren();
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v18 = v15 or {};
    for _, v20 in ipairs(l_v12_Children_0) do
        local v21 = nil;
        local v22 = false;
        if v20:IsA("BasePart") then
            v21 = v20.CFrame.p;
            v22 = v20.Locked;
        elseif v20:IsA("Model") and not v20:IsA("Workspace") then
            v21 = if v20.PrimaryPart then v20:GetPrimaryPartCFrame().p else v20:GetModelCFrame().p;
            v22 = false;
        elseif v20:IsA("Tool") then
            v21 = v6(v20);
            if v21 then
                v21 = v21.p;
            end;
            v22 = false;
        elseif v20:IsA("Folder") then
            v11(v20, v13, v14, v18);
        end;
        if v21 and l_CurrentCamera_0.CoordinateFrame:pointToObjectSpace(v21).Z < 0 then
            local v23 = l_CurrentCamera_0:WorldToScreenPoint(v21);
            if not v22 and v23.X < math.max(v13.X, v14.X) and v23.X > math.min(v13.X, v14.X) and v23.Y < math.max(v13.Y, v14.Y) and v23.Y > math.min(v13.Y, v14.Y) then
                table.insert(v18, v20);
            end;
        end;
    end;
    return v18;
end;
local function v24() --[[ Line: 77 ]] --[[ Name: isRubberBandDragInProgress ]]
    -- upvalues: v4 (ref)
    return v4;
end;
startRubberbandDrag = function(v25) --[[ Line: 81 ]] --[[ Name: startRubberbandDrag ]]
    -- upvalues: v4 (ref), v0 (copy), v5 (ref), v3 (ref), v1 (ref), v2 (copy)
    v4 = true;
    v0.setPlaneVisibility(false);
    v5 = v25;
    v3 = {};
    if not v1 then
        v1 = Instance.new("ScreenGui", game:GetService("CoreGui"));
        v2[1] = Instance.new("Frame", v1);
        v2[1].BorderSizePixel = 0;
        v2[1].BackgroundColor3 = Color3.new(0, 0, 0);
        v2[2] = Instance.new("Frame", v1);
        v2[2].BorderSizePixel = 0;
        v2[2].BackgroundColor3 = Color3.new(0, 0, 0);
        v2[3] = Instance.new("Frame", v1);
        v2[3].BorderSizePixel = 0;
        v2[3].BackgroundColor3 = Color3.new(0, 0, 0);
        v2[4] = Instance.new("Frame", v1);
        v2[4].BorderSizePixel = 0;
        v2[4].BackgroundColor3 = Color3.new(0, 0, 0);
    end;
end;
finishRubberbandDrag = function() --[[ Line: 108 ]] --[[ Name: finishRubberbandDrag ]]
    -- upvalues: v4 (ref), v3 (ref), v5 (ref), v1 (ref)
    if not v4 then
        return;
    else
        v4 = false;
        game:GetService("Selection"):Set(v3);
        v5 = nil;
        if v1 then
            v1:Destroy();
            v1 = nil;
        end;
        return;
    end;
end;
updateRubberBand = function(v26) --[[ Line: 124 ]] --[[ Name: updateRubberBand ]]
    -- upvalues: v4 (ref), v5 (ref), v2 (copy), v3 (ref), v11 (copy)
    if not v4 then
        return;
    else
        local v27 = v26.X - v5.X;
        local v28 = v26.Y - v5.Y;
        v2[1].Size = UDim2.new(0, 2, 0, v28 + 2);
        v2[2].Size = UDim2.new(0, 2, 0, v28 + 2);
        v2[3].Size = UDim2.new(0, v27 + 2, 0, 2);
        v2[4].Size = UDim2.new(0, v27 + 2, 0, 2);
        v2[1].Position = UDim2.new(0, v5.X, 0, v5.Y);
        v2[2].Position = UDim2.new(0, v5.X + v27, 0, v5.Y);
        v2[3].Position = UDim2.new(0, v5.X, 0, v5.Y);
        v2[4].Position = UDim2.new(0, v5.X, 0, v5.Y + v28);
        v3 = v11(workspace, v5, v26);
        if #game:GetService("Selection"):Get() ~= #v3 then
            game:GetService("Selection"):Set(v3);
        end;
        return;
    end;
end;
return {
    isRubberBandDragInProgress = v24, 
    startRubberbandDrag = startRubberbandDrag, 
    finishRubberbandDrag = finishRubberbandDrag, 
    updateRubberBand = updateRubberBand
};