local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.SetOwnerUsername);
local _ = require(l_Parent_0.Core.Util.getUserId);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), v2 (ref)
        spawn(function() --[[ Line: 10 ]]
            -- upvalues: v4 (ref), v5 (copy), v2 (ref)
            local l_NameFromUserIdAsync_0 = game:GetService("Players"):GetNameFromUserIdAsync(v4);
            if l_NameFromUserIdAsync_0 then
                v5:dispatch(v2(l_NameFromUserIdAsync_0));
            end;
        end);
    end;
end;