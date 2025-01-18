local v0 = require(script.Parent.rotatePoint);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
getAbsPosFromUDim2 = function(v2, v3, v4, v5) --[[ Line: 5 ]] --[[ Name: getAbsPosFromUDim2 ]]
    -- upvalues: l_PathEditorRotation_0 (copy), v0 (copy)
    if l_PathEditorRotation_0 then
        local v6 = v5 or 0;
        local v7 = Vector2.new(v2.X.Offset + v2.X.Scale * v4.X, v2.Y.Offset + v2.Y.Scale * v4.Y);
        return v0(v7, v4 * 0.5, v6) + v3;
    else
        return Vector2.new(v2.X.Offset + v2.X.Scale * v4.X, v2.Y.Offset + v2.Y.Scale * v4.Y) + v3;
    end;
end;
return getAbsPosFromUDim2;