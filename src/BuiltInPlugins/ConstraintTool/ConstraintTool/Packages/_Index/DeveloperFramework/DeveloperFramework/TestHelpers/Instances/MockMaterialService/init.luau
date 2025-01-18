local l_Parent_0 = script:FindFirstAncestor("TestHelpers").Parent;
local v1 = require(l_Parent_0.Util.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    for _, v6 in v3:getDescendants() do
        if v6:IsA("MaterialVariant") then
            v4[v6.Name] = {};
            v4[v6.Name][v6.BaseMaterial] = v6;
        end;
    end;
    local v7 = setmetatable({
        _materialOverrideChangedSignals = {}, 
        _materialOverrides = {}, 
        _materialVariants = {}, 
        OverrideStatusChanged = v1.new(), 
        _serviceInstance = v3, 
        Use2022Materials = false
    }, v2);
    v7._descendantAddedConnection = v3.DescendantAdded:Connect(function(v8) --[[ Line: 27 ]]
        -- upvalues: v7 (copy)
        if v8:IsA("MaterialVariant") then
            if v7._materialVariants[v8.Name] then
                v7._materialVariants[v8.Name][v8.BaseMaterial] = v8;
                return;
            else
                v7._materialVariants[v8.Name] = {};
                v7._materialVariants[v8.Name][v8.BaseMaterial] = v8;
            end;
        end;
    end);
    v7._descendantRemovingConnection = v3.DescendantRemoving:Connect(function(v9) --[[ Line: 38 ]]
        -- upvalues: v7 (copy)
        if v9:IsA("MaterialVariant") and v7._materialVariants[v9.Name] then
            v7._materialVariants[v9.Name][v9.BaseMaterial] = nil;
        end;
    end);
    return v7;
end;
v2.Destroy = function(v10) --[[ Line: 49 ]] --[[ Name: Destroy ]]
    v10._descendantAddedConnection:Disconnect();
    v10._descendantRemovingConnection:Disconnect();
end;
v2.GetMaterialOverrideChanged = function(v11, v12) --[[ Line: 54 ]] --[[ Name: GetMaterialOverrideChanged ]]
    -- upvalues: v1 (copy)
    if not v11._materialOverrideChangedSignals[v12] then
        v11._materialOverrideChangedSignals[v12] = v1.new();
    end;
    return v11._materialOverrideChangedSignals[v12];
end;
v2.GetMaterialVariant = function(v13, v14, v15) --[[ Line: 62 ]] --[[ Name: GetMaterialVariant ]]
    if v13._materialVariants[v15] then
        return v13._materialVariants[v15][v14];
    else
        return nil;
    end;
end;
v2.GetOverrideStatus = function(_, _) --[[ Line: 70 ]] --[[ Name: GetOverrideStatus ]]
    return Enum.PropertyStatus.Ok;
end;
v2.GetBaseMaterialOverride = function(v18, v19) --[[ Line: 74 ]] --[[ Name: GetBaseMaterialOverride ]]
    return v18._materialOverrides[v19] or "";
end;
v2.SetBaseMaterialOverride = function(v20, v21, v22) --[[ Line: 78 ]] --[[ Name: SetBaseMaterialOverride ]]
    local v23 = v20._materialOverrides[v21];
    v20._materialOverrides[v21] = v22;
    if v23 ~= v22 then
        v20._materialOverrides[v21] = v22;
        if v20._materialOverrideChangedSignals[v21] then
            v20._materialOverrideChangedSignals[v21]:Fire();
        end;
    end;
end;
return v2;