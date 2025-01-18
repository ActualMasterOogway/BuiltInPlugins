local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local function v9(v2) --[[ Line: 6 ]] --[[ Name: getCollaborators ]]
    local v3 = {};
    local l_status_0, _ = pcall(function() --[[ Line: 10 ]]
        -- upvalues: v3 (ref), v2 (copy)
        v3 = v2:GetCollaboratorsList();
    end);
    local v6 = if not l_status_0 then {} else {};
    for _, v8 in pairs(v3) do
        table.insert(v6, v8.UserId);
    end;
    return v6;
end;
return function() --[[ Line: 25 ]] --[[ Name: useCollaborators ]]
    -- upvalues: v1 (copy), v9 (copy)
    local v10 = v1.useMemo(function() --[[ Line: 26 ]]
        return game:GetService("CollaboratorsService");
    end, {});
    local v11, v12 = v1.useState({});
    v1.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v12 (copy), v9 (ref), v10 (copy)
        v12((v9(v10)));
        local v13 = v10.CollaboratorInstanceCreatedSignal:Connect(function() --[[ Line: 34 ]]
            -- upvalues: v12 (ref), v9 (ref), v10 (ref)
            v12((v9(v10)));
        end);
        local v14 = v10.CollaboratorInstanceDestroyedSignal:Connect(function() --[[ Line: 37 ]]
            -- upvalues: v12 (ref), v9 (ref), v10 (ref)
            v12((v9(v10)));
        end);
        return function() --[[ Line: 40 ]]
            -- upvalues: v13 (copy), v14 (copy)
            v13:Disconnect();
            v14:Disconnect();
        end;
    end, {});
    return v11;
end;