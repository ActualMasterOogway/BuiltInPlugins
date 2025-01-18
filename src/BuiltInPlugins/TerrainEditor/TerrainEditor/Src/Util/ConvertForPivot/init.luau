local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_PivotPosition_0 = require(l_script_FirstAncestor_0.Src.Types).PivotPosition;
return function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: ConvertForPivot ]]
    -- upvalues: l_PivotPosition_0 (copy)
    local v5 = v4 / 2;
    if v2 == l_PivotPosition_0.Top then
        return (Vector3.new(v3.X, v3.Y - v5, v3.Z));
    elseif v2 == l_PivotPosition_0.Bottom then
        return (Vector3.new(v3.X, v3.Y + v5, v3.Z));
    else
        return v3;
    end;
end;