local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local _ = require(l_Parent_0.Types);
local l_values_0 = require(l_Parent_0.Parent.Dash).values;
local l_insert_0 = table.insert;
local l_Plugin_0 = require(l_Parent_0.ContextServices).Plugin;
local v5 = require(l_Parent_0.Util.StudioUri);
local v6 = {
    Widgets = nil, 
    pendingRegisters = {}, 
    pendingDeregisters = {}, 
    registeredWidgets = {}, 
    running = false
};
v6.flush = function(v7) --[[ Line: 28 ]] --[[ Name: flush ]]
    -- upvalues: l_insert_0 (copy), v6 (copy), l_values_0 (copy)
    local v8 = {};
    for v9, v10 in v7.pendingDeregisters do
        l_insert_0(v8, v10);
        v6.registeredWidgets[v9] = nil;
    end;
    if #v8 > 0 then
        pcall(function() --[[ Line: 35 ]]
            -- upvalues: v7 (copy), v8 (copy)
            v7.Widgets:DeregisterAsync(v8);
        end);
    end;
    v7.pendingDeregisters = {};
    local v11 = l_values_0(v7.pendingRegisters);
    if #v11 > 0 then
        v7.Widgets:RegisterAsync(v11);
        v7.pendingRegisters = {};
    end;
end;
v6.run = function(_) --[[ Line: 51 ]] --[[ Name: run ]]
    -- upvalues: v6 (copy)
    if v6.running then
        return;
    else
        v6.running = true;
        task.defer(function() --[[ Line: 56 ]]
            -- upvalues: v6 (ref)
            v6.running = false;
            v6:flush();
        end);
        return;
    end;
end;
v6.register = function(v13, v14, v15) --[[ Line: 62 ]] --[[ Name: register ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v16 = v15:FindFirstAncestor("PluginGui") or v15:FindFirstAncestor("ScreenGui");
    if v16 then
        local v17 = v5.toString(v14);
        v13.registeredWidgets[v17] = v15;
        v13.pendingRegisters[v17] = {
            Uri = v14, 
            Widget = v15, 
            DEPRECATED_PluginGui = v16
        };
        v13.pendingDeregisters[v17] = nil;
        v6:run();
    end;
end;
v6.deregister = function(v18, v19) --[[ Line: 74 ]] --[[ Name: deregister ]]
    -- upvalues: v5 (copy), v6 (copy)
    v18.pendingDeregisters[v5.toString(v19)] = v19;
    v6:run();
end;
return function() --[[ Line: 79 ]] --[[ Name: useWidgets ]]
    -- upvalues: l_Plugin_0 (copy), v6 (copy)
    v6.Widgets = l_Plugin_0.use():get():GetPluginComponent("Widgets");
    return v6;
end;