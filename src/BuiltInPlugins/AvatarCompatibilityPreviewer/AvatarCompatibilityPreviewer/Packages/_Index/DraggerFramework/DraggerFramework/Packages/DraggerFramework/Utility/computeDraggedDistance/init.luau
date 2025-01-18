local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utility.Math);
return function(v2, v3, v4) --[[ Line: 21 ]] --[[ Name: computeDraggedDistance ]]
    -- upvalues: v1 (copy)
    local l_Origin_0 = v4.Origin;
    local l_Unit_0 = v4.Direction.Unit;
    local v7 = v3:Cross((l_Origin_0 - v2).Unit);
    if v7.Magnitude < 1.0E-4 then
        return false;
    else
        local l_Unit_1 = v3:Cross(v7).Unit;
        if l_Unit_0:Dot(l_Unit_1) < 1.0E-4 then
            return false;
        else
            return true, ((v1.intersectRayPlanePoint(l_Origin_0, l_Unit_0, v2, l_Unit_1) - v2):Dot(v3));
        end;
    end;
end;