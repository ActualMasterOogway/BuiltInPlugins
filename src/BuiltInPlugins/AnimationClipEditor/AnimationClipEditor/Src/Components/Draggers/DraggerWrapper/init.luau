local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v8 = require(l_Actions_0.SetSelectedTrackInstances);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v10 = require(l_Components_0.Draggers.AnimationClipEditorDragger);
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v12 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v14 = require(l_Thunks_0.History.AddWaypoint);
local v15 = require(l_Thunks_0.SetSelectedTrackInstances);
local v16 = require(l_Thunks_0.SortAndSetSelectedTrackInstances);
local v17 = require(l_Thunks_0.ValueChanged);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v19 = require(l_Util_0.AnimationData);
local v20 = require(l_Util_0.Constants);
local v21 = require(l_Util_0.DraggerSchema.DraggerSchema);
local _ = require(l_Util_0.RigUtils);
local v23 = require(l_Util_0.TrackUtils);
local v24 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
local v25 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v26 = v1.PureComponent:extend("DraggerWrapper");
v26.didUpdate = function(v27, v28) --[[ Line: 39 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy)
    local l_props_0 = v27.props;
    if v27.selection and l_props_0.SelectedTrackInstances ~= v28.SelectedTrackInstances then
        v27.selection.selectedTrackInstances = l_props_0.SelectedTrackInstances;
        v27.props.Signals:get(v20.SIGNAL_KEYS.SelectionChanged):Fire();
    end;
end;
local function v47(v30, v31) --[[ Line: 48 ]] --[[ Name: mapDraggerContextToProps ]]
    -- upvalues: v20 (copy), v19 (copy), v23 (copy), v3 (copy)
    v30.RootInstance = v31.RootInstance;
    v30.IKMode = v31.IKMode;
    v30.StartingPose = v31.StartingPose;
    v30.PinnedParts = v31.PinnedParts;
    v30.IKEnabled = v31.IKEnabled;
    v30.Tool = v31.Tool;
    v30.IsPlaying = v31.PlayState ~= v20.PLAY_STATE.Pause;
    v30.VisualizeBones = v31.VisualizeBones;
    v30.ScrubberSignal = v31.Signals:get(v20.SIGNAL_KEYS.ScrubberChanged);
    v30.OnManipulateJoints = function(v32, v33) --[[ Line: 59 ]]
        -- upvalues: v31 (copy), v20 (ref), v30 (copy), v19 (ref), v23 (ref), v3 (ref)
        if v31.ReadOnly or v31.PlayState ~= v20.PLAY_STATE.Pause then
            return;
        else
            if v30.RootInstance:IsA("Model") then
                local l_Scale_0 = v30.RootInstance:GetScale();
                for v35, v36 in v33 do
                    v33[v35] = v36.Rotation + v36.Position / l_Scale_0;
                end;
            end;
            for v37, v38 in pairs(v33) do
                local v39 = {
                    v37
                };
                if not v19.isChannelAnimation(v31.AnimationData) then
                    v31.ValueChanged(v32, v39, v20.TRACK_TYPES.CFrame, nil, v31.Playhead, v38, v31.Analytics);
                else
                    local v40 = nil;
                    local l_DefaultEulerAnglesOrder_0 = v31.DefaultEulerAnglesOrder;
                    v40 = v23.getRotationTypeFromName(v37, v31.Tracks) or v31.DefaultRotationType;
                    if v40 == v20.TRACK_TYPES.EulerAngles then
                        local v42 = v19.getTrack(v31.AnimationData, "Root", v39);
                        l_DefaultEulerAnglesOrder_0 = v23.getEulerAnglesOrder(v42) or l_DefaultEulerAnglesOrder_0;
                    end;
                    do
                        local l_v40_0 = v40;
                        v23.traverseValue(v20.TRACK_TYPES.CFrame, v38, function(v44, v45, v46) --[[ Line: 94 ]]
                            -- upvalues: v31 (ref), v32 (copy), v3 (ref), v39 (copy), l_v40_0 (ref)
                            v31.ValueChanged(v32, v3.List.join(v39, v45), v44, l_v40_0, v31.Playhead, v46, v31.Analytics);
                        end, l_v40_0, l_DefaultEulerAnglesOrder_0);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v53(v48) --[[ Line: 110 ]] --[[ Name: setUpDraggerContext ]]
    -- upvalues: v20 (copy), v21 (copy), v24 (copy), v12 (copy)
    local v49 = v48.Plugin:get();
    local v50 = v48.Signals:get(v20.SIGNAL_KEYS.SelectionChanged);
    local v51 = v21.Selection.new(v50, if v24() then v48.SortAndSetSelectedTrackInstances else v48.SetSelectedTrackInstances);
    local v52 = v12.new(v49, game, settings(), v51);
    v52.AddWaypoint = function() --[[ Line: 122 ]]
        -- upvalues: v48 (copy)
        v48.AddWaypoint();
    end;
    return v51, v52;
end;
v26.render = function(v54) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v53 (copy), v47 (copy), v1 (copy), v10 (copy)
    local l_props_1 = v54.props;
    local l_Tool_0 = l_props_1.Tool;
    local v57 = l_props_1.Mouse:get();
    if not v54.draggerContext then
        if l_props_1.AnimationData ~= nil then
            local v58, v59 = v53(l_props_1);
            v54.selection = v58;
            v54.draggerContext = v59;
        else
            return;
        end;
    end;
    if l_props_1.AnimationData ~= nil then
        v47(v54.draggerContext, l_props_1);
    end;
    return v1.createElement(v10, {
        Context = v54.draggerContext, 
        Tool = l_Tool_0, 
        Mouse = v57
    });
end;
local function v63(v60, _) --[[ Line: 153 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v60.Status;
    return {
        Tool = v60.Status.Tool, 
        SelectedTrackInstances = v60.Status.SelectedTrackInstances, 
        RootInstance = v60.Status.RootInstance, 
        IKMode = v60.Status.IKMode, 
        StartingPose = v60.Status.StartingPose, 
        PinnedParts = v60.Status.PinnedParts, 
        IKEnabled = v60.Status.IKEnabled, 
        Playhead = v60.Status.Playhead, 
        Tracks = v60.Status.Tracks, 
        PlayState = l_Status_0.PlayState, 
        AnimationData = v60.AnimationData, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        VisualizeBones = v60.Status.VisualizeBones, 
        ReadOnly = v60.Status.ReadOnly
    };
end;
local function v74(v64) --[[ Line: 175 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v24 (copy), v25 (copy), v15 (copy), v8 (copy), v16 (copy), v17 (copy), v14 (copy)
    return {
        SetSelectedTrackInstances = not v24() and function(v65) --[[ Line: 178 ]]
            -- upvalues: v25 (ref), v64 (copy), v15 (ref), v8 (ref)
            if v25() then
                v64(v15(v65));
                return;
            else
                v64(v8(v65));
                return;
            end;
        end or nil, 
        SortAndSetSelectedTrackInstances = function(v66) --[[ Line: 186 ]] --[[ Name: SortAndSetSelectedTrackInstances ]]
            -- upvalues: v64 (copy), v16 (ref)
            v64(v16(v66));
        end, 
        ValueChanged = function(v67, v68, v69, v70, v71, v72, v73) --[[ Line: 190 ]] --[[ Name: ValueChanged ]]
            -- upvalues: v64 (copy), v17 (ref)
            v64(v17(v67, v68, v69, v70, v71, v72, v73));
        end, 
        AddWaypoint = function() --[[ Line: 194 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v64 (copy), v14 (ref)
            v64(v14());
        end
    };
end;
v26 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Signals = v6, 
    Mouse = l_ContextServices_0.Mouse, 
    Analytics = l_ContextServices_0.Analytics
})(v26);
return v2.connect(v63, v74)(v26);