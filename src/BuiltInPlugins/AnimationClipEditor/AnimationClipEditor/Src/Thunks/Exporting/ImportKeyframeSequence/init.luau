local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetFrameRate);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
return function(v10, v11) --[[ Line: 18 ]]
    -- upvalues: l_AnimationClipProvider_0 (copy), v9 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
    return function(v12) --[[ Line: 19 ]]
        -- upvalues: v10 (copy), l_AnimationClipProvider_0 (ref), v9 (ref), v4 (ref), v2 (ref), v5 (ref), v11 (copy), v6 (ref), v7 (ref), v8 (ref)
        if not v12:getState().Status.RootInstance then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
                -- upvalues: v10 (ref)
                return v10:get():PromptForExistingAssetId("Animation");
            end);
            if not l_status_0 then
                return;
            else
                if l_result_0 and tonumber(l_result_0) > 0 then
                    local v15 = nil;
                    if not pcall(function() --[[ Line: 38 ]]
                        -- upvalues: v15 (ref), l_AnimationClipProvider_0 (ref), l_result_0 (copy)
                        v15 = l_AnimationClipProvider_0:GetAnimationClipById(l_result_0, false);
                    end) then
                        v12:dispatch(v9("InvalidAnimation", true));
                    end;
                    if not v15 then
                        return;
                    else
                        local v16 = nil;
                        local v17 = nil;
                        if v15:IsA("KeyframeSequence") then
                            local v18, v19 = v4.fromKeyframeSequence(v15);
                            v16 = v18;
                            v17 = v19;
                        else
                            v16 = v4.fromCurveAnimation(v15);
                            v17 = v2.DEFAULT_FRAMERATE;
                        end;
                        v16.Metadata.Name = v2.DEFAULT_IMPORTED_NAME;
                        v12:dispatch(v5(v16, v11));
                        v12:dispatch(v6(false));
                        v12:dispatch(v7(false));
                        v12:dispatch(v8(v17));
                        if v11 then
                            v11:report("onImportAnimation", l_result_0, if v16.Metadata then v16.Metadata.Guid else nil);
                        end;
                        --[[ close >= 5 ]]
                    end;
                end;
                return;
            end;
        end;
    end;
end;