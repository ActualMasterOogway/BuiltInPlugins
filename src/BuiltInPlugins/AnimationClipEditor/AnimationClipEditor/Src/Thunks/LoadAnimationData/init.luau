local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetFuture);
local _ = require(l_Actions_0.SetInReviewState);
local v4 = require(l_Actions_0.SetIsDirty);
local v5 = require(l_Actions_0.SetLastSelectedPath);
local v6 = require(l_Actions_0.SetPast);
local v7 = require(l_Actions_0.SetRightClickContextInfo);
local v8 = require(l_Actions_0.SetSelectedKeyframes);
local v9 = require(l_Actions_0.SetSelectedTracks);
local v10 = require(l_Actions_0.SetShowEvents);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v12 = require(l_Thunks_0.AddTrack);
local v13 = require(l_Thunks_0.SetSelectedTracks);
local v14 = require(l_Thunks_0.SetTopTrackIndex);
local v15 = require(l_Thunks_0.SortAndSetTracks);
local v16 = require(l_Thunks_0.Playback.StepAnimation);
local v17 = require(l_Thunks_0.SwitchEditorMode);
local v18 = require(l_Thunks_0.UpdateAnimationData);
local v19 = require(l_Thunks_0.UpdateEditingLength);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v21 = require(l_Util_0.Constants);
local v22 = require(l_Util_0.isEmpty);
local v23 = require(l_Util_0.TrackUtils);
local _ = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v25 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v26 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagResetTopTrackIndex);
return function(v27, v28) --[[ Line: 37 ]]
    -- upvalues: v6 (copy), v2 (copy), v25 (copy), v13 (copy), v9 (copy), v5 (copy), v7 (copy), v8 (copy), v15 (copy), v17 (copy), v21 (copy), v18 (copy), v23 (copy), v12 (copy), v26 (copy), v14 (copy), v16 (copy), v4 (copy), v19 (copy), v10 (copy), v22 (copy)
    return function(v29) --[[ Line: 38 ]]
        -- upvalues: v6 (ref), v2 (ref), v25 (ref), v13 (ref), v9 (ref), v5 (ref), v7 (ref), v8 (ref), v15 (ref), v17 (ref), v21 (ref), v28 (copy), v18 (ref), v27 (copy), v23 (ref), v12 (ref), v26 (ref), v14 (ref), v16 (ref), v4 (ref), v19 (ref), v10 (ref), v22 (ref)
        v29:dispatch(v6({}));
        v29:dispatch(v2({}));
        if v25() then
            v29:dispatch(v13({}));
        else
            v29:dispatch(v9({}));
        end;
        v29:dispatch(v5(nil));
        v29:dispatch(v7({}));
        v29:dispatch(v8({}));
        v29:dispatch(v15({}));
        v29:dispatch(v17(v21.EDITOR_MODE.DopeSheet, v28));
        v29:dispatch(v18(v27));
        for v30, v31 in pairs(v27.Instances) do
            for v32, v33 in pairs(v31.Tracks) do
                local v34 = v23.getRotationType(v33);
                local v35 = v23.getEulerAnglesOrder(v33);
                v29:dispatch(v12(v30, v32, v33.Type, v34, v35, v28));
            end;
        end;
        if v26() then
            v29:dispatch(v14(1));
        end;
        v29:dispatch(v16(0));
        v29:dispatch(v4(true));
        v29:dispatch(v19(v27.Metadata.EndTick));
        v29:dispatch(v10(not v22(v27.Events.Keyframes)));
    end;
end;