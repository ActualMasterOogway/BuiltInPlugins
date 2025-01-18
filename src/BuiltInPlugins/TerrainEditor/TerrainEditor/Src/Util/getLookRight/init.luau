local l_Workspace_0 = game:GetService("Workspace");
return function() --[[ Line: 3 ]] --[[ Name: getLookRight ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_RightVector_0 = l_Workspace_0.CurrentCamera.CFrame.RightVector;
    if math.abs(l_RightVector_0.X) > math.abs(l_RightVector_0.Z) then
        if l_RightVector_0.X < 0 then
            return (Vector3.new(-1, 0, 0, 0));
        else
            return (Vector3.new(1, 0, 0, 0));
        end;
    elseif l_RightVector_0.Z < 0 then
        return (Vector3.new(0, 0, -1, 0));
    else
        return (Vector3.new(0, 0, 1, 0));
    end;
end;