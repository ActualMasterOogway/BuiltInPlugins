local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local function v17(v4, v5, v6) --[[ Line: 13 ]] --[[ Name: traverseKeyframes ]]
    local l_Instances_0 = v4.Instances;
    for v8, v9 in pairs(l_Instances_0) do
        local l_Tracks_0 = v9.Tracks;
        for v11, v12 in pairs(l_Tracks_0) do
            local l_Keyframes_0 = v12.Keyframes;
            if v6 then
                for v14 = #l_Keyframes_0, 1, -1 do
                    v5(v8, v11, l_Keyframes_0[v14]);
                end;
            else
                for _, v16 in ipairs(l_Keyframes_0) do
                    v5(v8, v11, v16);
                end;
            end;
        end;
    end;
end;
local function v26(v18, v19) --[[ Line: 33 ]] --[[ Name: traverseCenters ]]
    for v20, v21 in pairs(v18) do
        for v22, v23 in pairs(v21) do
            for v24, v25 in pairs(v23) do
                v19(v20, v22, v24, v25);
            end;
        end;
    end;
end;
return function() --[[ Line: 43 ]]
    -- upvalues: v1 (copy), v17 (copy), v26 (copy), v2 (copy), v3 (copy)
    return function(v27) --[[ Line: 44 ]]
        -- upvalues: v1 (ref), v17 (ref), v26 (ref), v2 (ref), v3 (ref)
        local l_AnimationData_0 = v27:getState().AnimationData;
        if not l_AnimationData_0 then
            return;
        else
            local v29 = v1(l_AnimationData_0);
            local v30 = {};
            local v31 = {};
            v17(v29, function(v32, v33, v34) --[[ Line: 56 ]]
                -- upvalues: v30 (copy), v31 (copy)
                local v35 = math.floor(v34);
                if v34 ~= v35 then
                    v30[v32] = v30[v32] or {};
                    v31[v32] = v31[v32] or {};
                    v30[v32][v33] = v30[v32][v33] or {};
                    v31[v32][v33] = v31[v32][v33] or {};
                    local v36 = v30[v32][v33];
                    local v37 = v31[v32][v33];
                    v36[v35] = v36[v35] == nil and v34 or v36[v35];
                    v37[v35] = v37[v35] == nil and v34 or math.max(v37[v35], v34);
                end;
            end);
            v26(v30, function(v38, v39, v40, v41) --[[ Line: 72 ]]
                -- upvalues: v29 (copy), v2 (ref), v31 (copy)
                local v42 = v29.Instances[v38].Tracks[v39];
                if not v42.Data[v40] then
                    v2.moveKeyframe(v42, v41, v40);
                    v2.moveNamedKeyframe(v29, v41, v40);
                    if v31[v38] and v31[v38][v39] and v31[v38][v39][v40] == v41 then
                        v31[v38][v39][v40] = nil;
                    end;
                end;
            end);
            v26(v31, function(v43, v44, v45, v46) --[[ Line: 90 ]]
                -- upvalues: v29 (copy), v2 (ref)
                local v47 = v29.Instances[v43].Tracks[v44];
                if not v47.Data[v45 + 1] then
                    v2.moveKeyframe(v47, v46, v45 + 1);
                    v2.moveNamedKeyframe(v29, v46, v45 + 1);
                end;
            end);
            v17(v29, function(v48, v49, v50) --[[ Line: 100 ]]
                -- upvalues: v29 (copy), v2 (ref)
                if v50 ~= math.floor(v50) then
                    local v51 = v29.Instances[v48].Tracks[v49];
                    v2.deleteKeyframe(v51, v50);
                end;
            end, true);
            v27:dispatch(v3(v29));
            return;
        end;
    end;
end;