local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_some_0 = require(l_Parent_0.Packages.Dash).some;
local l_insert_0 = table.insert;
local v3 = require(script.Parent.TutorialStep).extend("Edit");
v3.showComplete = true;
v3.bind = function(v4) --[[ Line: 13 ]] --[[ Name: bind ]]
    -- upvalues: l_insert_0 (copy)
    local l_Workspace_0 = v4.tutorial.dataModel:GetService("Workspace");
    v4.connections = {};
    v4.watches = {};
    local v11 = v4.tutorial:syncChildren(l_Workspace_0, v4.data.className, function(v6) --[[ Line: 18 ]]
        -- upvalues: v4 (copy), l_insert_0 (ref)
        local v7 = {};
        for v8, v9 in v4.data.changes do
            if v8 == "Attributes" then
                v7.Attributes = {};
                for v10 in v9 do
                    v7.Attributes[v10] = v6:GetAttribute(v10);
                end;
            else
                v7[v8] = v6[v8];
            end;
        end;
        l_insert_0(v4.watches, {
            instance = v6, 
            initialValues = v7
        });
        l_insert_0(v4.connections, v6.Changed:Connect(function() --[[ Line: 36 ]]
            -- upvalues: v4 (ref)
            v4:update();
        end));
    end);
    l_insert_0(v4.connections, v11);
end;
v3.update = function(v12) --[[ Line: 45 ]] --[[ Name: update ]]
    -- upvalues: l_some_0 (copy)
    if l_some_0(v12.watches, function(v13) --[[ Line: 46 ]]
        -- upvalues: l_some_0 (ref), v12 (copy)
        return not l_some_0(v12.data.changes, function(v14, v15) --[[ Line: 47 ]]
            -- upvalues: l_some_0 (ref), v13 (copy)
            if v15 == "Attributes" then
                return (l_some_0(v14, function(v16, v17) --[[ Line: 49 ]]
                    -- upvalues: v13 (ref), v14 (copy)
                    if v16 == true then
                        return v13.instance:GetAttribute(v17) == v13.initialValues.Attributes[v17];
                    else
                        return v13.instance:GetAttribute(v17) ~= v14;
                    end;
                end));
            elseif v14 == true then
                return v13.instance[v15] == v13.initialValues[v15];
            else
                return v13.instance[v15] ~= v14;
            end;
        end);
    end) then
        v12:complete();
    end;
end;
v3.unbind = function(v18) --[[ Line: 72 ]] --[[ Name: unbind ]]
    for _, v20 in ipairs(v18.connections) do
        v20:Disconnect();
    end;
end;
return v3;