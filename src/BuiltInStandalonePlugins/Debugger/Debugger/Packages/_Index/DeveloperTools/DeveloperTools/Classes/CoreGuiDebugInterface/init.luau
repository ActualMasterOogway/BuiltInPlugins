local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local l_CoreGui_0 = game:GetService("CoreGui");
return (v2:extend("CoreGuiDebugInterface", function(v4, v5) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_CoreGui_0 (copy), v2 (copy)
    local v6 = v1.new(l_CoreGui_0);
    local v7 = v2.new("CoreGui", v4, {
        v6
    });
    if v5 then
        spawn(function() --[[ Line: 14 ]]
            -- upvalues: v7 (copy), l_CoreGui_0 (ref), v5 (copy)
            v7:setGuiOptions({
                rootInstance = l_CoreGui_0:WaitForChild(v5.rootInstance, 10), 
                pickerParent = v5.pickerParent and l_CoreGui_0:WaitForChild(v5.pickerParent, 10) or nil, 
                rootPath = v5.rootPath or {
                    v5.rootInstance
                }
            });
        end);
        return v7;
    else
        v7:setGuiOptions({
            rootInstance = l_CoreGui_0, 
            pickerParent = l_CoreGui_0, 
            rootPath = {}
        });
        return v7;
    end;
end));