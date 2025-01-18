local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetFrameRate);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
return function(v10, v11, v12) --[[ Line: 17 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v8 (copy), v7 (copy), v9 (copy)
    return function(v13) --[[ Line: 18 ]]
        -- upvalues: v1 (ref), v11 (copy), v10 (copy), v2 (ref), v3 (ref), v4 (ref), v12 (copy), v5 (ref), v6 (ref), v8 (ref), v7 (ref), v9 (ref)
        local l_RootInstance_0 = v13:getState().Status.RootInstance;
        if not l_RootInstance_0 then
            return;
        else
            local v15, v16 = v1.getAnimSavesFolder(l_RootInstance_0);
            if v11 then
                v15 = v16;
            end;
            if not v15 then
                return;
            else
                local l_v15_FirstChild_0 = v15:FindFirstChild(v10);
                if not l_v15_FirstChild_0 then
                    return;
                else
                    local v18 = nil;
                    local v19 = nil;
                    local v20 = nil;
                    local v21 = nil;
                    local v22 = nil;
                    if l_v15_FirstChild_0:IsA("KeyframeSequence") then
                        local v23, v24, v25, v26, v27 = v2.fromKeyframeSequence(l_v15_FirstChild_0);
                        v18 = v23;
                        v22 = v24;
                        v19 = v25;
                        v20 = v26;
                        v21 = v27;
                    elseif l_v15_FirstChild_0:IsA("CurveAnimation") then
                        local v28, v29, v30, v31 = v2.fromCurveAnimation(l_v15_FirstChild_0);
                        v18 = v28;
                        v19 = v29;
                        v20 = v30;
                        v21 = v31;
                        v22 = v3.DEFAULT_FRAMERATE;
                    else
                        return;
                    end;
                    v13:dispatch(v4(v18, v12));
                    v13:dispatch(v5("Loaded", v10));
                    v13:dispatch(v6(false));
                    v13:dispatch(v8(v22));
                    v13:dispatch(v7(v11));
                    local v32 = if v9.isChannelAnimation(v18) then v3.ANIMATION_TYPE.CurveAnimation else v3.ANIMATION_TYPE.KeyframeSequence;
                    v12:report("onLoadAnimation", v10, v19, v20, v21, v32, if v18.Metadata then v18.Metadata.Guid else nil);
                    return;
                end;
            end;
        end;
    end;
end;