local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.getVector2FromUDim2Scale);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local function v7(v3, v4) --[[ Line: 7 ]] --[[ Name: computeSegmentIndexAndAdjustedT ]]
    v4 = math.clamp(v4, 0, 1);
    local v5 = #v3:GetControlPoints() - 1;
    local v6 = math.clamp(v4 * v5, 0, v5 - 1);
    return {
        v6, 
        v4 * v5 - v6
    };
end;
local _ = nil;
if l_PathEditorRotation_0 then
    return function(v9, v10) --[[ Line: 18 ]]
        -- upvalues: v1 (copy), v7 (copy)
        local v11 = 5000;
        local v12 = 0;
        local v13 = 0;
        local v14 = nil;
        v14 = if typeof(v10) == "UDim2" then v1(v10, v9.Parent) else v10;
        for v15 = 0, 500 do
            local l_Magnitude_0 = (v1(v9:getPositionOnCurve(v15 / 500), v9.Parent) - v14).Magnitude;
            if l_Magnitude_0 < v11 then
                v11 = l_Magnitude_0;
                v12 = v7(v9, v15 / 500)[1];
                v13 = v15 / 500;
            end;
        end;
        return {
            v12, 
            v11, 
            v13
        };
    end;
else
    return function(v17, v18) --[[ Line: 44 ]]
        -- upvalues: v1 (copy), v7 (copy)
        local v19 = 5000;
        local v20 = 0;
        local v21 = 0;
        for v22 = 0, 500 do
            local l_Magnitude_1 = (v1(v17:getPositionOnCurve(v22 / 500), v17.Parent) - v18).Magnitude;
            if l_Magnitude_1 < v19 then
                v19 = l_Magnitude_1;
                v20 = v7(v17, v22 / 500)[1];
                v21 = v22 / 500;
            end;
        end;
        return {
            v20, 
            v19, 
            v21
        };
    end;
end;