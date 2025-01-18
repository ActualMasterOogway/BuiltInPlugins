local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function() --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v4 (copy), v3 (copy), v6 (copy)
    return function(v7) --[[ Line: 16 ]]
        -- upvalues: v1 (ref), v2 (ref), v5 (ref), v4 (ref), v3 (ref), v6 (ref)
        local v8 = v7:getState();
        local l_SelectedKeyframes_0 = v8.Status.SelectedKeyframes;
        local l_AnimationData_0 = v8.AnimationData;
        if not l_AnimationData_0 or not l_SelectedKeyframes_0 then
            return;
        else
            local v11 = v1.Dictionary.join({}, l_AnimationData_0);
            v11.Instances = v1.Dictionary.join({}, v11.Instances);
            for v12, v13 in pairs(l_SelectedKeyframes_0) do
                v11.Instances[v12] = v1.Dictionary.join({}, v11.Instances[v12]);
                v11.Instances[v12].Tracks = v1.Dictionary.join({}, v11.Instances[v12].Tracks);
                local v14 = v11.Instances[v12];
                for v15, v16 in pairs(v13) do
                    v14.Tracks[v15] = v2(v14.Tracks[v15]);
                    local v17 = v14.Tracks[v15];
                    v5.traverse(v16, v17, function(v18, v19) --[[ Line: 37 ]]
                        -- upvalues: v4 (ref), v3 (ref)
                        if not v18.Selection or not v19.Data then
                            return;
                        else
                            local v20 = v4.getDefaultValue(v19);
                            for v21, _ in pairs(v18.Selection) do
                                if v19.Data[v21] then
                                    v3.setKeyframeData(v19, v21, {
                                        Value = v20
                                    });
                                end;
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            v7:dispatch(v6(v11));
            return;
        end;
    end;
end;