local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetActive);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.SaveAnimation);
return function(v8) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), l_ChangeHistoryService_0 (copy), v3 (copy), v7 (copy), v4 (copy)
    return function(v9) --[[ Line: 19 ]]
        -- upvalues: v5 (ref), v6 (ref), v2 (ref), l_ChangeHistoryService_0 (ref), v3 (ref), v7 (ref), v8 (copy), v4 (ref)
        local v10 = v9:getState();
        v9:dispatch(v5(false));
        v9:dispatch(v6(v2.PLAY_STATE.Pause));
        local l_AnimationData_0 = v10.AnimationData;
        local l_RootInstance_0 = v10.Status.RootInstance;
        l_ChangeHistoryService_0:SetEnabled(true);
        if not l_AnimationData_0 or not l_RootInstance_0 then
            return;
        else
            local l_Instances_0 = l_AnimationData_0.Instances;
            if l_Instances_0 then
                for _, v15 in pairs(l_Instances_0) do
                    if v15.Type == v2.INSTANCE_TYPES.Rig then
                        v3.clearPose(l_RootInstance_0);
                    end;
                end;
            end;
            if l_AnimationData_0.Metadata and l_AnimationData_0.Instances and l_AnimationData_0.Instances.Root and l_AnimationData_0.Instances.Root.Type == v2.INSTANCE_TYPES.Rig and v10.Status.IsDirty then
                v9:dispatch(v7(v2.DEFAULT_AUTOSAVE_NAME, v8));
            end;
            v4.clearMicrobones();
            return;
        end;
    end;
end;