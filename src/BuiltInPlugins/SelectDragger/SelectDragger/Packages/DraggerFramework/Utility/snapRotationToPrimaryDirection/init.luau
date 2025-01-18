local _ = script.Parent.Parent;
local v1 = {
    Vector3.new(1, 0, 0, 0), 
    Vector3.new(-1, 0, 0, 0), 
    Vector3.new(0, 1, 0, 0), 
    Vector3.new(0, -1, 0, 0), 
    Vector3.new(0, 0, 1, 0), 
    (Vector3.new(0, 0, -1, 0))
};
local function _(v2) --[[ Line: 12 ]] --[[ Name: largestComponent ]]
    return (math.max(math.abs(v2.X), math.abs(v2.Y), (math.abs(v2.Z))));
end;
local function v10(v4) --[[ Line: 16 ]] --[[ Name: snapVectorToPrimaryDirection ]]
    -- upvalues: v1 (copy)
    local v5 = -1e999;
    local l_v4_0 = v4;
    for _, v8 in ipairs(v1) do
        local v9 = v4:Dot(v8);
        if v5 < v9 then
            v5 = v9;
            l_v4_0 = v8;
        end;
    end;
    return l_v4_0;
end;
return function(v11) --[[ Line: 31 ]]
    -- upvalues: v10 (copy)
    local l_RightVector_0 = v11.RightVector;
    local l_UpVector_0 = v11.UpVector;
    local v14 = -v11.LookVector;
    local l_l_RightVector_0_0 = l_RightVector_0;
    local v16 = math.max(math.abs(l_l_RightVector_0_0.X), math.abs(l_l_RightVector_0_0.Y), (math.abs(l_l_RightVector_0_0.Z)));
    local l_l_UpVector_0_0 = l_UpVector_0;
    l_l_RightVector_0_0 = math.max(math.abs(l_l_UpVector_0_0.X), math.abs(l_l_UpVector_0_0.Y), (math.abs(l_l_UpVector_0_0.Z)));
    l_l_UpVector_0_0 = math.max(math.abs(v14.X), math.abs(v14.Y), (math.abs(v14.Z)));
    if l_l_RightVector_0_0 < v16 and l_l_UpVector_0_0 < v16 then
        l_RightVector_0 = v10(l_RightVector_0);
        l_UpVector_0 = if l_l_UpVector_0_0 < l_l_RightVector_0_0 then v10(l_UpVector_0) else v10(v14):Cross(l_RightVector_0).Unit;
    elseif l_l_UpVector_0_0 < l_l_RightVector_0_0 then
        l_UpVector_0 = v10(l_UpVector_0);
        l_RightVector_0 = if l_l_UpVector_0_0 < v16 then v10(l_RightVector_0) else l_UpVector_0:Cross((v10(v14))).Unit;
    else
        local v18 = v10(v14);
        if l_l_RightVector_0_0 < v16 then
            l_RightVector_0 = v10(l_RightVector_0);
            l_UpVector_0 = v18:Cross(l_RightVector_0).Unit;
        else
            l_UpVector_0 = v10(l_UpVector_0);
            l_RightVector_0 = l_UpVector_0:Cross(v18).Unit;
        end;
    end;
    return CFrame.fromMatrix(Vector3.new(), l_RightVector_0, l_UpVector_0);
end;