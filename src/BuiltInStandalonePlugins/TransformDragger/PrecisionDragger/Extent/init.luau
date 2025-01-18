local v0 = require(script.Parent.Utility);
unionVector3 = function(v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: unionVector3 ]]
    if not v1 then
        return v2, v3;
    else
        v1 = v4:pointToObjectSpace(v1);
        v2 = if not v2 then v1 else v4:pointToObjectSpace(v2);
        v3 = if not v3 then v1 else v4:pointToObjectSpace(v3);
        if v1.x < v2.x then
            v2 = Vector3.new(v1.x, v2.y, v2.z);
        end;
        if v1.y < v2.y then
            v2 = Vector3.new(v2.x, v1.y, v2.z);
        end;
        if v1.z < v2.z then
            v2 = Vector3.new(v2.x, v2.y, v1.z);
        end;
        if v1.x > v3.x then
            v3 = Vector3.new(v1.x, v3.y, v3.z);
        end;
        if v1.y > v3.y then
            v3 = Vector3.new(v3.x, v1.y, v3.z);
        end;
        if v1.z > v3.z then
            v3 = Vector3.new(v3.x, v3.y, v1.z);
        end;
        return v4:pointToWorldSpace(v2), (v4:pointToWorldSpace(v3));
    end;
end;
unionTuple = function(v5, v6, v7, _) --[[ Line: 47 ]] --[[ Name: unionTuple ]]
    -- upvalues: v0 (copy)
    if not v5.Lower and not v5.Upper then
        return {
            Lower = nil, 
            Upper = nil
        };
    else
        if not v6 then
            v6 = v5.Lower;
        end;
        if not v7 then
            v7 = v5.Upper;
        end;
        v6 = v0.minVector3(v5.Lower, v6);
        v7 = v0.maxVector3(v5.Upper, v7);
        return {
            Lower = v6, 
            Upper = v7
        };
    end;
end;
local v9 = 0;
unionVector3NoSpaceChange = function(v10, v11, v12) --[[ Line: 67 ]] --[[ Name: unionVector3NoSpaceChange ]]
    if not v10 then
        return v11, v12;
    else
        if not v11 then
            v11 = v10;
        end;
        if not v12 then
            v12 = v10;
        end;
        if v10.x < v11.x then
            v11 = Vector3.new(v10.x, v11.y, v11.z);
        end;
        if v10.y < v11.y then
            v11 = Vector3.new(v11.x, v10.y, v11.z);
        end;
        if v10.z < v11.z then
            v11 = Vector3.new(v11.x, v11.y, v10.z);
        end;
        if v10.x > v12.x then
            v12 = Vector3.new(v10.x, v12.y, v12.z);
        end;
        if v10.y > v12.y then
            v12 = Vector3.new(v12.x, v10.y, v12.z);
        end;
        if v10.z > v12.z then
            v12 = Vector3.new(v12.x, v12.y, v10.z);
        end;
        return v11, v12;
    end;
end;
getPartBounds = function(v13, v14) --[[ Line: 99 ]] --[[ Name: getPartBounds ]]
    local v15 = v13.Size / 2;
    local v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, -1, -1, 0)), nil, nil, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, -1, 1, 0)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, 1, -1, 0)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(-1, 1, 1, 0)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, -1, -1, 0)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, -1, 1, 0)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, 1, -1, 0)), v16, v17, v14);
    v16, v17 = unionVector3(v13.CFrame:pointToWorldSpace(v15 * Vector3.new(1, 1, 1, 0)), v16, v17, v14);
    return v16, v17;
end;
getExtentsRecursive = function(v18, v19) --[[ Line: 160 ]] --[[ Name: getExtentsRecursive ]]
    -- upvalues: v9 (ref)
    v9 = v9 + 1;
    local v20 = nil;
    local v21 = nil;
    local l_v18_Children_0 = v18:GetChildren();
    for _, v24 in ipairs(l_v18_Children_0) do
        local v25 = getExtentsRecursive(v24, v19);
        local v26, v27 = unionVector3(v25.Lower, v20, v21, v19);
        v26, v27 = unionVector3(v25.Upper, v26, v27, v19);
        v20 = v26;
        v21 = v27;
    end;
    if v18:IsA("BasePart") then
        local v28 = v18.Size / 2;
        local v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(-1, -1, -1, 0)), v20, v21, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(-1, -1, 1, 0)), v29, v30, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(-1, 1, -1, 0)), v29, v30, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(-1, 1, 1, 0)), v29, v30, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(1, -1, -1, 0)), v29, v30, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(1, -1, 1, 0)), v29, v30, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(1, 1, -1, 0)), v29, v30, v19);
        v29, v30 = unionVector3(v18.CFrame:pointToWorldSpace(v28 * Vector3.new(1, 1, 1, 0)), v29, v30, v19);
        v20 = v29;
        v21 = v30;
    end;
    v9 = v9 - 1;
    return {
        Lower = v20, 
        Upper = v21
    };
end;
local function v40(v31) --[[ Line: 232 ]] --[[ Name: getExtentsOfSelection ]]
    local v32 = game:GetService("Selection"):Get();
    local v33 = nil;
    local v34 = nil;
    for _, v36 in ipairs(v32) do
        if v36.Parent and v36.Parent.Parent and v36:IsDescendantOf(workspace) then
            local v37 = getExtentsRecursive(v36, v31);
            local v38, v39 = unionVector3(v37.Lower, v33, v34, v31);
            v38, v39 = unionVector3(v37.Upper, v38, v39, v31);
            v33 = v38;
            v34 = v39;
        end;
    end;
    if not v33 or not v34 then
        v33 = v31.p;
        v34 = v31.p;
    end;
    return v33, v34;
end;
local _ = require(script.Parent.FuzzyMath);
getExtentsOfList = function(v42, v43) --[[ Line: 256 ]] --[[ Name: getExtentsOfList ]]
    local v44 = nil;
    local v45 = nil;
    for _, v47 in ipairs(v42) do
        local v48 = getExtentsRecursive(v47, v43);
        local v49, v50 = unionVector3(v48.Lower, v44, v45, v43);
        v49, v50 = unionVector3(v48.Upper, v49, v50, v43);
        v44 = v49;
        v45 = v50;
    end;
    if not v44 then
        v44 = Vector3.new(0, 0, 0, 0);
    end;
    if not v45 then
        v45 = Vector3.new(0, 0, 0, 0);
    end;
    v44 = v43:pointToObjectSpace(v44);
    v45 = v43:pointToObjectSpace(v45);
    return {
        Lower = v44, 
        Upper = v45
    };
end;
getExtents = function(v51) --[[ Line: 281 ]] --[[ Name: getExtents ]]
    -- upvalues: v40 (copy)
    local v52, v53 = v40(v51);
    v52 = v51:pointToObjectSpace(v52);
    v53 = v51:pointToObjectSpace(v53);
    return {
        Lower = v52, 
        Upper = v53
    };
end;
extentsToCFrameAndSize = function(v54, v55) --[[ Line: 289 ]] --[[ Name: extentsToCFrameAndSize ]]
    -- upvalues: v0 (copy)
    if not v54.Lower or not v54.Upper then
        return nil, nil;
    else
        local v56 = v0.absVector3(v54.Upper - v54.Lower);
        local v57 = v54.Lower + v56 / 2;
        return v55:toWorldSpace(CFrame.new(v57)), v56;
    end;
end;
setPartCFrameToExtents = function(v58, v59) --[[ Line: 300 ]] --[[ Name: setPartCFrameToExtents ]]
    local v60 = nil;
    v60 = v59 or CFrame.new((Vector3.new(0, 0, 0, 0)));
    local v61, v62 = extentsToCFrameAndSize(getExtents(v60), v60);
    if v62 then
        v58.Size = v62;
    end;
    if v61 then
        v58.CFrame = v61;
    end;
end;
return {
    setPartCFrameToExtents = setPartCFrameToExtents, 
    unionVector3NoSpaceChange = unionVector3NoSpaceChange, 
    getPartBounds = getPartBounds, 
    getCFrameOfList = function(v63, v64) --[[ Line: 319 ]] --[[ Name: getCFrameOfList ]]
        local v65 = getExtentsOfList(v63, v64);
        return (extentsToCFrameAndSize(v65, v64));
    end, 
    getSizeOfList = function(v66, v67) --[[ Line: 325 ]] --[[ Name: getSizeOfList ]]
        local v68 = getExtentsOfList(v66, v67);
        local _, v70 = extentsToCFrameAndSize(v68, v67);
        return v70;
    end, 
    getCFrameAndSizeOfList = function(v71, v72) --[[ Line: 331 ]] --[[ Name: getCFrameAndSizeOfList ]]
        local v73 = getExtentsOfList(v71, v72);
        return extentsToCFrameAndSize(v73, v72);
    end
};