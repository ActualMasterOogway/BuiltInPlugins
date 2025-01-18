local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_values_0 = require(l_script_FirstAncestor_0.Packages.Dash).values;
local l_insert_0 = table.insert;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Plugin_0 = v4.ContextServices.Plugin;
local v6 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
if require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)() then
    return v4.UI.Hooks.useWidgets;
else
    local v7 = {
        Widgets = nil, 
        pendingRegisters = {}, 
        pendingDeregisters = {}, 
        registeredWidgets = {}, 
        running = false
    };
    v7.flush = function(v8) --[[ Line: 28 ]] --[[ Name: flush ]]
        -- upvalues: l_insert_0 (copy), v7 (copy), l_values_0 (copy)
        local v9 = {};
        for v10, v11 in v8.pendingDeregisters do
            l_insert_0(v9, v11);
            v7.registeredWidgets[v10] = nil;
        end;
        if #v9 > 0 then
            pcall(function() --[[ Line: 35 ]]
                -- upvalues: v8 (copy), v9 (copy)
                v8.Widgets:DeregisterAsync(v9);
            end);
        end;
        v8.pendingDeregisters = {};
        local v12 = l_values_0(v8.pendingRegisters);
        if #v12 > 0 then
            v8.Widgets:RegisterAsync(v12);
            v8.pendingRegisters = {};
        end;
    end;
    v7.run = function(_) --[[ Line: 51 ]] --[[ Name: run ]]
        -- upvalues: v7 (copy)
        if v7.running then
            return;
        else
            v7.running = true;
            task.defer(function() --[[ Line: 56 ]]
                -- upvalues: v7 (ref)
                v7.running = false;
                v7:flush();
            end);
            return;
        end;
    end;
    v7.register = function(v14, v15, v16) --[[ Line: 62 ]] --[[ Name: register ]]
        -- upvalues: v6 (copy), v7 (copy)
        local l_v16_FirstAncestor_0 = v16:FindFirstAncestor("PluginGui");
        if l_v16_FirstAncestor_0 then
            local v18 = v6.toString(v15);
            v14.registeredWidgets[v18] = v16;
            v14.pendingRegisters[v18] = {
                Uri = v15, 
                Widget = v16, 
                DEPRECATED_PluginGui = l_v16_FirstAncestor_0
            };
            v14.pendingDeregisters[v18] = nil;
            v7:run();
        end;
    end;
    v7.deregister = function(v19, v20) --[[ Line: 73 ]] --[[ Name: deregister ]]
        -- upvalues: v6 (copy), v7 (copy)
        v19.pendingDeregisters[v6.toString(v20)] = v20;
        v7:run();
    end;
    return function() --[[ Line: 78 ]] --[[ Name: useWidgets ]]
        -- upvalues: l_Plugin_0 (copy), v7 (copy)
        v7.Widgets = l_Plugin_0.use():get():GetPluginComponent("Widgets");
        return v7;
    end;
end;