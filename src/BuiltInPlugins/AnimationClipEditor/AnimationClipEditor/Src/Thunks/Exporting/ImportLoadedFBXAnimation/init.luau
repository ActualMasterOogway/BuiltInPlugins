local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v7 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.MergeBodyAndFacialAnimation);
local v9 = game:DefineFastFlag("MergeBodyAnimationWithExistingFaceAnimationOnFBXImport", false);
return function(_, v11, v12) --[[ Line: 18 ]]
    -- upvalues: v3 (copy), v7 (copy), v9 (copy), v8 (copy), v1 (copy), v4 (copy), v5 (copy), v6 (copy)
    return function(v13) --[[ Line: 19 ]]
        -- upvalues: v11 (copy), v3 (ref), v7 (ref), v9 (ref), v8 (ref), v1 (ref), v12 (copy), v4 (ref), v5 (ref), v6 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: v11 (ref)
            return game:GetService("AvatarImportService"):ImportLoadedFBXAnimation(v11);
        end);
        if l_status_0 then
            local v16 = v3.fromKeyframeSequence(l_result_0);
            local l_AnimationData_0 = v13:getState().AnimationData;
            local v18 = l_AnimationData_0 and v7.hasFacsData(l_AnimationData_0);
            local v19 = v16 and not v7.hasFacsData(v16);
            if v9 and v18 and v19 then
                v13:dispatch(v8(v16, v1.TRACKS_SUBSETS_TYPE.Body, v12));
            else
                v16.Metadata.Name = v1.DEFAULT_IMPORTED_NAME;
                v13:dispatch(v4(v16, v12));
                v13:dispatch(v5(false));
                v13:dispatch(v6(false));
            end;
            if l_result_0 then
                l_result_0:Destroy();
            end;
            v12:report("onImportFbxAnimation", if v16.Metadata then v16.Metadata.Guid else nil);
            if v11 then
                v12:report("onUserChoseFBXModelForAnimImport", if v16.Metadata then v16.Metadata.Guid else nil);
            else
                v12:report("onUserChoseSelectedModelForAnimImport", if v16.Metadata then v16.Metadata.Guid else nil);
            end;
            warn(l_result_0);
        end;
    end;
end;