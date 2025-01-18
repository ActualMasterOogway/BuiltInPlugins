local l_script_FirstAncestor_0 = script:FindFirstAncestor("LuaMeshEditingModule");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.deepCopy);
local v4 = {};
local _ = function(v5) --[[ Line: 11 ]] --[[ Name: isVectorArray ]]
    local _, v7 = next(v5);
    return typeof(v7) == "Vector3";
end;
local _ = function(v9) --[[ Line: 16 ]] --[[ Name: isPartArray ]]
    local _, v11 = next(v9);
    if typeof(v11) == "Instance" then
        return v11:IsA("BasePart");
    else
        return false;
    end;
end;
local _ = function(v13) --[[ Line: 24 ]] --[[ Name: isCFrameArray ]]
    local _, v15 = next(v13);
    return typeof(v15) == "CFrame";
end;
local _ = function(v17) --[[ Line: 29 ]] --[[ Name: isEmpty ]]
    if not v17 then
        return true;
    else
        local _, v19 = next(v17);
        if not v19 then
            return true;
        else
            return false;
        end;
    end;
end;
local _ = function(v21) --[[ Line: 42 ]] --[[ Name: hasOnlyOnePoint ]]
    if not v21 then
        return false;
    else
        local v22 = 0;
        for _ in pairs(v21) do
            v22 = v22 + 1;
        end;
        if v22 == 1 then
            return true;
        else
            return false;
        end;
    end;
end;
local function _() --[[ Line: 59 ]] --[[ Name: getEmptyBoundingBox ]]
    return {
        Center = Vector3.new(), 
        Centroid = Vector3.new(), 
        Width = 0, 
        Height = 0, 
        Depth = 0, 
        CFrame = CFrame.new()
    };
end;
local function v31(v26, v27) --[[ Line: 70 ]] --[[ Name: createBasis ]]
    local v28 = Vector3.new(0, 0, 1, 0);
    local v29 = Vector3.new(0, 1, 0, 0);
    local v30 = Vector3.new(1, 0, 0, 0);
    if v27 == Enum.Axis.Z then
        v28 = v26;
        if v28:FuzzyEq(v29) then
            v29 = v30;
        end;
        v30 = v29:Cross(v28);
        v29 = v28:Cross(v30);
    elseif v27 == Enum.Axis.Y then
        v29 = v26;
        if v28:FuzzyEq(v29) then
            v28 = v30;
        end;
        v30 = v29:Cross(v28);
        v28 = v30:Cross(v29);
    else
        v30 = v26;
        if v30:FuzzyEq(v29) then
            v29 = v28;
        end;
        v28 = v30:Cross(v29);
        v29 = v28:Cross(v30);
    end;
    return CFrame.fromMatrix(Vector3.new(0, 0, 0, 0), v30.Unit, v29.Unit, v28.Unit);
end;
local function v44(v32, v33) --[[ Line: 95 ]] --[[ Name: getWeightedDirectionFromPoints ]]
    -- upvalues: v4 (copy)
    local l_Center_0 = v33.Center;
    local l_Direction_0 = v33.Direction;
    local v36 = {};
    local v37 = {};
    local v38, v39 = next(v32);
    local v40 = typeof(v39) == "Vector3";
    for _, v42 in ipairs(v32) do
        local v43 = if v40 then v42 else v42.Position;
        if l_Direction_0 == Enum.Axis.Z then
            if v43.Z >= l_Center_0.Z then
                table.insert(v36, v43);
            else
                table.insert(v37, v43);
            end;
        elseif l_Direction_0 == Enum.Axis.Y then
            if v43.Y >= l_Center_0.Y then
                table.insert(v36, v43);
            else
                table.insert(v37, v43);
            end;
        elseif v43.X >= l_Center_0.X then
            table.insert(v36, v43);
        else
            table.insert(v37, v43);
        end;
    end;
    v38 = v4.getAxisAlignedBoundingBox(v36);
    v39 = v4.getAxisAlignedBoundingBox(v37);
    return (v38.Centroid - v39.Centroid).Unit;
end;
v4.getWeightBalanceOrientedBoundingBox = function(v45) --[[ Line: 135 ]] --[[ Name: getWeightBalanceOrientedBoundingBox ]]
    -- upvalues: v1 (copy), v4 (copy), v44 (copy), v31 (copy), v3 (copy)
    local v46;
    if not v45 then
        v46 = true;
    else
        local _, v48 = next(v45);
        v46 = not v48;
    end;
    if v46 then
        if not v1() then
            warn("Points was empty");
        end;
        return {
            Center = Vector3.new(), 
            Centroid = Vector3.new(), 
            Width = 0, 
            Height = 0, 
            Depth = 0, 
            CFrame = CFrame.new()
        };
    else
        v46 = v4.getAxisAlignedBoundingBox(v45);
        local v49;
        if not v45 then
            v49 = false;
        else
            local v50 = 0;
            for _ in pairs(v45) do
                v50 = v50 + 1;
            end;
            v49 = v50 == 1;
        end;
        if v49 then
            return v46;
        else
            v49 = v44(v45, v46);
            local v52 = v31(v49, v46.Direction);
            local v53 = v3(v45);
            local v54, v55 = next(v45);
            local v56 = typeof(v55) == "Vector3";
            for v57, v58 in pairs(v53) do
                if v56 then
                    v53[v57] = v52:inverse() * v58;
                else
                    v58.Position = v52:inverse() * v58.Position;
                end;
            end;
            v54 = v4.getAxisAlignedBoundingBox(v53);
            v54.Center = v52 * v54.Center;
            v54.CFrame = v52 + v54.Center;
            v54.Direction = v49;
            v54.Centroid = v46.Centroid;
            for v59, v60 in pairs(v54.Top) do
                for v61, v62 in pairs(v60) do
                    v54.Top[v59][v61] = v52 * v62;
                end;
            end;
            for v63, v64 in pairs(v54.Bottom) do
                for v65, v66 in pairs(v64) do
                    v54.Bottom[v63][v65] = v52 * v66;
                end;
            end;
            return v54;
        end;
    end;
end;
v4.getAxisAlignedBoundingBox = function(v67) --[[ Line: 185 ]] --[[ Name: getAxisAlignedBoundingBox ]]
    -- upvalues: v1 (copy)
    local v68;
    if not v67 then
        v68 = true;
    else
        local _, v70 = next(v67);
        v68 = not v70;
    end;
    if v68 then
        if not v1() then
            warn("Points was empty");
        end;
        return {
            Center = Vector3.new(), 
            Centroid = Vector3.new(), 
            Width = 0, 
            Height = 0, 
            Depth = 0, 
            CFrame = CFrame.new()
        };
    else
        local v71, v72 = next(v67);
        local v73 = typeof(v72) == "Vector3";
        if not v73 then
            v71, v72 = next(v67);
            v73 = typeof(v72) == "Instance" and v72:IsA("BasePart");
            if not v73 then
                v71, v72 = next(v67);
                v73 = typeof(v72) == "CFrame";
            end;
        end;
        assert(v73, "Array of points must be: BaseParts, Vector3's, or CFrames");
        v68, v73 = next(v67);
        local v74;
        v72, v74 = next(v67);
        v71 = typeof(v74) == "Vector3";
        v72 = if v71 then v73.X else v73.Position.X;
        v74 = if v71 then v73.Y else v73.Position.Y;
        local v75 = if v71 then v73.Z else v73.Position.Z;
        local l_v72_0 = v72;
        local l_v74_0 = v74;
        local l_v75_0 = v75;
        local v79 = Vector3.new(0, 0, 0, 0);
        for _, v81 in ipairs(v67) do
            local v82 = if v71 then v81 else v81.Position;
            v72 = math.min(v82.X, v72);
            l_v72_0 = math.max(v82.X, l_v72_0);
            v74 = math.min(v82.Y, v74);
            l_v74_0 = math.max(v82.Y, l_v74_0);
            v75 = math.min(v82.Z, v75);
            l_v75_0 = math.max(v82.Z, l_v75_0);
            v79 = v79 + v82;
        end;
        local v83 = v79 / #v67;
        local v84 = {
            Center = Vector3.new(l_v72_0 + v72, l_v74_0 + v74, l_v75_0 + v75) / 2, 
            Centroid = v83, 
            Width = math.abs(l_v72_0 - v72), 
            Height = math.abs(l_v74_0 - v74), 
            Depth = math.abs(l_v75_0 - v75), 
            Top = {
                Front = {
                    Left = Vector3.new(v72, l_v74_0, v75), 
                    Right = Vector3.new(l_v72_0, l_v74_0, v75)
                }, 
                Back = {
                    Left = Vector3.new(v72, l_v74_0, l_v75_0), 
                    Right = Vector3.new(l_v72_0, l_v74_0, l_v75_0)
                }
            }, 
            Bottom = {
                Front = {
                    Left = Vector3.new(v72, v74, v75), 
                    Right = Vector3.new(l_v72_0, v74, v75)
                }, 
                Back = {
                    Left = Vector3.new(v72, v74, l_v75_0), 
                    Right = Vector3.new(l_v72_0, v74, l_v75_0)
                }
            }
        };
        if v84.Width >= v84.Height and v84.Width >= v84.Depth then
            v84.Direction = Enum.Axis.X;
        elseif v84.Height >= v84.Width and v84.Height >= v84.Depth then
            v84.Direction = Enum.Axis.Y;
        else
            v84.Direction = Enum.Axis.Z;
        end;
        v84.CFrame = CFrame.new(v84.Center);
        return v84;
    end;
end;
return v4;