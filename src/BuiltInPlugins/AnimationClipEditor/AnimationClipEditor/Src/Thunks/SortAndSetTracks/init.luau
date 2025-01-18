local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.SkeletonUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.FacsUtils);
local v6 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetTracks);
local function v8(v9, v10) --[[ Line: 24 ]] --[[ Name: setTrackDepth ]]
    -- upvalues: v8 (copy)
    v9.Depth = v10;
    local l_pairs_0 = pairs;
    local v12 = v9.Components or {};
    for _, v14 in l_pairs_0(v12) do
        v8(v14, v10 + 1);
    end;
end;
local function v15(v16, v17, v18) --[[ Line: 31 ]] --[[ Name: depthFirstTraverse ]]
    -- upvalues: v1 (copy), v15 (copy)
    local v19 = v1.Dictionary.keys(v16);
    table.sort(v19);
    for _, v21 in ipairs(v19) do
        local v22 = v16[v21];
        if v17(v21, v18) then
            v15(v22, v17, v18 + 1);
        else
            v15(v22, v17, v18);
        end;
    end;
end;
local _ = function(v23, v24) --[[ Line: 46 ]] --[[ Name: sortByHierarchy ]]
    -- upvalues: v15 (copy), v8 (copy)
    local v25 = {};
    v15(v24, function(v26, v27) --[[ Line: 48 ]]
        -- upvalues: v23 (copy), v8 (ref), v25 (copy)
        for _, v29 in ipairs(v23) do
            if v29.Name == v26 then
                v8(v29, v27);
                table.insert(v25, v29);
                return true;
            end;
        end;
    end, 0);
    return v25;
end;
local function v36(v31) --[[ Line: 61 ]] --[[ Name: sortAlphabetically ]]
    -- upvalues: v8 (copy)
    table.sort(v31, function(v32, v33) --[[ Line: 62 ]]
        return v32.Name < v33.Name;
    end);
    for _, v35 in ipairs(v31) do
        v8(v35, 0);
    end;
    return v31;
end;
return function(v37) --[[ Line: 73 ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy), v15 (copy), v8 (copy), v5 (copy), v1 (copy), v36 (copy), v7 (copy)
    return function(v38) --[[ Line: 74 ]]
        -- upvalues: v6 (ref), v2 (ref), v37 (copy), v4 (ref), v15 (ref), v8 (ref), v5 (ref), v1 (ref), v36 (ref), v7 (ref)
        local l_RootInstance_0 = v38:getState().Status.RootInstance;
        local v40 = nil;
        local v41 = nil;
        local v42 = {};
        if l_RootInstance_0 and (typeof(l_RootInstance_0) == "Instance" or not v6() and type(l_RootInstance_0) == "table") then
            if not v6() and (l_RootInstance_0.ClassName == "Skeleton" or l_RootInstance_0.ClassName == "MockSkeleton") then
                local v43 = nil;
                local v44 = nil;
                if l_RootInstance_0.ClassName == "Skeleton" then
                    local l_l_RootInstance_0_Bones_0 = l_RootInstance_0:GetBones();
                    v43 = l_l_RootInstance_0_Bones_0.Names;
                    v44 = l_l_RootInstance_0_Bones_0.Parents;
                else
                    v43 = l_RootInstance_0.Names;
                    v44 = l_RootInstance_0.Parents;
                end;
                v41 = v2.buildSkeletonHierarchy(v43, v44);
                v42 = v2.getUnusedSkeletonTracks(v43, v37);
            elseif l_RootInstance_0.ClassName == "Model" and l_RootInstance_0:FindFirstChildOfClass("Humanoid") or l_RootInstance_0:FindFirstChildOfClass("AnimationController") then
                v41 = v4.buildRigHierarchy(l_RootInstance_0);
                v42 = v4.getUnusedRigTracks(l_RootInstance_0, v37);
            end;
        end;
        if v41 then
            local l_v37_0 = v37;
            local l_v41_0 = v41;
            local v48 = {};
            local l_l_v37_0_0 = l_v37_0 --[[ copy: 6 -> 9 ]];
            v15(l_v41_0, function(v50, v51) --[[ Line: 48 ]]
                -- upvalues: l_l_v37_0_0 (copy), v8 (ref), v48 (copy)
                for _, v53 in ipairs(l_l_v37_0_0) do
                    if v53.Name == v50 then
                        v8(v53, v51);
                        table.insert(v48, v53);
                        return true;
                    end;
                end;
            end, 0);
            v40 = v48;
            l_v37_0 = v5.filterFacsTracks(v37);
            v40 = v1.List.join(v40, (v36(l_v37_0)));
        else
            v40 = v36(v37);
        end;
        local v54 = v5.getUnusedFacs(v37);
        v38:dispatch(v7(v40, v42, v54));
    end;
end;