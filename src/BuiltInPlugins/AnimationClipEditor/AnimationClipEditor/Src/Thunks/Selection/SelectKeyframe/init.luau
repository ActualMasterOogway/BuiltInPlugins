local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
return function(v3, v4, v5, v6) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 13 ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (ref), v1 (ref)
        local v8 = v7:getState();
        local l_Status_0 = v8.Status;
        if not l_Status_0 then
            return;
        else
            local l_SelectedKeyframes_0 = l_Status_0.SelectedKeyframes;
            local l_AnimationData_0 = v8.AnimationData;
            if not l_AnimationData_0 then
                return;
            else
                if not l_SelectedKeyframes_0 then
                    l_SelectedKeyframes_0 = {};
                end;
                local v12 = l_AnimationData_0.Instances[v3];
                if v12 == nil then
                    return;
                else
                    local l_Tracks_0 = v12.Tracks;
                    if l_Tracks_0 == nil then
                        return;
                    else
                        local v14 = l_Tracks_0[v4];
                        if v14 == nil then
                            return;
                        else
                            if v14.Data and v14.Data[v5] then
                                if not v6 then
                                    v7:dispatch(v2({
                                        [v3] = {
                                            [v4] = {
                                                [v5] = true
                                            }
                                        }
                                    }));
                                    return;
                                else
                                    local v15 = l_SelectedKeyframes_0[v3] ~= nil and l_SelectedKeyframes_0[v3] or {};
                                    local v16 = v15[v4] ~= nil and v15[v4] or {};
                                    if not v16[v5] then
                                        local v17 = v1.Dictionary.join(v16, {
                                            [v5] = true
                                        });
                                        v7:dispatch(v2(v1.Dictionary.join(l_SelectedKeyframes_0, {
                                            [v3] = v1.Dictionary.join(v15, {
                                                [v4] = v17
                                            })
                                        })));
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;