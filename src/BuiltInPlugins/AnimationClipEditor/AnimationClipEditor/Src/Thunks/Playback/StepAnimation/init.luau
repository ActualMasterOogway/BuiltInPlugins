local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayhead);
local v5 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v4 (copy), v3 (copy)
    return function(v7) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v2 (ref), v6 (ref), v5 (ref), v4 (ref), v3 (ref)
        local v8 = v7:getState();
        local l_AnimationData_0 = v8.AnimationData;
        local l_RootInstance_0 = v8.Status.RootInstance;
        local v11 = v8.Status.PlayState ~= v1.PLAY_STATE.Pause;
        local l_Active_0 = v8.Status.Active;
        local l_VisualizeBones_0 = v8.Status.VisualizeBones;
        if not l_AnimationData_0 or not l_RootInstance_0 or not l_Active_0 then
            return;
        else
            local l_Instances_0 = l_AnimationData_0.Instances;
            if l_Instances_0 then
                for _, v16 in pairs(l_Instances_0) do
                    if v16.Type == v1.INSTANCE_TYPES.Rig then
                        v2.stepRigAnimation(l_RootInstance_0, v16, v6);
                    end;
                end;
            end;
            if not v11 then
                v6 = v5.getNearestTick(v6);
            end;
            v7:dispatch(v4(v6));
            v3.updateMicrobones(l_RootInstance_0, l_VisualizeBones_0);
            return;
        end;
    end;
end;