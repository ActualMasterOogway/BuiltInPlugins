local v0 = {
    Vector3.new(0, 0, 0, 0), 
    Vector3.new(-1, -1, -1, 0), 
    Vector3.new(1, -1, -1, 0), 
    Vector3.new(-1, 1, -1, 0), 
    Vector3.new(1, 1, -1, 0), 
    Vector3.new(-1, -1, 1, 0), 
    Vector3.new(1, -1, 1, 0), 
    Vector3.new(-1, 1, 1, 0), 
    Vector3.new(1, 1, 1, 0), 
    Vector3.new(-1, 0, 0, 0), 
    Vector3.new(1, 0, 0, 0), 
    Vector3.new(0, -1, 0, 0), 
    Vector3.new(0, 1, 0, 0), 
    Vector3.new(0, 0, -1, 0), 
    Vector3.new(0, 0, 1, 0), 
    Vector3.new(1, 1, 0, 0), 
    Vector3.new(-1, 1, 0, 0), 
    Vector3.new(-1, -1, 0, 0), 
    Vector3.new(1, -1, 0, 0), 
    Vector3.new(0, 1, 1, 0), 
    Vector3.new(0, -1, 1, 0), 
    Vector3.new(0, -1, -1, 0), 
    Vector3.new(0, 1, -1, 0), 
    Vector3.new(1, 0, 1, 0), 
    Vector3.new(-1, 0, 1, 0), 
    Vector3.new(-1, 0, -1, 0), 
    (Vector3.new(1, 0, -1, 0))
};
local function v7(v1, v2) --[[ Line: 38 ]] --[[ Name: computeSnapPointsForBounds ]]
    -- upvalues: v0 (copy)
    local v3 = v2 / 2;
    local v4 = {};
    for _, v6 in ipairs(v0) do
        table.insert(v4, v1 * CFrame.new(v6 * v3));
    end;
    return v4;
end;
return function(v8) --[[ Line: 47 ]]
    -- upvalues: v7 (copy)
    if not v8 then
        return {};
    elseif v8:IsA("BasePart") then
        return (v7(v8.CFrame, v8.Size));
    elseif v8:IsA("Model") then
        return (v7(v8:GetBoundingBox()));
    else
        return {};
    end;
end;