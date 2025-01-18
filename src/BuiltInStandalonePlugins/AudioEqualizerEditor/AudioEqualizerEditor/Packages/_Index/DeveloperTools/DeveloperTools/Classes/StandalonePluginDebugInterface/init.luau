local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.PluginEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
return (v2:extend("StandalonePluginDebugInterface", function(v3, v4, v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = v1.new(v4);
    local v7 = v2.new("StandalonePlugin", v3, {
        v6
    });
    v7:setGuiOptions(v5);
    return v7;
end));