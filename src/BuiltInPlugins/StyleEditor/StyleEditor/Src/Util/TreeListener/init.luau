local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v1.join;
local v3 = {};
v3.new = function(v4, v5, v6, v7) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: l_join_0 (copy), v1 (copy), v3 (copy)
    local v8 = {
        connections = {}, 
        updateHierarchy = v5, 
        connectedProperties = v6, 
        instanceTypes = v7 or {
            "StyleBase"
        }
    };
    v8.isFilteredType = function(v9) --[[ Line: 20 ]]
        -- upvalues: v8 (copy)
        for _, v11 in v8.instanceTypes do
            if v9:IsA(v11) then
                return true;
            end;
        end;
        return false;
    end;
    v8.removeInstanceConnections = function(v12) --[[ Line: 29 ]]
        -- upvalues: v8 (copy)
        if v8.connections[v12] then
            for _, v14 in v8.connections[v12] do
                if v14 then
                    v14:Disconnect();
                end;
            end;
            v8.connections[v12] = nil;
        end;
    end;
    v8.addInstanceConnections = function(v15) --[[ Line: 40 ]]
        -- upvalues: v8 (copy), l_join_0 (ref)
        local l_connectedProperties_0 = v8.connectedProperties;
        if not l_connectedProperties_0 or not v15 then
            return;
        else
            local v17 = {};
            for _, v19 in l_connectedProperties_0 do
                if pcall(function() --[[ Line: 47 ]]
                    -- upvalues: v15 (copy), v19 (copy)
                    local _ = v15[v19];
                end) then
                    v17[v19] = v15:GetPropertyChangedSignal(v19):Connect(function() --[[ Line: 52 ]]
                        -- upvalues: v15 (copy), v8 (ref), v19 (copy)
                        if v15.Parent == nil then
                            v8.removeInstanceConnections(v15);
                        end;
                        v8.updateHierarchy(v15, "PropertyChanged", v19);
                    end);
                end;
            end;
            if v15:IsA("StyleRule") then
                v17.StyleRulePropertyChanged = v15.StyleRulePropertyChanged:Connect(function() --[[ Line: 61 ]]
                    -- upvalues: v8 (ref), v15 (copy)
                    v8.updateHierarchy(v15, "PropertyChanged");
                end);
            end;
            if v15:IsA("StyleSheet") then
                v17.StyleSheetCategoryChanged = v15:GetAttributeChangedSignal("StyleCategory"):Connect(function() --[[ Line: 69 ]]
                    -- upvalues: v8 (ref), v15 (copy)
                    v8.updateHierarchy(v15, "AttributeChanged");
                end);
            end;
            if v8.connections[v15] then
                v8.connections[v15] = l_join_0(v8.connections[v15], v17);
                return;
            else
                v8.connections[v15] = v17;
                return;
            end;
        end;
    end;
    v8.addRootInstanceConnections = function(v21) --[[ Line: 81 ]]
        -- upvalues: v8 (copy)
        if not v21 then
            return;
        else
            v8.connections[v21] = {
                descendantAdded = v21.DescendantAdded:Connect(function(v22) --[[ Line: 86 ]]
                    -- upvalues: v8 (ref), v21 (copy)
                    v8.addInstanceConnections(v22);
                    v8.updateHierarchy(v21, "DescendantAdded", v22);
                end), 
                descendantRemoving = v21.DescendantRemoving:Connect(function(v23) --[[ Line: 90 ]]
                    -- upvalues: v8 (ref), v21 (copy)
                    v8.removeInstanceConnections(v23);
                    v8.updateHierarchy(v21, "DescendantRemoving", v23);
                end), 
                instanceDestroying = v21.Destroying:Connect(function() --[[ Line: 94 ]]
                    -- upvalues: v8 (ref), v21 (copy)
                    v8.removeInstanceConnections(v21);
                    v8.updateHierarchy(v21, "Destroying");
                end)
            };
            v8.addInstanceConnections(v21);
            for _, v25 in (v21:GetDescendants()) do
                if v8.isFilteredType(v25) then
                    v8.addInstanceConnections(v25);
                end;
            end;
            return;
        end;
    end;
    v8.removeAllConnections = function() --[[ Line: 108 ]]
        -- upvalues: v8 (copy)
        if not v8.connections then
            return;
        else
            for v26, v27 in v8.connections do
                for _, v29 in v27 do
                    if v29 then
                        v29:Disconnect();
                    end;
                end;
                v8.connections[v26] = nil;
            end;
            return;
        end;
    end;
    v8.destroyListener = function() --[[ Line: 122 ]]
        -- upvalues: v8 (copy), v1 (ref)
        v8.removeAllConnections();
        v8.connectedProperties = {};
        v8.updateHierarchy = v1.noop;
    end;
    for _, v31 in v4 do
        v8.addRootInstanceConnections(v31);
    end;
    return (setmetatable(v8, {
        __index = v3
    }));
end;
return v3;