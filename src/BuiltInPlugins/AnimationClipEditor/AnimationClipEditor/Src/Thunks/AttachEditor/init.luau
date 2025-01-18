local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetRootInstance);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetActive);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Util.RigValidation);
local v13 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
local v14 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v15 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagStudioDisambiguatePluginShortcuts);
return function(v16) --[[ Line: 27 ]]
    -- upvalues: v10 (copy), l_ChangeHistoryService_0 (copy), v15 (copy), l_StudioService_0 (copy), v12 (copy), v5 (copy), v3 (copy), v9 (copy), v7 (copy), v6 (copy), v14 (copy), v8 (copy), v13 (copy), v4 (copy)
    return function(v17) --[[ Line: 28 ]]
        -- upvalues: v10 (ref), l_ChangeHistoryService_0 (ref), v15 (ref), l_StudioService_0 (ref), v12 (ref), v5 (ref), v3 (ref), v9 (ref), v7 (ref), v6 (ref), v14 (ref), v8 (ref), v16 (copy), v13 (ref), v4 (ref)
        local v18 = v17:getState();
        v17:dispatch(v10(true));
        local l_RootInstance_0 = v18.Status.RootInstance;
        local l_AnimationData_0 = v18.AnimationData;
        local l_Playhead_0 = v18.Status.Playhead;
        local l_VisualizeBones_0 = v18.Status.VisualizeBones;
        if l_ChangeHistoryService_0:GetCanUndo() then
            l_ChangeHistoryService_0:SetEnabled(false);
        end;
        if not v15() then
            l_StudioService_0:CopyToClipboard("");
        end;
        if l_RootInstance_0 == nil or l_RootInstance_0:FindFirstAncestorOfClass("Workspace") == nil or l_RootInstance_0 and v12.rigHasErrors(l_RootInstance_0) then
            v17:dispatch(v5(v3.None));
            v17:dispatch(v9({}));
            v17:dispatch(v7({}));
            v17:dispatch(v6(nil));
            return;
        else
            if l_AnimationData_0 then
                v17:dispatch(v9({}));
                for v23, v24 in pairs(l_AnimationData_0.Instances) do
                    for v25, v26 in pairs(v24.Tracks) do
                        local v27 = v14.getRotationType(v26);
                        local v28 = v14.getEulerAnglesOrder(v26);
                        v17:dispatch(v8(v23, v25, v26.Type, v27, v28, v16));
                    end;
                end;
            end;
            v13.clearMicrobones();
            if l_RootInstance_0 and not l_AnimationData_0 then
                v13.updateMicrobones(l_RootInstance_0, l_VisualizeBones_0);
            end;
            v17:dispatch(v4(l_Playhead_0));
            return;
        end;
    end;
end;