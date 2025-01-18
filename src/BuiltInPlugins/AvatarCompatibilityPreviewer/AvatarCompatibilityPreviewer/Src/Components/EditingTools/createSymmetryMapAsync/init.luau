local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Packages._Index.LuaMeshEditingModule.LuaMeshEditingModule.Types);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.binarySearchRange);
local v6 = {};
local function _(v7) --[[ Line: 24 ]] --[[ Name: getSymmetricalName ]]
    -- upvalues: v6 (copy)
    if v6[v7] ~= nil then
        return v6[v7];
    else
        local v8 = v7:match("^Left(.+)$");
        if v8 ~= nil then
            local v9 = "Right" .. v8;
            v6[v7] = v9;
            return v9;
        else
            local v10 = v7:match("^Right(.+)$");
            if v10 ~= nil then
                local v11 = "Left" .. v10;
                v6[v7] = v11;
                return v11;
            else
                v6[v7] = v7;
                return v7;
            end;
        end;
    end;
end;
local function _(v13, v14) --[[ Line: 47 ]] --[[ Name: compareUVs ]]
    if math.abs(v13.X - v14.X) <= 1.0E-5 then
        return v13.Y < v14.Y;
    else
        return v13.X < v14.X;
    end;
end;
return function(v16, v17) --[[ Line: 51 ]] --[[ Name: createSymmetryMapAsync ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v1 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v18 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.CageEditingTool.SymmetricalUVs);
    assert(buffer.len(v18) / 32 == buffer.len(v18) // 32, "SymmetricalUVs buffer is not divisible by cursor offset");
    local v20 = v1.filter(v16:GetDescendants(), function(v19) --[[ Line: 62 ]]
        return v19:IsA("WrapTarget");
    end);
    if v17 == nil then
        v17 = warn;
    end;
    assert(v17 ~= nil, v2.LUAU_ANALYZE_ERROR);
    local v21 = {};
    local v22 = {};
    local function v30(v23, v24, v25, v26, v27) --[[ Line: 74 ]] --[[ Name: addSymmetrical ]]
        -- upvalues: v21 (copy)
        if v21[v23] == nil then
            v21[v23] = {};
        end;
        if v21[v23][v24] == nil then
            v21[v23][v24] = {};
        end;
        for _, v29 in v21[v23][v24] do
            if v29.targetName == v25 and v29.vertex == v26 and v29.side == v27 then
                return;
            end;
        end;
        table.insert(v21[v23][v24], {
            targetName = v25, 
            vertex = v26, 
            side = v27
        });
    end;
    local function v41(v31) --[[ Line: 107 ]] --[[ Name: findSymmetricalUVs ]]
        -- upvalues: v5 (ref), v18 (copy)
        local v36 = v5(buffer.len(v18) // 32, function(v32) --[[ Line: 108 ]]
            -- upvalues: v18 (ref), v31 (copy)
            local v33 = buffer.readf64(v18, v32);
            local v34 = buffer.readf64(v18, v32 + 8);
            if Vector3.new(v33, v34):FuzzyEq(v31, 1.0E-7) then
                return "equal";
            elseif math.abs(v33 - v31.X) > 1.0E-7 then
                if v31.X < v33 then
                    return "bigger";
                else
                    return "smaller";
                end;
            elseif v31.Y < v34 then
                return "bigger";
            else
                return "smaller";
            end;
        end, function(v35) --[[ Line: 121 ]]
            return (v35 - 1) * 32;
        end);
        local v37 = {};
        for _, v39 in v36 do
            local v40 = (v39 - 1) * 32;
            table.insert(v37, (Vector3.new(buffer.readf64(v18, v40 + 16), (buffer.readf64(v18, v40 + 24)))));
        end;
        return v37;
    end;
    local function v52(v42) --[[ Line: 137 ]] --[[ Name: findPointsWithUV ]]
        -- upvalues: v5 (ref), v22 (copy)
        local v43 = {};
        for _, v45 in v42 do
            for _, v51 in (v5(#v22, function(v46) --[[ Line: 141 ]]
                -- upvalues: v45 (copy)
                if v46.uv:FuzzyEq(v45) then
                    return "equal";
                else
                    local l_uv_0 = v46.uv;
                    local l_v45_0 = v45;
                    if if math.abs(l_uv_0.X - l_v45_0.X) <= 1.0E-5 then l_uv_0.Y < l_v45_0.Y else l_uv_0.X < l_v45_0.X then
                        return "smaller";
                    else
                        return "bigger";
                    end;
                end;
            end, function(v49) --[[ Line: 147 ]]
                -- upvalues: v22 (ref)
                return v22[v49];
            end)) do
                table.insert(v43, v22[v51]);
            end;
        end;
        return v43;
    end;
    debug.profilebegin("Collect points and UVs");
    for _, v54 in v20 do
        for v55, v56 in v54:GetUVs(Enum.CageType.Outer) do
            table.insert(v22, {
                targetName = v54.Name, 
                vertex = v55, 
                uv = Vector3.new(v56.X, v56.Y), 
                side = v56.X >= 3.5 and "right" or "left"
            });
        end;
    end;
    debug.profileend();
    debug.profilebegin("Sort points and UVs");
    table.sort(v22, function(v57, v58) --[[ Line: 177 ]]
        local l_uv_1 = v57.uv;
        local l_uv_2 = v58.uv;
        if math.abs(l_uv_1.X - l_uv_2.X) <= 1.0E-5 then
            return l_uv_1.Y < l_uv_2.Y;
        else
            return l_uv_1.X < l_uv_2.X;
        end;
    end);
    debug.profileend();
    debug.profilebegin("Create symmetry map");
    for _, v62 in v22 do
        debug.profilebegin("Find what UVs are symmetrical");
        local v63 = v41(v62.uv);
        debug.profileend();
        if #v63 == 0 then
            local v64 = nil;
            for v65 = 0, buffer.len(v18) - 32, 32 do
                if Vector3.new(buffer.readf64(v18, v65), (buffer.readf64(v18, v65 + 8))):FuzzyEq(v62.uv, 1.0E-7) then
                    v64 = 1 + v65 // 32;
                    break;
                end;
            end;
            v17((("Couldn't find symmetrical UVs for %*:%* (at %*), was supposed to find it at index %*"):format(v62.targetName, v62.vertex, v62.uv, v64)));
        else
            debug.profilebegin("Find points with UV");
            for _, v67 in v52(v63) do
                v30(v62.targetName, v62.vertex, v67.targetName, v67.vertex, v62.side);
                v30(v67.targetName, v67.vertex, v62.targetName, v62.vertex, v67.side);
            end;
            debug.profileend();
        end;
    end;
    for _, v69 in v22 do
        local v70 = v21[v69.targetName][v69.vertex];
        local v71 = {};
        for _, v73 in v70 do
            for _, v75 in v21[v73.targetName][v73.vertex] do
                table.insert(v71, v75);
            end;
        end;
        for _, v77 in v71 do
            for _, v79 in v21[v77.targetName][v77.vertex] do
                v30(v69.targetName, v69.vertex, v79.targetName, v79.vertex, v69.side);
            end;
        end;
    end;
    for v80, v81 in v21 do
        for _, v83 in v81 do
            for v84 = #v83, 1, -1 do
                local v85;
                if v6[v80] ~= nil then
                    v85 = v6[v80];
                else
                    local v86 = v80:match("^Left(.+)$");
                    if v86 ~= nil then
                        local v87 = "Right" .. v86;
                        v6[v80] = v87;
                        v85 = v87;
                    else
                        local v88 = v80:match("^Right(.+)$");
                        if v88 ~= nil then
                            local v89 = "Left" .. v88;
                            v6[v80] = v89;
                            v85 = v89;
                        else
                            v6[v80] = v80;
                            v85 = v80;
                        end;
                    end;
                end;
                if v85 ~= v83[v84].targetName then
                    table.remove(v83, v84);
                end;
            end;
        end;
    end;
    debug.profileend();
    return v21;
end;