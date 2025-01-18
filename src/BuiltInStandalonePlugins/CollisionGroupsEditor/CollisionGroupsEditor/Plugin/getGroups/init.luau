local l_PhysicsService_0 = game:GetService("PhysicsService");
local v1 = require(script.Parent.Constants);
local function v7(v2, v3) --[[ Line: 17 ]] --[[ Name: getCollisions ]]
    -- upvalues: l_PhysicsService_0 (copy)
    local v4 = {};
    for _, v6 in pairs(v3) do
        table.insert(v4, {
            Name = v6.name, 
            Collides = l_PhysicsService_0:CollisionGroupsAreCollidable(v2.name, v6.name)
        });
    end;
    return v4;
end;
local _ = function(v8) --[[ Line: 30 ]] --[[ Name: findDefault ]]
    for _, v10 in pairs(v8) do
        if v10.Name == "Default" then
            return v10;
        end;
    end;
    error("Default group not found");
end;
local function v18(v12) --[[ Line: 39 ]] --[[ Name: findOrCreateCursor ]]
    -- upvalues: v1 (copy)
    for _, v14 in v12 do
        if v14.Name == v1.CursorGroupName then
            return v14;
        end;
    end;
    local v15 = {
        Name = v1.CursorGroupName, 
        Id = v1.CursorGroupName, 
        Virtual = true, 
        Collisions = {
            {
                Name = v1.CursorGroupName, 
                Collides = true
            }
        }
    };
    for _, v17 in v12 do
        table.insert(v15.Collisions, {
            Name = v17.Name, 
            Collides = true
        });
        table.insert(v17.Collisions, {
            Name = v1.CursorGroupName, 
            Collides = true
        });
    end;
    return v15;
end;
local function v32(v19) --[[ Line: 72 ]] --[[ Name: sortGroups ]]
    -- upvalues: v18 (copy)
    local v20 = false;
    local v21;
    for _, v23 in pairs(v19) do
        if v23.Name == "Default" then
            v21 = v23;
            v20 = true;
        end;
        if v20 then
            break;
        end;
    end;
    if not v20 then
        error("Default group not found");
        v21 = nil;
    end;
    v20 = false;
    local v24 = v18(v19);
    local v25 = {};
    for _, v27 in pairs(v19) do
        if v27 ~= v21 and v27 ~= v24 then
            table.insert(v25, v27);
        end;
    end;
    table.sort(v25, function(v28, v29) --[[ Line: 82 ]]
        return v28.Name < v29.Name;
    end);
    local v30 = {
        v21, 
        v24
    };
    for v31 = 1, #v25 do
        table.insert(v30, v25[v31]);
    end;
    return v30;
end;
return function() --[[ Line: 94 ]] --[[ Name: getGroups ]]
    -- upvalues: l_PhysicsService_0 (copy), v7 (copy), v32 (copy)
    local v33 = {};
    local l_l_PhysicsService_0_RegisteredCollisionGroups_0 = l_PhysicsService_0:GetRegisteredCollisionGroups();
    for _, v36 in pairs(l_l_PhysicsService_0_RegisteredCollisionGroups_0) do
        table.insert(v33, {
            Name = v36.name, 
            Id = v36.name, 
            Collisions = v7(v36, l_l_PhysicsService_0_RegisteredCollisionGroups_0)
        });
    end;
    return (v32(v33));
end;