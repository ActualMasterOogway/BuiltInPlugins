local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.ImportLoadedFBXAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationImportProgress);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationImportStatus);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetCreatingAnimationFromVideo);
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationFromVideoUploadStartTime);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationFromVideoErroredOut);
local function v23(v13, v14, v15, _, v17) --[[ Line: 22 ]] --[[ Name: _ImportFBXAnimationFromFilePathUserMayChooseModel ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), v5 (copy), v6 (copy), v7 (copy)
    local l_RootInstance_0 = v13:getState().Status.RootInstance;
    if not l_RootInstance_0 then
        return;
    else
        local function v19() --[[ Line: 35 ]] --[[ Name: userChooseModelThenImportCB ]]
            -- upvalues: v13 (copy), v4 (ref), v15 (copy), v17 (copy)
            v13:dispatch(v4(v15, true, v17));
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: v14 (copy), l_RootInstance_0 (copy), v19 (copy)
            return game:GetService("AvatarImportService"):ImportFBXAnimationFromFilePathUserMayChooseModel(v14, l_RootInstance_0, v19);
        end);
        if l_status_0 then
            local v22 = v3.fromKeyframeSequence(l_result_0);
            v22.Metadata.Name = v1.DEFAULT_IMPORTED_NAME;
            v13:dispatch(v5(v22, v17));
            v13:dispatch(v6(false));
            v13:dispatch(v7(false));
            if l_result_0 then
                l_result_0:Destroy();
            end;
            v17:report("onCreateFromVideo", if v22.Metadata then v22.Metadata.Guid else nil);
            return;
        else
            warn(l_result_0);
            return;
        end;
    end;
end;
return function(v24, v25, v26) --[[ Line: 64 ]]
    -- upvalues: v12 (copy), v9 (copy), v1 (copy), v8 (copy), v10 (copy), v11 (copy), v23 (copy)
    return function(v27) --[[ Line: 65 ]]
        -- upvalues: v12 (ref), v9 (ref), v1 (ref), v8 (ref), v10 (ref), v11 (ref), v26 (copy), v23 (ref), v24 (copy), v25 (copy)
        if v27:getState().Status.CreatingAnimationFromVideo then
            return;
        else
            v27:dispatch(v12(false));
            v27:dispatch(v9(v1.ANIMATION_FROM_VIDEO_STATUS.Initializing));
            v27:dispatch(v8(0));
            v27:dispatch(v10(true));
            local v28 = nil;
            local function v31(v29, v30) --[[ Line: 79 ]] --[[ Name: progressCallback ]]
                -- upvalues: v1 (ref), v28 (ref), v27 (copy), v11 (ref), v9 (ref), v8 (ref)
                if v30 == v1.ANIMATION_FROM_VIDEO_STATUS.UploadingData and not v28 then
                    v28 = os.clock();
                    v27:dispatch(v11(v28));
                end;
                if not v27:getState().Status.CreatingAnimationFromVideo then
                    return false;
                else
                    v27:dispatch(v9(v30));
                    v27:dispatch(v8(v29));
                    return true;
                end;
            end;
            local l_AnimationFromVideoCreatorStudioService_0 = game:GetService("AnimationFromVideoCreatorStudioService");
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 96 ]]
                -- upvalues: l_AnimationFromVideoCreatorStudioService_0 (copy), v31 (copy)
                return l_AnimationFromVideoCreatorStudioService_0:CreateAnimationByUploadingVideo(v31);
            end);
            local v35 = v28 and os.clock() - v28;
            if not l_status_1 then
                v27:dispatch(v12(true));
                if v27:getState().Status.AnimationImportStatus == v1.ANIMATION_FROM_VIDEO_STATUS.Initializing then
                    v27:dispatch(v10(false));
                end;
                if v27:getState().Status.AnimationImportStatus == v1.ANIMATION_FROM_VIDEO_STATUS.UploadingData then
                    v27:dispatch(v9(v1.ANIMATION_FROM_VIDEO_STATUS.ErrorUploadingData));
                    v27:dispatch(v8(0));
                    l_result_1 = l_result_1 or "Error while uploading video";
                end;
                v26:report("onAnimationEditorImportVideoError", l_result_1, v35);
                warn(l_result_1);
                return;
            else
                local l_l_result_1_0 = l_result_1;
                v26:report("onAnimationEditorImportVideoUploadSucceed", v35);
                if l_l_result_1_0 == nil or not v27:getState().Status.CreatingAnimationFromVideo then
                    return;
                else
                    v27:dispatch(v10(false));
                    v23(v27, l_l_result_1_0, v24, v25, v26);
                    return;
                end;
            end;
        end;
    end;
end;