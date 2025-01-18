local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local l_Promise_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Promise;
local l_plugin_PluginComponent_0 = plugin:GetPluginComponent("Actions");
local l_Selection_0 = game:GetService("Selection");
return {
    testAsync = function(v4, v5) --[[ Line: 13 ]] --[[ Name: testAsync ]]
        -- upvalues: l_Promise_0 (copy)
        return function() --[[ Line: 14 ]]
            -- upvalues: l_Promise_0 (ref), v4 (copy), v5 (copy)
            return l_Promise_0:resolve():andThen(function() --[[ Line: 15 ]]
                -- upvalues: v4 (ref), v5 (ref)
                v4.register(plugin);
                v5();
                v4.deregister();
            end);
        end;
    end, 
    act = function(v6) --[[ Line: 23 ]] --[[ Name: act ]]
        -- upvalues: l_plugin_PluginComponent_0 (copy)
        local v7 = false;
        l_plugin_PluginComponent_0:BindToActivatedAsync(v6):Once(function() --[[ Line: 25 ]]
            -- upvalues: v7 (ref)
            v7 = true;
        end);
        l_plugin_PluginComponent_0:ActivateAsync(v6);
        while not v7 do
            task.wait();
        end;
    end, 
    actUntilSelected = function(v8) --[[ Line: 34 ]] --[[ Name: actUntilSelected ]]
        -- upvalues: l_Selection_0 (copy), l_plugin_PluginComponent_0 (copy)
        local v9 = false;
        l_Selection_0.SelectionChanged:Once(function() --[[ Line: 36 ]]
            -- upvalues: v9 (ref)
            v9 = true;
        end);
        l_plugin_PluginComponent_0:ActivateAsync(v8);
        while not v9 do
            task.wait();
        end;
    end
};