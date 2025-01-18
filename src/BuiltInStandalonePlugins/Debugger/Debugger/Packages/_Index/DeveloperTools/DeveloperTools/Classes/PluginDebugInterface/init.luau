local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.Services);
return (v2:extend("PluginDebugInterface", function(v4, _, v6) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v7 = v1.new(v3.getStudioService());
    local v8 = v2.new("Plugin", v4, {
        v7
    });
    if v6 then
        v8:setGuiOptions({
            rootInstance = v6
        });
        return v8;
    else
        spawn(function() --[[ Line: 20 ]]
            -- upvalues: v3 (ref), v4 (copy), v8 (copy)
            local v9 = v3.getRobloxPluginGuiService():WaitForChild(v4, 10);
            if v9 then
                v8:setGuiOptions({
                    rootInstance = v9
                });
            end;
        end);
        return v8;
    end;
end));