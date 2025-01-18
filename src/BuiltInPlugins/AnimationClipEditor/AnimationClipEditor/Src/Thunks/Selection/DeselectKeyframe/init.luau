local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v3 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v4 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local function v13(v7, v8) --[[ Line: 19 ]] --[[ Name: findTrack ]]
    local l_v7_0 = v7;
    local v10 = nil;
    for v11, v12 in ipairs(v8) do
        v10 = l_v7_0[v12];
        if not v10 then
            return nil;
        elseif v11 < #v8 then
            if v10.Components then
                l_v7_0 = v10.Components;
            else
                return nil;
            end;
        end;
    end;
    return v10;
end;
local function _(v14) --[[ Line: 43 ]] --[[ Name: isTrackEmpty ]]
    -- upvalues: v2 (copy)
    return (not (v14.Components ~= nil) or v2(v14.Components)) and (v14.Selection == nil or v2(v14.Selection));
end;
return function(v16, v17, v18) --[[ Line: 48 ]]
    -- upvalues: v13 (copy), v1 (copy), v3 (copy), v4 (copy), v2 (copy), v6 (copy)
    return function(v19) --[[ Line: 49 ]]
        -- upvalues: v16 (copy), v13 (ref), v17 (copy), v18 (copy), v1 (ref), v3 (ref), v4 (ref), v2 (ref), v6 (ref)
        local v20 = v19:getState();
        local l_AnimationData_0 = v20.AnimationData;
        local v22 = (v20.Status or {}).SelectedKeyframes or {};
        local v23 = v22[v16] or {};
        local v24 = v13(v23, v17);
        if not v24 or v24.Selection and not v24.Selection[v18] then
            return;
        else
            local v25 = v1.Dictionary.join(v22, {});
            v25[v16] = v1.Dictionary.join(v25[v16], {});
            v25[v16][v17[1]] = v3(v25[v16][v17[1]]);
            v24 = v13(v25[v16], v17);
            if v24 then
                v4.traverse(v24, nil, function(v26) --[[ Line: 76 ]]
                    -- upvalues: v18 (ref), v2 (ref)
                    if v26.Selection then
                        v26.Selection[v18] = nil;
                        if v2(v26.Selection) then
                            v26.Selection = nil;
                        end;
                    end;
                end);
            end;
            local v27 = v25[v16][v17[1]];
            local v28 = l_AnimationData_0.Instances[v16].Tracks[v17[1]];
            v4.traverse(v27, v28, function(v29, v30, v31) --[[ Line: 94 ]]
                -- upvalues: v18 (ref), v27 (copy)
                if v30 and v30.Data and v30.Data[v18] and (not v29.Selection or not v29.Selection[v18]) then
                    local l_v27_0 = v27;
                    for _, v34 in ipairs(v31) do
                        if l_v27_0 then
                            if l_v27_0.Selection then
                                l_v27_0.Selection[v18] = nil;
                            end;
                            l_v27_0 = l_v27_0.Components[v34];
                        end;
                    end;
                end;
            end, function(v35) --[[ Line: 113 ]]
                -- upvalues: v2 (ref)
                if v35.Selection and v2(v35.Selection) then
                    v35.Selection = nil;
                end;
            end);
            v4.traverse(v27, nil, nil, function(v36) --[[ Line: 122 ]]
                -- upvalues: v2 (ref)
                if v36.Components then
                    local l_pairs_0 = pairs;
                    local v38 = v36.Components or {};
                    for v39, v40 in l_pairs_0(v38) do
                        if (not (v40.Components ~= nil) or v2(v40.Components)) and (v40.Selection == nil or v2(v40.Selection)) then
                            v36.Components[v39] = nil;
                        end;
                    end;
                end;
            end);
            if (not (v27.Components ~= nil) or v2(v27.Components)) and (v27.Selection == nil or v2(v27.Selection)) then
                v25[v16][v17[1]] = nil;
                if v2(v25[v16]) then
                    v25[v16] = nil;
                end;
            end;
            v19:dispatch(v6(v25));
            return;
        end;
    end;
end;