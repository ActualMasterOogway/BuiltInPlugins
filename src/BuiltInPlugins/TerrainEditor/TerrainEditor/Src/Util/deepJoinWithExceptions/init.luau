local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v1.BuildSettings;
local l_HeightmapSettings_0 = v1.HeightmapSettings;
local v4 = {
    [l_BuildSettings_0.Material] = true, 
    [l_HeightmapSettings_0.Heightmap] = true, 
    [l_HeightmapSettings_0.Colormap] = true
};
local v5 = {
    [l_BuildSettings_0.MaterialLUT] = true
};
local function v6(v7, v8) --[[ Line: 17 ]] --[[ Name: deepJoinWithExceptions ]]
    -- upvalues: v4 (copy), v6 (copy), v5 (copy)
    local v9 = {};
    for v10, v11 in pairs(v7) do
        if typeof(v11) == "table" then
            if v8[v10] and typeof(v8[v10]) == "table" then
                if v4[v10] then
                    v9[v10] = v6(v8[v10], {});
                else
                    v9[v10] = v6(v11, v8[v10]);
                end;
            elseif v5[v10] then
                v9[v10] = table.clone(v11);
            else
                v9[v10] = v6(v11, {});
            end;
        else
            v9[v10] = v11;
        end;
    end;
    for v12, v13 in pairs(v8) do
        if typeof(v13) == "table" then
            if not v7[v12] then
                v9[v12] = v6(v13, {});
            end;
        else
            v9[v12] = v13;
        end;
    end;
    return v9;
end;
return v6;