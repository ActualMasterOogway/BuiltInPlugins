local v0 = require(script.Parent.getVector2FromUDim2Scale);
local v1 = require(script.Parent.rotatePoint);
getAbsPosFromRelative = function(v2, v3) --[[ Line: 4 ]] --[[ Name: getAbsPosFromRelative ]]
    -- upvalues: v0 (copy), v1 (copy)
    if typeof(v2) == "UDim2" then
        v2 = v0(v2, v3);
    end;
    if not v3:IsA("GuiBase2d") then
        return v2;
    else
        return v1(v2, 0.5 * v3.AbsoluteSize, v3.AbsoluteRotation) + v3.AbsolutePosition;
    end;
end;
return getAbsPosFromRelative;