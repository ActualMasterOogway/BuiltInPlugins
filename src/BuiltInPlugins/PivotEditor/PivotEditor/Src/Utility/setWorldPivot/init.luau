return function(v0, v1) --[[ Line: 1 ]]
    if v0:IsA("BasePart") then
        v0.PivotOffset = v0.CFrame:ToObjectSpace(v1);
        return;
    elseif v0:IsA("Model") then
        if v0.PrimaryPart then
            v0.PrimaryPart.PivotOffset = v0.PrimaryPart.CFrame:ToObjectSpace(v1);
        end;
        v0.WorldPivot = v1;
        return;
    else
        error("Unexpected instance type: " .. v0.ClassName);
        return;
    end;
end;