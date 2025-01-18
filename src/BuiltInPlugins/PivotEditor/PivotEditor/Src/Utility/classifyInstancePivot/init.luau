local l_DraggerFramework_0 = script.Parent.Parent.Parent.Packages.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Utility.classifyPivot);
return function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    if v2:IsA("BasePart") then
        return v1(v2.CFrame, v2.PivotOffset.Position, v2.Size);
    elseif v2:IsA("Model") then
        local l_v2_BoundingBox_0, v4 = v2:GetBoundingBox();
        local l_v2_Pivot_0 = v2:GetPivot();
        local l_Position_0 = l_v2_Pivot_0:ToObjectSpace(l_v2_BoundingBox_0).Position;
        return v1(l_v2_Pivot_0, l_Position_0, v4);
    else
        return "None";
    end;
end;