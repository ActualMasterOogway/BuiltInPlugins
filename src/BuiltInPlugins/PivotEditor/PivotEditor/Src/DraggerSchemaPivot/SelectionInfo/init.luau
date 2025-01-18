local _ = script.Parent.Parent.Parent;
local function v4(_, v2) --[[ Line: 3 ]] --[[ Name: computeInfo ]]
    local v3 = v2[1];
    if v3 and v3:IsA("PVInstance") then
        return {
            _primaryObject = v3, 
            _isEmpty = false, 
            _basisCFrame = v3:GetPivot()
        };
    else
        return {
            _primaryObject = nil, 
            _isEmpty = true, 
            _basisCFrame = CFrame.new()
        };
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy)
    return (setmetatable(v4(v6, v7), v5));
end;
v5.isEmpty = function(v8) --[[ Line: 28 ]] --[[ Name: isEmpty ]]
    return v8._isEmpty;
end;
v5.getBoundingBox = function(v9) --[[ Line: 32 ]] --[[ Name: getBoundingBox ]]
    return v9._basisCFrame, Vector3.new(), (Vector3.new());
end;
v5.doesContainItem = function(v10, v11) --[[ Line: 36 ]] --[[ Name: doesContainItem ]]
    local l__primaryObject_0 = v10._primaryObject;
    return not v10._isEmpty and (v11 == l__primaryObject_0 or v11:IsDescendantOf(v10._primaryObject));
end;
v5.getPrimaryObject = function(v13) --[[ Line: 41 ]] --[[ Name: getPrimaryObject ]]
    return v13._primaryObject;
end;
v5.isDynamic = function(_) --[[ Line: 45 ]] --[[ Name: isDynamic ]]
    return false;
end;
return v5;