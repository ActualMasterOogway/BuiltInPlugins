local l_Workspace_0 = game:GetService("Workspace");
return function(v1, v2, v3) --[[ Line: 3 ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v1 then
        return nil;
    elseif v1:IsA("Attachment") or v1:IsA("Constraint") or v1:IsA("WeldConstraint") or v1:IsA("NoCollisionConstraint") then
        return v1;
    else
        local l_Parent_0 = v1.Parent;
        local v5 = v3[l_Parent_0];
        if v5 then
            return v5;
        else
            if v1:IsA("BasePart") then
                if v1.Locked then
                    return nil;
                end;
            elseif not v1:IsA("Model") and not v1:IsA("Tool") then
                return nil;
            end;
            if v1.name == "HumanoidRootPart" then
                return nil;
            elseif v2 then
                return v1;
            else
                local l_v1_0 = v1;
                local l_l_Parent_0_0 = l_Parent_0;
                while l_l_Parent_0_0 do
                    if (l_l_Parent_0_0:IsA("Model") or l_l_Parent_0_0:IsA("Tool")) and l_l_Parent_0_0 ~= l_Workspace_0 then
                        l_v1_0 = l_l_Parent_0_0;
                    end;
                    l_l_Parent_0_0 = l_l_Parent_0_0.Parent;
                end;
                if l_v1_0 ~= v1 then
                    v3[l_Parent_0] = l_v1_0;
                end;
                return l_v1_0;
            end;
        end;
    end;
end;