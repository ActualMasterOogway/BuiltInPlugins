local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v1) --[[ Line: 3 ]] --[[ Name: fixMeshPartAccessory ]]
    -- upvalues: l_UGCValidationService_0 (copy)
    if v1 then
        local l_Handle_0 = v1:FindFirstChild("Handle");
        if l_Handle_0 and l_Handle_0:IsA("MeshPart") then
            l_UGCValidationService_0:ResetCollisionFidelity(l_Handle_0);
        end;
    end;
end;