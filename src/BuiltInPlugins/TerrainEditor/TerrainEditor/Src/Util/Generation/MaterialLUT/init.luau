local v0 = {};
v0.__index = v0;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local function v15(v4, v5, v6, v7, v8, v9, v10) --[[ Line: 26 ]] --[[ Name: getRangeValue ]]
    local v11 = {};
    local v12 = #v5;
    local v13 = v4 + v4 * v7 * (math.random() * 2 - 1);
    for v14 = 1, v12 do
        if v5[v14][v6][1] <= v13 and v13 <= v5[v14][v6][2] then
            table.insert(v11, v5[v14]);
        end;
    end;
    if #v11 == 0 and v8 then
        if v13 < v9[v6][1] then
            return {
                v9
            };
        elseif v10[v6][2] < v13 then
            return {
                v10
            };
        else
            return nil;
        end;
    else
        return v11;
    end;
end;
local function v18(v16, v17) --[[ Line: 50 ]] --[[ Name: sortByPriority ]]
    return v16.priority < v17.priority;
end;
v0.new = function(v19) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v18 (copy), v15 (copy), v0 (copy)
    local v20 = v19.Unit == v2.MaterialUnit.Percentage;
    local l_MaterialList_0 = v19.MaterialList;
    local l_FillMaterial_0 = v19.FillMaterial;
    local l_FallbackMaterial_0 = v19.FallbackMaterial;
    local v24 = table.create(1050624, l_FallbackMaterial_0);
    local l_Min_0 = v19.Min;
    local l_Max_0 = v19.Max;
    local v27 = {};
    for _, v29 in ipairs(l_MaterialList_0) do
        local v30 = {};
        if v20 then
            local v31 = false;
            if v29.MinHeight <= 1 then
                v31 = v29.MinHeight >= 0;
            end;
            assert(v31, "invalid minimum height input!");
            v31 = false;
            if v29.MaxHeight <= 1 then
                v31 = v29.MaxHeight >= 0;
            end;
            assert(v31, "invalid maximum height input!");
            v30.heightRange = {
                v29.MinHeight, 
                v29.MaxHeight
            };
        else
            local v32 = false;
            if v29.MinHeight <= v29.MaxHeight then
                v32 = v29.MinHeight >= 0;
            end;
            assert(v32, "invalid minimum height input!");
            v30.heightRange = {
                v29.MinHeight, 
                v29.MaxHeight
            };
            l_Min_0 = math.min(l_Min_0, v29.MinHeight);
            l_Max_0 = math.max(l_Max_0, v29.MaxHeight);
        end;
        assert(v29.MinSlope <= v29.MaxSlope, "invalid slope input!");
        local v33 = false;
        if v29.MinSlope <= 90 then
            v33 = v29.MinSlope >= 0;
        end;
        assert(v33, "invalid minimum slope input!");
        v33 = false;
        if v29.MaxSlope <= 90 then
            v33 = v29.MaxSlope >= 0;
        end;
        assert(v33, "invalid maximum slope input!");
        v30.slopeRange = {
            v29.MinSlope / 180 * 3.141592653589793, 
            v29.MaxSlope / 180 * 3.141592653589793
        };
        v30.value = v29.Material;
        v30.priority = v29.Priority;
        table.insert(v27, v30);
    end;
    table.sort(v27, v18);
    for v34 = 1, 1024 do
        local v35 = (v34 - 1) / 1023;
        local v36 = nil;
        v36 = if v20 then v15(v35, v27, "heightRange", 0, false) else v15(v35 * (l_Max_0 - l_Min_0) + l_Min_0, v27, "heightRange", 0, false);
        for v37 = 1, 1024 do
            if not v36 or #v36 == 0 then
                v24[v34 * 1024 + v37] = l_FallbackMaterial_0;
            else
                local v38 = (v37 - 1) / 1023 * 1.5707963267948966;
                local v39 = v15(v38, v36, "slopeRange", 0, false);
                local v40 = if v39 and #v39 > 0 then v39[1].value else l_FallbackMaterial_0;
                v24[v34 * 1024 + v37] = v40;
            end;
        end;
    end;
    local v41 = setmetatable({}, v0);
    v41._lut = v24;
    v41._isPercentage = v20;
    v41._resolution = {
        1024, 
        1024
    };
    if v41._isPercentage then
        v41.GetValue = v41._getValuePercentage;
    else
        v41.GetValue = v41._getValueStud;
    end;
    if v41._isPercentage then
        v41.GetValueByIndex = v41._getValuePercentageSlopeIndex;
    else
        v41.GetValueByIndex = v41._getValueStudSlopeIndex;
    end;
    v41._maxHeight = l_Max_0;
    v41._minHeight = l_Min_0;
    v41._heightRange = l_Max_0 - l_Min_0;
    v41.fallbackMaterial = l_FallbackMaterial_0;
    v41.fillMaterial = l_FillMaterial_0;
    v41.GetSlopeIndex = v41._getSlopeIndex;
    return v41;
end;
v0._getSlopeIndex = function(_, v43) --[[ Line: 159 ]] --[[ Name: _getSlopeIndex ]]
    return (math.clamp(math.floor(v43 / 1.5707963267948966 * 1023 + 1), 1, 1024));
end;
v0._getValuePercentage = function(v44, v45, v46, v47) --[[ Line: 163 ]] --[[ Name: _getValuePercentage ]]
    local v48 = math.clamp(math.floor(v45 / v46 * 1023 + 1), 0, 1025);
    local v49 = math.clamp(math.floor(v47 / 1.5707963267948966 * 1023 + 1), 1, 1024);
    return v44._lut[v48 * 1024 + v49];
end;
v0._getValueStud = function(v50, v51, _, v53) --[[ Line: 169 ]] --[[ Name: _getValueStud ]]
    -- upvalues: v3 (copy)
    local v54 = math.clamp(math.floor((v51 * v3.VoxelResolution - v50._minHeight) / v50._heightRange * 1023 + 1), 0, 1025);
    local v55 = math.clamp(math.floor(v53 / 1.5707963267948966 * 1023 + 1), 1, 1024);
    return v50._lut[v54 * 1024 + v55];
end;
v0._getValuePercentageSlopeIndex = function(v56, v57, v58, v59) --[[ Line: 182 ]] --[[ Name: _getValuePercentageSlopeIndex ]]
    local v60 = math.clamp(math.floor(v57 / v58 * 1023 + 1), 0, 1025);
    return v56._lut[v60 * 1024 + v59];
end;
v0._getValueStudSlopeIndex = function(v61, v62, _, v64) --[[ Line: 191 ]] --[[ Name: _getValueStudSlopeIndex ]]
    -- upvalues: v3 (copy)
    local v65 = math.clamp(math.floor((v62 * v3.VoxelResolution - v61._minHeight) / v61._heightRange * 1023 + 1), 0, 1025);
    return v61._lut[v65 * 1024 + v64];
end;
return v0;