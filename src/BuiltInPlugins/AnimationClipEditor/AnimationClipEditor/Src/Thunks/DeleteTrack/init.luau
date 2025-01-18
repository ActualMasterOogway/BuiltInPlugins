local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTracks);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.SetSelectedTracks);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function(v10, v11) --[[ Line: 19 ]]
    -- upvalues: v9 (copy), v7 (copy), v1 (copy), v6 (copy), v4 (copy), v3 (copy), v2 (copy), v8 (copy), v5 (copy)
    return function(v12) --[[ Line: 20 ]]
        -- upvalues: v10 (copy), v9 (ref), v7 (ref), v1 (ref), v6 (ref), v4 (ref), v3 (ref), v2 (ref), v8 (ref), v5 (ref), v11 (copy)
        local v13 = v12:getState();
        local l_Status_0 = v13.Status;
        local l_Tracks_0 = l_Status_0.Tracks;
        local l_SelectedTracks_0 = l_Status_0.SelectedTracks;
        local l_RootInstance_0 = l_Status_0.RootInstance;
        local l_EditorMode_0 = l_Status_0.EditorMode;
        if l_RootInstance_0 == nil then
            return;
        else
            local v19 = nil;
            for v20, v21 in ipairs(l_Tracks_0) do
                if v21.Name == v10 then
                    v19 = v20;
                end;
            end;
            if l_SelectedTracks_0 then
                for v22, v23 in ipairs(l_SelectedTracks_0) do
                    if v10 == v23[1] then
                        table.remove(l_SelectedTracks_0, v22);
                        break;
                    end;
                end;
                if v9() then
                    v12:dispatch(v7(v1.Dictionary.join(l_SelectedTracks_0)));
                else
                    v12:dispatch(v6(v1.Dictionary.join(l_SelectedTracks_0)));
                end;
            end;
            if v19 then
                local v24 = v1.List.removeIndex(l_Tracks_0, v19);
                v12:dispatch(v4(v24));
                local l_AnimationData_0 = v13.AnimationData;
                if not l_AnimationData_0 then
                    return;
                else
                    for v26, v27 in pairs(l_AnimationData_0.Instances) do
                        for v28, _ in pairs(v27.Tracks) do
                            if v28 == v10 then
                                local v30 = v28.Keyframes and not v3(v28.Keyframes);
                                local v31 = v2(l_AnimationData_0);
                                v31.Instances[v26].Tracks[v28] = nil;
                                v12:dispatch(v8(v31));
                                v12:dispatch(v5({}));
                                v11:report("onTrackDeleted", v10, v30, l_EditorMode_0, if l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil);
                                return;
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;