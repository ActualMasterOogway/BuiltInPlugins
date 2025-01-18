local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v4 = require(l_DraggerFramework_0.Utility.BoundingBox);
local v5 = require(l_Parent_0.Src.Utility.AlignmentMode);
local v6 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local v7 = require(l_Parent_0.Src.Utility.getDefaultBasisForObjects);
local v8 = Color3.fromRGB(253, 244, 161);
local v9 = Vector3.new();
local v10 = CFrame.fromMatrix(v9, Vector3.new(-1, 0, 0, 0), (Vector3.new(0, 1, 0, 0)));
local v11 = {
    Vector3.new(0.5, 0.5, 0.5, 0), 
    Vector3.new(-0.5, 0.5, 0.5, 0), 
    Vector3.new(-0.5, -0.5, 0.5, 0), 
    Vector3.new(0.5, -0.5, 0.5, 0), 
    Vector3.new(0.5, 0.5, -0.5, 0), 
    Vector3.new(-0.5, 0.5, -0.5, 0), 
    Vector3.new(-0.5, -0.5, -0.5, 0), 
    (Vector3.new(0.5, -0.5, -0.5, 0))
};
local v12 = {
    {
        v11[1], 
        v11[2]
    }, 
    {
        v11[2], 
        v11[3]
    }, 
    {
        v11[3], 
        v11[4]
    }, 
    {
        v11[4], 
        v11[1]
    }, 
    {
        v11[5], 
        v11[6]
    }, 
    {
        v11[6], 
        v11[7]
    }, 
    {
        v11[7], 
        v11[8]
    }, 
    {
        v11[8], 
        v11[5]
    }, 
    {
        v11[1], 
        v11[5]
    }, 
    {
        v11[2], 
        v11[6]
    }, 
    {
        v11[3], 
        v11[7]
    }, 
    {
        v11[4], 
        v11[8]
    }
};
local function _(v13) --[[ Line: 61 ]] --[[ Name: getAxisCount ]]
    return (v13.X and 1 or 0) + (v13.Y and 1 or 0) + (v13.Z and 1 or 0);
end;
getNormal = function(v15) --[[ Line: 65 ]] --[[ Name: getNormal ]]
    return (Vector3.new(v15.X and 1 or 0, v15.Y and 1 or 0, v15.Z and 1 or 0));
end;
getDirection = function(v16) --[[ Line: 69 ]] --[[ Name: getDirection ]]
    return Vector3.new(1, 1, 1, 0) - getNormal(v16);
end;
rotateVector = function(v17) --[[ Line: 73 ]] --[[ Name: rotateVector ]]
    return (Vector3.new(v17.Z, v17.X, v17.Y));
end;
getSmallestObjectSize = function(v18) --[[ Line: 77 ]] --[[ Name: getSmallestObjectSize ]]
    local v19 = 1e999;
    for _, v21 in pairs(v18) do
        v19 = math.min(v19, v21.size.Magnitude);
    end;
    return v19;
end;
getModifiedSize = function(v22) --[[ Line: 86 ]] --[[ Name: getModifiedSize ]]
    if v22 < 10 then
        return v22;
    elseif v22 < 110 then
        return 10 + (v22 - 10) / 100 * 12;
    else
        return 22;
    end;
end;
local function v29(v23, _, _, v26, v27) --[[ Line: 96 ]] --[[ Name: renderAlignToPoint ]]
    -- upvalues: v2 (copy), l_Workspace_0 (copy), v8 (copy)
    local v28 = v27 * 0.05;
    v23.SphereNormal = v2.createElement("SphereHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Radius = v28, 
        Color3 = v8, 
        CFrame = CFrame.new(v26), 
        ZIndex = 0
    });
    v23.SphereOnTop = v2.createElement("SphereHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Radius = v28, 
        AlwaysOnTop = true, 
        Transparency = 0.3, 
        Color3 = v8, 
        CFrame = CFrame.new(v26), 
        ZIndex = 0
    });
end;
local function v46(v30, v31, v32, v33, v34, v35) --[[ Line: 116 ]] --[[ Name: renderAlignToAxis ]]
    -- upvalues: v2 (copy), l_Workspace_0 (copy), v8 (copy), v10 (copy)
    local v36 = (v32 * v34).Magnitude + 1;
    local v37 = v31:VectorToWorldSpace(v34);
    local v38 = 0.5 * v36 * v37;
    v33 = v33 - v31:PointToObjectSpace(v33):Dot(v34) * v37;
    local v39 = v33 - v38;
    local v40 = CFrame.lookAt(v33, v39);
    local v41 = 0.01 * v35;
    v30.MainLineNormal = v2.createElement("CylinderHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v36, 
        Radius = v41, 
        Color3 = v8, 
        CFrame = v40, 
        ZIndex = 1
    });
    v30.MainLineOnTop = v2.createElement("CylinderHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v36, 
        Radius = v41, 
        AlwaysOnTop = true, 
        Transparency = 0.3, 
        Color3 = v8, 
        CFrame = v40, 
        ZIndex = 1
    });
    local v42 = 0.03 * v35;
    local v43 = 0.1 * v35;
    local v44 = 0.0325 * v35;
    local v45 = CFrame.new(0, 0, v36 * 0.5 + v43 - v44);
    v30.Cone1 = v2.createElement("ConeHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v43, 
        Radius = v42, 
        Color3 = v8, 
        ZIndex = 1, 
        CFrame = v40 * v45
    });
    v30.Cone2 = v2.createElement("ConeHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Height = v43, 
        Radius = v42, 
        Color3 = v8, 
        ZIndex = 1, 
        CFrame = v40 * v10 * v45
    });
end;
local function v60(v47, v48, v49, v50, v51) --[[ Line: 176 ]] --[[ Name: renderAlignToPlane ]]
    -- upvalues: v2 (copy), l_Workspace_0 (copy), v8 (copy), v9 (copy)
    local v52 = Vector3.new(1, 1, 1, 0) - v51;
    local v53 = v48:PointToObjectSpace(v50) * (v51 * Vector3.new(1.0010000467300415, 1.0010000467300415, 1.0010000467300415, 0));
    v49 = (v49 + Vector3.new(1, 1, 1, 0)) * v52;
    v48 = v48 * CFrame.new(v53);
    v47.Plane = v2.createElement("BoxHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        Size = v49, 
        CFrame = v48, 
        Transparency = 0.3, 
        Color3 = v8, 
        ZIndex = 0
    });
    local v54 = rotateVector(v51);
    local v55 = rotateVector(v54);
    for v56 = 1, 4 do
        local l_Magnitude_0 = (v55 * v49).Magnitude;
        local v58 = 0.5 * (v54 * v49).Magnitude;
        v47["Line" .. v56] = v2.createElement("LineHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            Length = l_Magnitude_0, 
            CFrame = v48 * CFrame.fromMatrix(v9, v54, v51) * CFrame.new(v58, 0, 0.5 * l_Magnitude_0), 
            AlwaysOnTop = true, 
            Thickness = 3, 
            Color3 = v8, 
            ZIndex = 0
        });
        local l_v55_0 = v55;
        v55 = -v54;
        v54 = l_v55_0;
    end;
end;
local v61 = {
    "EdgeA", 
    "EdgeB", 
    "EdgeC", 
    "EdgeD", 
    "EdgeE", 
    "EdgeF", 
    "EdgeG", 
    "EdgeH", 
    "EdgeI", 
    "EdgeJ", 
    "EdgeK", 
    "EdgeL"
};
local function v69(v62, v63, v64) --[[ Line: 225 ]] --[[ Name: renderBounds ]]
    -- upvalues: v12 (copy), v61 (copy), v2 (copy), l_Workspace_0 (copy), v8 (copy)
    for v65, v66 in pairs(v12) do
        local v67 = v63:PointToWorldSpace(v64 * v66[1]);
        local v68 = v63:PointToWorldSpace(v64 * v66[2]);
        v62[v61[v65]] = v2.createElement("LineHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            ZIndex = 0, 
            Thickness = 1, 
            Length = (v68 - v67).Magnitude, 
            CFrame = CFrame.lookAt(v67, v68), 
            Color3 = v8
        });
    end;
end;
return function(v70, v71, v72, v73, v74) --[[ Line: 240 ]]
    -- upvalues: v6 (copy), v7 (copy), v4 (copy), v5 (copy), v29 (copy), v46 (copy), v60 (copy), v69 (copy), v2 (copy)
    if #v70 == 0 then
        return nil;
    else
        local v75 = nil;
        v75 = if v71 == v6.Local then v7(v74 and {
            v74
        } or v70) else CFrame.new();
        local v76, v77, v78 = v4.fromObjectsComputeAll(v70, v75);
        local v79 = nil;
        local v80 = nil;
        if v74 then
            local v81 = v78[v74];
            v79 = v75:PointToWorldSpace(v81.offset);
            v80 = v75:VectorToWorldSpace(v81.size);
        else
            v79 = v75:PointToWorldSpace(v76);
            v80 = v75:VectorToWorldSpace(v77);
        end;
        local v82 = nil;
        v82 = if v73 == v5.Min then v79 - 0.5 * v80 else if v73 == v5.Max then v79 + 0.5 * v80 else v79;
        local v83 = (v72.X and 1 or 0) + (v72.Y and 1 or 0) + (v72.Z and 1 or 0);
        local v84 = v75 * CFrame.new(v76);
        local v85 = {};
        if v83 == 3 then
            v29(v85, v84, v77, v82, getModifiedSize(getSmallestObjectSize(v78)));
        elseif v83 == 2 then
            v46(v85, v84, v77, v82, getDirection(v72), getModifiedSize(getSmallestObjectSize(v78)));
        elseif v83 == 1 then
            v60(v85, v84, v77, v82, getNormal(v72));
        end;
        v69(v85, v84, v77);
        return v2.createFragment(v85);
    end;
end;