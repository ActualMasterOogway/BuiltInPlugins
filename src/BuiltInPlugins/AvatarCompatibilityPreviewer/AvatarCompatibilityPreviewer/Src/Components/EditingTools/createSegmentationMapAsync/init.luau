local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Packages._Index.LuaMeshEditingModule.LuaMeshEditingModule.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.CageEditingTool.SegmentationUVs);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.binarySearchRange);
local function _(v6, v7) --[[ Line: 12 ]] --[[ Name: compareUVs ]]
    if math.abs(v6.X - v7.X) <= 1.0E-5 then
        return v6.Y < v7.Y;
    else
        return v6.X < v7.X;
    end;
end;
return function(v9, v10) --[[ Line: 17 ]] --[[ Name: createSegmentationMapAsync ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy)
    if v10 == nil then
        v10 = warn;
    end;
    assert(v10 ~= nil, "Luau");
    debug.profilebegin("createSegmentationMapAsync");
    local v11 = {};
    for _, v13 in v1.LIMBS do
        local l_v9_FirstChild_0 = v9:FindFirstChild(v13);
        if l_v9_FirstChild_0 ~= nil then
            local l_WrapTarget_0 = l_v9_FirstChild_0:FindFirstChildWhichIsA("WrapTarget");
            if l_WrapTarget_0 ~= nil then
                assert(l_WrapTarget_0 ~= nil, "Luau");
                local v16 = v3[v13];
                local v17 = {};
                v11[l_WrapTarget_0.Name] = v17;
                local v18 = {};
                for v19, v20 in l_WrapTarget_0:GetUVs(Enum.CageType.Outer) do
                    table.insert(v18, {
                        index = v19, 
                        uv = Vector3.new(v20.X, v20.Y)
                    });
                end;
                table.sort(v18, function(v21, v22) --[[ Line: 60 ]]
                    local l_uv_0 = v21.uv;
                    local l_uv_1 = v22.uv;
                    if math.abs(l_uv_0.X - l_uv_1.X) <= 1.0E-5 then
                        return l_uv_0.Y < l_uv_1.Y;
                    else
                        return l_uv_0.X < l_uv_1.X;
                    end;
                end);
                local function v33(v25) --[[ Line: 64 ]] --[[ Name: findVertexIndexesWithUV ]]
                    -- upvalues: v5 (ref), v18 (copy)
                    local v29 = v5(#v18, function(v26) --[[ Line: 65 ]]
                        -- upvalues: v25 (copy)
                        if v26:FuzzyEq(v25) then
                            return "equal";
                        else
                            local l_v25_0 = v25;
                            if if math.abs(v26.X - l_v25_0.X) <= 1.0E-5 then v26.Y < l_v25_0.Y else v26.X < l_v25_0.X then
                                return "smaller";
                            else
                                return "bigger";
                            end;
                        end;
                    end, function(v28) --[[ Line: 71 ]]
                        -- upvalues: v18 (ref)
                        return v18[v28].uv;
                    end);
                    local v30 = {};
                    for _, v32 in v29 do
                        table.insert(v30, v18[v32].index);
                    end;
                    return v30;
                end;
                for v34 = 0, buffer.len(v16) - 32, 32 do
                    local v35 = buffer.readf64(v16, v34);
                    local v36 = buffer.readf64(v16, v34 + 8);
                    local v37 = buffer.readf64(v16, v34 + 16);
                    local v38 = buffer.readf64(v16, v34 + 24);
                    local v39 = v33((Vector3.new(v35, v36)));
                    local v40 = v33((Vector3.new(v37, v38)));
                    if #v39 == 0 then
                        v10((("Couldn't find anything with the first pair of UV (%*, %*) in %*"):format(v35, v36, v13)));
                    end;
                    if #v40 == 0 then
                        v10((("Couldn't find anything with the first pair of UV (%*, %*) in %*"):format(v37, v38, v13)));
                    end;
                    for _, v42 in v39 do
                        for _, v44 in v40 do
                            v17[Vector3.new(v42, v44)] = true;
                        end;
                    end;
                end;
            end;
        end;
    end;
    debug.profileend();
    return v11;
end;