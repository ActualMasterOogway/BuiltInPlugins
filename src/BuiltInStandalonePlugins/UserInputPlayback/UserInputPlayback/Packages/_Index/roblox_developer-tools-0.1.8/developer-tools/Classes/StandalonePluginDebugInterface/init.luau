local l_Parent_0 = script.Parent.Parent;
local _ = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Classes.PluginEventBridge);
local v3 = require(l_Parent_0.Classes.DebugInterface);
return (v3:extend("StandalonePluginDebugInterface", function(v4, v5, v6) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v7 = v2.new(v5);
    local v8 = v3.new("StandalonePlugin", v4, {
        v7
    });
    v8:setGuiOptions(v6);
    return v8;
end));