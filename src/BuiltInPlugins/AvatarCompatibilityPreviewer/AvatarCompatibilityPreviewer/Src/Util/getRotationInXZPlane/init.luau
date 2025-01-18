return function(v0) --[[ Line: 6 ]] --[[ Name: getRotationInXZPlane ]]
    local _, _, _, _, _, v6, _, _, _, _, _, v12 = v0:GetComponents();
    local l_Unit_0 = Vector3.new(v6, 0, v12).Unit;
    if l_Unit_0 ~= l_Unit_0 then
        return v0;
    else
        local v14 = Vector3.new(0, 1, 0, 0):Cross(l_Unit_0);
        return CFrame.new(v0.X, v0.Y, v0.Z, v14.X, Vector3.new(0, 1, 0, 0).X, l_Unit_0.X, v14.Y, Vector3.new(0, 1, 0, 0).Y, l_Unit_0.Y, v14.Z, Vector3.new(0, 1, 0, 0).Z, l_Unit_0.Z);
    end;
end;