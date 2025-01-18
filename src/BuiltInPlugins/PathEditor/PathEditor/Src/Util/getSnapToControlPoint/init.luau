local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(script.Parent.getUDim2FromVector2);
local v2 = require(script.Parent.getPositionMatchesControlPoint);
local _ = require(script.Parent.rotateUDim2Point);
local l_SnapToPointEpsilon_0 = require(l_Parent_0.Src.Resources.Constants).SnapToPointEpsilon;
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local _ = nil;
if l_PathEditorRotation_0 then
    return function(v7, v8, v9) --[[ Line: 14 ]]
        -- upvalues: l_SnapToPointEpsilon_0 (copy), v2 (copy)
        local l_v7_0 = v7;
        local l_l_SnapToPointEpsilon_0_0 = l_SnapToPointEpsilon_0;
        for _, v13 in v8 do
            local v14, v15 = v2(v7, v13, v9, l_l_SnapToPointEpsilon_0_0);
            if v14 then
                l_v7_0 = v13.Position;
                l_l_SnapToPointEpsilon_0_0 = v15;
            end;
        end;
        return l_v7_0;
    end;
else
    return function(v16, v17, v18, v19) --[[ Line: 27 ]]
        -- upvalues: l_SnapToPointEpsilon_0 (copy), v2 (copy)
        local l_v16_0 = v16;
        local l_l_SnapToPointEpsilon_0_1 = l_SnapToPointEpsilon_0;
        for _, v23 in v17 do
            local v24, v25 = v2(v16, v23, v18, v19, l_l_SnapToPointEpsilon_0_1);
            if v24 then
                l_v16_0 = v23.Position;
                l_l_SnapToPointEpsilon_0_1 = v25;
            end;
        end;
        return l_v16_0;
    end;
end;