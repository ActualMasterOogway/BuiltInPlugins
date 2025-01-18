local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
return function(v8) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy), v4 (copy), v3 (copy), v6 (copy), v5 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v2 (ref), v7 (ref), v4 (ref), v8 (copy), v3 (ref), v6 (ref), v5 (ref)
        local v10 = v9:getState();
        local l_SelectedKeyframes_0 = v10.Status.SelectedKeyframes;
        local l_AnimationData_0 = v10.AnimationData;
        local l_EditorMode_0 = v10.Status.EditorMode;
        if not l_AnimationData_0 or not l_SelectedKeyframes_0 then
            return;
        else
            local v14 = v1.Dictionary.join({}, l_AnimationData_0);
            v14.Instances = v1.Dictionary.join({}, v14.Instances);
            for v15, v16 in pairs(l_SelectedKeyframes_0) do
                v14.Instances[v15] = v1.Dictionary.join({}, v14.Instances[v15]);
                v14.Instances[v15].Tracks = v1.Dictionary.join({}, v14.Instances[v15].Tracks);
                local v17 = v14.Instances[v15];
                for v18, v19 in pairs(v16) do
                    v17.Tracks[v18] = v2(v17.Tracks[v18]);
                    local v20 = v17.Tracks[v18];
                    local v21 = false;
                    local v22 = false;
                    do
                        local l_v21_0, l_v22_0 = v21, v22;
                        v7.traverse(v19, v20, function(v25, v26) --[[ Line: 41 ]]
                            -- upvalues: l_v21_0 (ref), v4 (ref), v8 (ref), v18 (copy), l_EditorMode_0 (copy), v14 (copy), v3 (ref), l_v22_0 (ref)
                            if not v25.Selection then
                                return;
                            else
                                l_v21_0 = true;
                                for v27, _ in pairs(v25.Selection) do
                                    if v26.Data and v26.Data[v27] then
                                        v4.deleteKeyframe(v26, v27);
                                        v8:report("onDeleteKeyframe", v18, l_EditorMode_0, if v14.Metadata then v14.Metadata.Guid else nil);
                                    end;
                                end;
                                if v26.Data and not v3(v26.Data) then
                                    l_v22_0 = true;
                                end;
                                return;
                            end;
                        end);
                        if l_v21_0 and not l_v22_0 then
                            v17.Tracks[v18] = nil;
                        end;
                    end;
                end;
            end;
            v9:dispatch(v6(v14));
            v9:dispatch(v5({}));
            return;
        end;
    end;
end;