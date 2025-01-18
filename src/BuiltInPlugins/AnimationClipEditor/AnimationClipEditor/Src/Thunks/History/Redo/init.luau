local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetFuture);
local v4 = require(l_Actions_0.SetPast);
local v5 = require(l_Actions_0.SetSelectedKeyframes);
local v6 = require(l_Actions_0.SetSelectedTracks);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v8 = require(l_Thunks_0.SetSelectedTracks);
local v9 = require(l_Thunks_0.SortAndSetTracks);
local v10 = require(l_Thunks_0.UpdateAnimationData);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v12 = require(l_Util_0.TrackSelectionUtils);
local v13 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function() --[[ Line: 25 ]]
    -- upvalues: v1 (copy), v4 (copy), v10 (copy), v9 (copy), v5 (copy), v12 (copy), v13 (copy), v8 (copy), v6 (copy), v3 (copy)
    return function(v14) --[[ Line: 26 ]]
        -- upvalues: v1 (ref), v4 (ref), v10 (ref), v9 (ref), v5 (ref), v12 (ref), v13 (ref), v8 (ref), v6 (ref), v3 (ref)
        local v15 = v14:getState();
        local l_AnimationData_0 = v15.AnimationData;
        local l_Tracks_0 = v15.Status.Tracks;
        local l_SelectedTracks_0 = v15.Status.SelectedTracks;
        local l_History_0 = v15.History;
        local l_Past_0 = l_History_0.Past;
        local l_Future_0 = l_History_0.Future;
        if #l_Future_0 > 0 then
            l_Past_0 = v1.List.join({
                {
                    AnimationData = v1.Dictionary.join(l_AnimationData_0), 
                    Tracks = v1.List.join(l_Tracks_0)
                }
            }, l_Past_0);
            l_Past_0 = v1.List.filter(l_Past_0, function(_, v23) --[[ Line: 42 ]]
                -- upvalues: l_History_0 (copy)
                return v23 <= l_History_0.MaxWaypointSize;
            end);
            v14:dispatch(v4(l_Past_0));
            local v24 = l_Future_0[1];
            v14:dispatch(v10(v24.AnimationData));
            v14:dispatch(v9(v24.Tracks));
            v14:dispatch(v5({}));
            local v25, v26 = v12.PruneSelectedTracks(v24.AnimationData, l_SelectedTracks_0);
            if v26 then
                if v13() then
                    v14:dispatch(v8(v25));
                else
                    v14:dispatch(v6(v25));
                end;
            end;
            v14:dispatch(v3(v1.List.removeIndex(l_Future_0, 1)));
        end;
    end;
end;