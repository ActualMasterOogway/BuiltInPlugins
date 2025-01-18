local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeData);
return function(v5, v6, v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v4 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v1 (ref), v3 (ref), v4 (ref), v9 (copy)
        local l_AnimationData_0 = v10:getState().AnimationData;
        if not l_AnimationData_0 then
            return;
        else
            local v12 = v2.getTrack(l_AnimationData_0, v5, v6);
            if not v12 then
                return;
            elseif not v12.Data[v7] then
                return;
            else
                local v13 = {};
                if v8 == v1.SLOPES.Left then
                    local _, v15, _ = v3.findNearestKeyframesProperly(v12.Keyframes, v7 - 1);
                    if v15 then
                        local v17 = v12.Keyframes[v15];
                        local v18 = {
                            InterpolationMode = Enum.KeyInterpolationMode.Cubic
                        };
                        v10:dispatch(v4(v5, v6, v17, v18));
                    end;
                    v13.LeftSlope = v9;
                else
                    v13.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
                    v13.RightSlope = v9;
                end;
                v10:dispatch(v4(v5, v6, v7, v13));
                return;
            end;
        end;
    end;
end;