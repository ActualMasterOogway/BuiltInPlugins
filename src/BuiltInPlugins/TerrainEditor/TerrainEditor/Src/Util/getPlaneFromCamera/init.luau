local l_Workspace_0 = game:GetService("Workspace");
return function() --[[ Line: 3 ]] --[[ Name: getPlaneFromCamera ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_CFrame_0 = l_Workspace_0.CurrentCamera.CFrame;
    return CFrame.Angles(1.5707963267948966, 0, 0) + (l_CFrame_0.Position + l_CFrame_0.LookVector * 64);
end;