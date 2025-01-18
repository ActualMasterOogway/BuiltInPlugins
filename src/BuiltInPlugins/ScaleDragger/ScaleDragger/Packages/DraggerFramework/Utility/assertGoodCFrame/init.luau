return function(v0) --[[ Line: 19 ]]
    local l_v0_Components_0, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12 = v0:GetComponents();
    if l_v0_Components_0 ~= l_v0_Components_0 or v2 ~= v2 or v3 ~= v3 or v4 ~= v4 or v5 ~= v5 or v6 ~= v6 or v7 ~= v7 or v8 ~= v8 or v9 ~= v9 or v10 ~= v10 or v11 ~= v11 or v12 ~= v12 then
        error("Bad CFrame: " .. tostring(v0));
    end;
    if math.abs(l_v0_Components_0) + math.abs(v2) + math.abs(v3) > 30000 then
        error("Big CFrame: " .. tostring(v0));
    end;
    local l_RightVector_0 = v0.RightVector;
    local l_UpVector_0 = v0.UpVector;
    local l_LookVector_0 = v0.LookVector;
    if math.abs((l_RightVector_0:Dot(l_UpVector_0))) > 0.001 or math.abs((l_UpVector_0:Dot(l_LookVector_0))) > 0.001 or math.abs((l_LookVector_0:Dot(l_RightVector_0))) > 0.001 then
        error("Non orthogonal CFrame: " .. tostring(v0));
    end;
    if math.abs(1 - l_RightVector_0.Magnitude) > 0.001 or math.abs(1 - l_UpVector_0.Magnitude) > 0.001 or math.abs(1 - l_LookVector_0.Magnitude) > 0.001 then
        error("Non unitary units: " .. tostring(v0));
    end;
end;