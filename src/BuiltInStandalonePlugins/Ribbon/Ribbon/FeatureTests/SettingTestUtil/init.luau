local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return {
    act = function(v2, v3) --[[ Line: 9 ]] --[[ Name: act ]]
        local v4 = coroutine.running();
        task.defer(function() --[[ Line: 13 ]]
            -- upvalues: v2 (copy), v4 (copy), v3 (copy)
            plugin:GetPluginComponent("Settings"):BindAsync(v2):Once(function() --[[ Line: 16 ]]
                -- upvalues: v4 (ref)
                task.defer(v4);
            end);
            v3();
        end);
        coroutine.yield();
    end
};