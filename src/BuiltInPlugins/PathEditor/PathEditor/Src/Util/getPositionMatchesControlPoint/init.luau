local l_Parent_0 = script.Parent.Parent.Parent;
local l_SnapToPointEpsilon_0 = require(l_Parent_0.Src.Resources.Constants).SnapToPointEpsilon;
local v2 = require(script.Parent.getVector2FromUDim2Scale);
local v3 = require(script.Parent.getVector2FromUDim2Offset);
local v4 = require(script.Parent.getAbsPosFromUDim2);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local _ = nil;
if l_PathEditorRotation_0 then
    return function(v7, v8, v9, v10) --[[ Line: 14 ]]
        -- upvalues: l_SnapToPointEpsilon_0 (copy), v2 (copy)
        if v8 == nil then
            return false;
        else
            local v11 = v10 or l_SnapToPointEpsilon_0;
            local v12 = math.abs(v2(v8.Position - v7, v9).Magnitude);
            return v12 < v11, v12;
        end;
    end;
else
    return function(v13, v14, v15, v16, v17) --[[ Line: 30 ]]
        -- upvalues: l_SnapToPointEpsilon_0 (copy), v4 (copy), v3 (copy)
        if v14 == nil then
            return false;
        else
            local v18 = v17 or l_SnapToPointEpsilon_0;
            local v19 = math.abs((v4(v14.Position, v15, v16) - v15 - v3(v13)).Magnitude);
            return v19 < v18, v19;
        end;
    end;
end;