local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.Services);
return (v2:extend("LibraryDebuggerInterface", function(v4, v5) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v6 = v1.new(v3.getCoreGui());
    local v7 = v2.new("Library", v4, {
        v6
    });
    v7:setGuiOptions(v5 or {
        rootInstance = game:GetService("ReplicatedStorage")
    });
    return v7;
end));