local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("Workspace");
local l_Util_0 = script.Parent.Parent.Util;
local v3 = require(l_Util_0.BoundingBoxUtil);
local v4 = require(l_Util_0.Constants);
local v5 = {};
v5.__index = v5;
local function v16(v6) --[[ Line: 13 ]] --[[ Name: getPoints ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy)
    local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v4.ControlPointsAdornmentsFolderName);
    local v8 = {};
    local v9 = {};
    if l_l_CoreGui_0_FirstChild_0 then
        for _, v11 in ipairs(l_l_CoreGui_0_FirstChild_0:GetChildren()) do
            v8[v11.Name] = {};
            for _, v13 in ipairs(v11:GetChildren()) do
                v8[v11.Name][tonumber(v13.Name)] = v13.Adornee.CFrame:ToWorldSpace(v13.CFrame).p;
            end;
        end;
        for _, v15 in pairs(v6) do
            table.insert(v9, v8[v15.MeshName][v15.Index]);
        end;
    end;
    return v9;
end;
local function _(v17, v18) --[[ Line: 34 ]] --[[ Name: computeBoundingBox ]]
    -- upvalues: v16 (copy), v3 (copy)
    local v19 = v16(v17);
    if v18 then
        return v3.getWeightBalanceOrientedBoundingBox(v19);
    else
        return v3.getAxisAlignedBoundingBox(v19);
    end;
end;
local function v25(v21) --[[ Line: 43 ]] --[[ Name: getSelectionTable ]]
    local v22 = {};
    for _, v24 in ipairs(v21) do
        if not v22[v24.MeshName] then
            v22[v24.MeshName] = {};
        end;
        v22[v24.MeshName][v24.Index] = true;
    end;
    return v22;
end;
v5.new = function(v26, v27) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v25 (copy), v16 (copy), v3 (copy)
    local v28 = setmetatable({}, v5);
    local v29 = v26:shouldUseLocalSpace();
    v28._selectionTable = v25(v27);
    local v30 = v16(v27);
    v28._bounds = if v29 then v3.getWeightBalanceOrientedBoundingBox(v30) else v3.getAxisAlignedBoundingBox(v30);
    return v28;
end;
v5.isEmpty = function(v31) --[[ Line: 65 ]] --[[ Name: isEmpty ]]
    local v32 = true;
    if v31._selectionTable ~= nil then
        v32 = next(v31._selectionTable) == nil;
    end;
    return v32;
end;
v5.getBoundingBox = function(v33, _) --[[ Line: 69 ]] --[[ Name: getBoundingBox ]]
    local v35 = Vector3.new(v33._bounds.Width, v33._bounds.Height, v33._bounds.Depth);
    return v33._bounds.CFrame, Vector3.new(), v35;
end;
v5.doesContainItem = function(v36, v37) --[[ Line: 75 ]] --[[ Name: doesContainItem ]]
    if type(v37) ~= "table" then
        return false;
    else
        local v38 = false;
        if v36._selectionTable[v37.MeshName] ~= nil then
            v38 = v36._selectionTable[v37.MeshName][v37.Index] ~= nil;
        end;
        return v38;
    end;
end;
v5.isDynamic = function(_) --[[ Line: 83 ]] --[[ Name: isDynamic ]]
    return false;
end;
return v5;