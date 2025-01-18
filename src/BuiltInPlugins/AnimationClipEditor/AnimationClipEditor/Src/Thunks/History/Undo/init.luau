local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetFuture);
local v5 = require(l_Actions_0.SetInReviewState);
local v6 = require(l_Actions_0.SetPast);
local v7 = require(l_Actions_0.SetSelectedKeyframes);
local v8 = require(l_Actions_0.SetSelectedTracks);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v10 = require(l_Thunks_0.SetSelectedTracks);
local v11 = require(l_Thunks_0.SortAndSetTracks);
local v12 = require(l_Thunks_0.UpdateAnimationData);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v14 = require(l_Util_0.TrackSelectionUtils);
local v15 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v16 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function(v17) --[[ Line: 28 ]]
    -- upvalues: v15 (copy), v5 (copy), v2 (copy), v4 (copy), v12 (copy), v11 (copy), v7 (copy), v14 (copy), v16 (copy), v10 (copy), v8 (copy), v6 (copy), v1 (copy)
    return function(v18) --[[ Line: 29 ]]
        -- upvalues: v15 (ref), v5 (ref), v2 (ref), v4 (ref), v12 (ref), v11 (ref), v7 (ref), v14 (ref), v16 (ref), v10 (ref), v8 (ref), v6 (ref), v17 (copy), v1 (ref)
        local v19 = v18:getState();
        local l_AnimationData_0 = v19.AnimationData;
        local l_Tracks_0 = v19.Status.Tracks;
        local l_SelectedTracks_0 = v19.Status.SelectedTracks;
        local l_History_0 = v19.History;
        local l_Past_0 = l_History_0.Past;
        local l_Future_0 = l_History_0.Future;
        if #l_Past_0 > 0 then
            if v15() then
                v18:dispatch(v5(false));
            end;
            l_Future_0 = v2.List.join({
                {
                    AnimationData = v2.Dictionary.join(l_AnimationData_0), 
                    Tracks = v2.List.join(l_Tracks_0)
                }
            }, l_Future_0);
            l_Future_0 = v2.List.filter(l_Future_0, function(_, v27) --[[ Line: 50 ]]
                -- upvalues: l_History_0 (copy)
                return v27 <= l_History_0.MaxWaypointSize;
            end);
            v18:dispatch(v4(l_Future_0));
            local v28 = l_Past_0[1];
            v18:dispatch(v12(v28.AnimationData));
            v18:dispatch(v11(v28.Tracks));
            v18:dispatch(v7({}));
            local v29, v30 = v14.PruneSelectedTracks(v28.AnimationData, l_SelectedTracks_0);
            if v30 then
                if v16() then
                    v18:dispatch(v10(v29));
                else
                    v18:dispatch(v8(v29));
                end;
            end;
            v18:dispatch(v6(v2.List.removeIndex(l_Past_0, 1)));
            if v17 then
                v17:get(v1.SIGNAL_KEYS.SelectionChanged):Fire();
            end;
        end;
    end;
end;