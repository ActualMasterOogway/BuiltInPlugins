local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.deepCopy);
local function v6(v2) --[[ Line: 11 ]] --[[ Name: weightPreSelectedPoints ]]
    local v3 = {};
    for _, v5 in ipairs(v2) do
        if not v3[v5.MeshName] then
            v3[v5.MeshName] = {};
        end;
        v3[v5.MeshName][v5.Index] = 1;
    end;
    return v3;
end;
local function _(v7, v8, v9) --[[ Line: 22 ]] --[[ Name: shouldWeightPoint ]]
    return not v7[v8] or v7[v8][v9] == nil or v7[v8][v9] < 1;
end;
local function v18(v11, v12, v13, v14, v15) --[[ Line: 26 ]] --[[ Name: setPointWeight ]]
    local v16 = 1 - v14 / v15;
    if not v11[v12] then
        v11[v12] = {};
    end;
    if not v11[v12][v13] then
        v11[v12][v13] = 0;
    end;
    local v17 = v11[v12][v13];
    v11[v12][v13] = math.max(v17, (math.clamp(v16, 0, 1)));
end;
local function v36(v19, v20, v21, v22, v23) --[[ Line: 38 ]] --[[ Name: addNeighborsToQueue ]]
    local l_VertexData_0 = v19.VertexData;
    local l_TriangleIndexData_0 = v19.TriangleIndexData;
    local l_VertexTriangleIndexData_0 = v19.VertexTriangleIndexData;
    local v27 = l_VertexData_0[v23.MeshName][v23.Index];
    local v28 = l_VertexTriangleIndexData_0[v23.MeshName][v23.Index];
    for _, v30 in ipairs(v28) do
        local v31 = l_TriangleIndexData_0[v23.MeshName][v30];
        for _, v33 in ipairs(v31) do
            if v33 ~= v23.Index then
                local l_Magnitude_0 = (l_VertexData_0[v23.MeshName][v33] - v27).Magnitude;
                if v23.Distance + l_Magnitude_0 < v22 then
                    local l_MeshName_0 = v23.MeshName;
                    if not v21[l_MeshName_0] or v21[l_MeshName_0][v33] == nil or v21[l_MeshName_0][v33] < 1 then
                        table.insert(v20, {
                            Index = v33, 
                            MeshName = v23.MeshName, 
                            Distance = v23.Distance + l_Magnitude_0
                        });
                    end;
                end;
            end;
        end;
    end;
end;
local function v48(v37, v38, v39, v40, v41) --[[ Line: 63 ]] --[[ Name: checkSeams ]]
    local l_SeamData_0 = v37.SeamData;
    local v43 = l_SeamData_0[v41.MeshName] and l_SeamData_0[v41.MeshName][v41.Index];
    if v43 then
        for _, v45 in ipairs(v43) do
            if v41.Distance < v40 then
                local l_MeshName_1 = v45.MeshName;
                local l_Index_0 = v45.Index;
                if not v39[l_MeshName_1] or v39[l_MeshName_1][l_Index_0] == nil or v39[l_MeshName_1][l_Index_0] < 1 then
                    table.insert(v38, {
                        Index = v45.Index, 
                        MeshName = v45.MeshName, 
                        Distance = v41.Distance
                    });
                end;
            end;
        end;
    end;
end;
local function v57(v49, v50, v51, v52) --[[ Line: 80 ]] --[[ Name: makeStartingQueue ]]
    -- upvalues: v36 (copy), v48 (copy)
    local v53 = {};
    for _, v55 in ipairs(v51) do
        local v56 = {
            MeshName = v55.MeshName, 
            Index = v55.Index, 
            Distance = 0
        };
        v36(v49, v53, v50, v52, v56);
        v48(v49, v53, v50, v52, v56);
    end;
    return v53;
end;
local function v68(v58, v59, v60, v61) --[[ Line: 96 ]] --[[ Name: softSelect ]]
    -- upvalues: v1 (copy), v57 (copy), v18 (copy), v36 (copy), v48 (copy)
    if v61 == 0 then
        return;
    else
        local v62 = v1(v59);
        local v63 = v57(v58, v59, v60, v61);
        while #v63 > 0 do
            local v64 = v63[1];
            local l_MeshName_2 = v64.MeshName;
            local l_Index_1 = v64.Index;
            if not v59[l_MeshName_2] or v59[l_MeshName_2][l_Index_1] == nil or v59[l_MeshName_2][l_Index_1] < 1 then
                local l_Distance_0 = v64.Distance;
                if l_Distance_0 < v61 then
                    v18(v59, v64.MeshName, v64.Index, l_Distance_0, v61);
                end;
            else
                v64.Distance = 0;
            end;
            if not v62[v64.MeshName] then
                v62[v64.MeshName] = {};
            end;
            if v62[v64.MeshName][v64.Index] == nil then
                v62[v64.MeshName][v64.Index] = true;
                v36(v58, v63, v59, v61, v64);
                v48(v58, v63, v59, v61, v64);
            end;
            table.remove(v63, 1);
        end;
        return;
    end;
end;
return function(v69, v70, v71) --[[ Line: 132 ]]
    -- upvalues: v6 (copy), v68 (copy)
    if not v69 then
        return;
    else
        local v72 = {
            VertexData = v69:getVertexData(), 
            SeamData = v69:getSeamData(), 
            VertexTriangleIndexData = v69:getVertexTriangleIndexData(), 
            TriangleIndexData = v69:getTriangleIndexData()
        };
        local v73 = v6(v70);
        v68(v72, v73, v70, v71);
        return v73;
    end;
end;