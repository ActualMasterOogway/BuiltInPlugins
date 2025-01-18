local v0 = require(script.Parent.getUDim2ScaleFromVector2);
local v1 = require(script.Parent.getVector2FromUDim2Scale);
local v2 = require(script.Parent.rotatePoint);
getRelativePosFromAbsPos = function(v3, v4) --[[ Line: 5 ]] --[[ Name: getRelativePosFromAbsPos ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    if not v4:IsA("GuiBase2d") then
        if typeof(v3) == "Vector2" then
            v3 = v0(v3, v4);
        end;
        return v3;
    else
        if typeof(v3) == "UDim2" then
            v3 = v1(v3, v4);
        end;
        v3 = v3 - v4.AbsolutePosition;
        v3 = v2(v3, 0.5 * v4.AbsoluteSize, -1 * v4.AbsoluteRotation);
        return v0(v3, v4);
    end;
end;
return getRelativePosFromAbsPos;