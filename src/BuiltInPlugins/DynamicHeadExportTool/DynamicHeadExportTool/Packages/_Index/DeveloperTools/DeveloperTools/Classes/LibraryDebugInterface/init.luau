local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local v3 = require(l_Parent_0.Services);
return (v2:extend("LibraryDebuggerInterface", function(v4, v5) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v6 = nil;
    pcall(function() --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v6 (ref)
        local v7 = v3.getCoreGui();
        if v7:IsA("BasePlayerGui") then
            v6 = v7;
        end;
    end);
    pcall(function() --[[ Line: 22 ]]
        -- upvalues: v6 (ref)
        v6 = game:GetService("ReplicatedStorage");
    end);
    if not v6 then
        v6 = Instance.new("Folder");
    end;
    local v8 = v1.new(v6);
    local v9 = v2.new("Library", v4, {
        v8
    });
    v9:setGuiOptions(v5 or {
        rootInstance = game:GetService("ReplicatedStorage")
    });
    return v9;
end));