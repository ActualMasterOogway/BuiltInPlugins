local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
return {
    stringifyCurveTable = function(v3) --[[ Line: 13 ]] --[[ Name: stringifyCurveTable ]]
        local v4 = {};
        for v5, v6 in v3 do
            local v7 = tostring(v5);
            if not v7 then
                print((("%* couldn't be converted to a string!"):format(v5)));
            else
                v4[v7] = v6;
            end;
        end;
        return v4;
    end, 
    destringifyCurveTable = function(v8) --[[ Line: 26 ]] --[[ Name: destringifyCurveTable ]]
        local v9 = {};
        for v10, v11 in v8 do
            local v12 = tonumber(v10);
            if not v12 then
                print((("%* couldn't be converted to a number!"):format(v10)));
            else
                v9[v12] = v11;
            end;
        end;
        return v9;
    end, 
    curveToTable = function(v13) --[[ Line: 39 ]] --[[ Name: curveToTable ]]
        -- upvalues: v2 (copy)
        local v14 = {};
        for _, v16 in v13.Keypoints do
            v14[v2(v16.X, 3)] = v2(v16.Y, 3);
        end;
        return v14;
    end, 
    tableToCurve = function(v17) --[[ Line: 50 ]] --[[ Name: tableToCurve ]]
        local v18 = {};
        for v19, v20 in v17 do
            table.insert(v18, Vector2.new(v19, v20));
        end;
        table.sort(v18, function(v21, v22) --[[ Line: 55 ]]
            return v21.X < v22.X;
        end);
        return {
            Keypoints = v18
        };
    end
};