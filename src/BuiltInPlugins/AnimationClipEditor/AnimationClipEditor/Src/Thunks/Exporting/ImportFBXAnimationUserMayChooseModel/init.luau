local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
return function(_, v9, v10) --[[ Line: 19 ]]
    -- upvalues: v7 (copy), v5 (copy), v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    return function(v11) --[[ Line: 20 ]]
        -- upvalues: v9 (copy), v7 (ref), v5 (ref), v4 (ref), v3 (ref), v10 (copy), v1 (ref), v2 (ref)
        local l_RootInstance_0 = v11:getState().Status.RootInstance;
        if not l_RootInstance_0 then
            return;
        else
            local function v13() --[[ Line: 27 ]] --[[ Name: userChooseModelThenImportCB ]]
                -- upvalues: v9 (ref)
                v9:showImportAnimModelChoicePrompt();
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
                -- upvalues: l_RootInstance_0 (copy), v13 (copy)
                return game:GetService("AvatarImportService"):ImportFBXAnimationUserMayChooseModel(l_RootInstance_0, v13);
            end);
            if l_status_0 then
                local v16 = v7.fromKeyframeSequence(l_result_0);
                v16.Metadata.Name = v5.DEFAULT_IMPORTED_NAME;
                v4.clearTrackSequences(v16);
                v11:dispatch(v3(v16, v10));
                v11:dispatch(v1(false));
                v11:dispatch(v2(false));
                if l_result_0 then
                    l_result_0:Destroy();
                end;
                v10:report("onImportFbxAnimation", if v16.Metadata then v16.Metadata.Guid else nil);
                return;
            else
                warn(l_result_0);
                return;
            end;
        end;
    end;
end;