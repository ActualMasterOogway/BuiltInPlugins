local function v4(v0) --[[ Line: 6 ]] --[[ Name: getNormalId ]]
    local v1 = math.abs(v0.X);
    local v2 = math.abs(v0.Y);
    local v3 = math.abs(v0.Z);
    if v2 < v1 and v3 < v1 then
        return v0.X > 0 and Enum.NormalId.Right or Enum.NormalId.Left;
    elseif v3 < v2 then
        return v0.Y > 0 and Enum.NormalId.Top or Enum.NormalId.Bottom;
    else
        return v0.Z > 0 and Enum.NormalId.Back or Enum.NormalId.Front;
    end;
end;
return function(v5, v6) --[[ Line: 19 ]] --[[ Name: getFaceInstance ]]
    -- upvalues: v4 (copy)
    local v7 = v5.CFrame:PointToObjectSpace(v6) / v5.Size * 2;
    local v8 = v4(v7);
    for _, v10 in pairs(v5:GetChildren()) do
        if v10:IsA("FaceInstance") and v10.Face == v8 then
            return v10;
        end;
    end;
    return nil;
end;